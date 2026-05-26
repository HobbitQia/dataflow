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
  func.func @softmax_exp(%arg0: memref<32xi32>, %arg1: memref<32xi32>) {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<32xi32>) dependency_write_in(%arg1 : memref<32xi32>) [original_read_memrefs(%arg0 : memref<32xi32>), original_write_memrefs(%arg1 : memref<32xi32>)] : (memref<32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg2: memref<32xi32>, %arg3: memref<32xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<32xi32>, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate"} {
      ^bb0(%arg4: memref<32xi32>, %arg5: memref<32xi32>):
        %1 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
        %2 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = neura.load_indexed [%2 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %4 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.mul"(%4, %5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.add"(%7) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %9 to [%10 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %11 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = "neura.add"(%11) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = "neura.data_mov"(%14) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%14) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.mul"(%15, %16) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %19 = "neura.add"(%18) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %20 = "neura.data_mov"(%19) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %21 = "neura.data_mov"(%12) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %20 to [%21 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %22 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %23 = "neura.add"(%22) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %24 = "neura.data_mov"(%23) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %25 = neura.load_indexed [%24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %27 = "neura.data_mov"(%25) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %28 = "neura.mul"(%26, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.add"(%29) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%23) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %31 to [%32 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %33 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.add"(%33) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.mul"(%37, %38) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %41 = "neura.add"(%40) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %42 = "neura.data_mov"(%41) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %43 = "neura.data_mov"(%34) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %42 to [%43 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %44 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %45 = "neura.add"(%44) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %46 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %47 = neura.load_indexed [%46 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %48 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %49 = "neura.data_mov"(%47) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %50 = "neura.mul"(%48, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %52 = "neura.add"(%51) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.data_mov"(%45) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %53 to [%54 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %55 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %56 = "neura.add"(%55) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %57 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = neura.load_indexed [%57 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %60 = "neura.data_mov"(%58) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %61 = "neura.mul"(%59, %60) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.add"(%62) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%63) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %65 = "neura.data_mov"(%56) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %64 to [%65 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %66 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.add"(%66) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %69 = neura.load_indexed [%68 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %70 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%69) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.mul"(%70, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %73 = "neura.data_mov"(%72) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %74 = "neura.add"(%73) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %76 = "neura.data_mov"(%67) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %75 to [%76 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %77 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %78 = "neura.add"(%77) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %80 = neura.load_indexed [%79 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %81 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %82 = "neura.data_mov"(%80) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %83 = "neura.mul"(%81, %82) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %85 = "neura.add"(%84) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%78) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %86 to [%87 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %88 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.add"(%88) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %92 = "neura.data_mov"(%91) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %93 = "neura.data_mov"(%91) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.mul"(%92, %93) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.add"(%95) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%89) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %97 to [%98 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %99 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = "neura.add"(%99) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.data_mov"(%100) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = neura.load_indexed [%101 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %103 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %105 = "neura.mul"(%103, %104) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %106 = "neura.data_mov"(%105) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %107 = "neura.add"(%106) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.data_mov"(%107) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%100) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %108 to [%109 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %110 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.add"(%110) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = "neura.data_mov"(%111) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %113 = neura.load_indexed [%112 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %114 = "neura.data_mov"(%113) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %115 = "neura.data_mov"(%113) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %116 = "neura.mul"(%114, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.add"(%117) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.data_mov"(%111) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %119 to [%120 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %121 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %122 = "neura.add"(%121) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %123 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = neura.load_indexed [%123 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %125 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %126 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %127 = "neura.mul"(%125, %126) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %128 = "neura.data_mov"(%127) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %129 = "neura.add"(%128) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %130 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %130 to [%131 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %132 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %133 = "neura.add"(%132) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %134 = "neura.data_mov"(%133) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %135 = neura.load_indexed [%134 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %136 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %137 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %138 = "neura.mul"(%136, %137) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %139 = "neura.data_mov"(%138) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %140 = "neura.add"(%139) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %141 = "neura.data_mov"(%140) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %142 = "neura.data_mov"(%133) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %141 to [%142 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %143 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %144 = "neura.add"(%143) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%144) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = neura.load_indexed [%145 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %147 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %148 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %149 = "neura.mul"(%147, %148) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.add"(%150) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%144) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %152 to [%153 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %154 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %155 = "neura.add"(%154) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%155) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = neura.load_indexed [%156 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %158 = "neura.data_mov"(%157) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %159 = "neura.data_mov"(%157) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %160 = "neura.mul"(%158, %159) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161 = "neura.data_mov"(%160) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %162 = "neura.add"(%161) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %163 = "neura.data_mov"(%162) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %164 = "neura.data_mov"(%155) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %163 to [%164 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
        %165 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %166 = "neura.add"(%165) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %167 = "neura.data_mov"(%166) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %168 = neura.load_indexed [%167 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %169 = "neura.data_mov"(%168) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %170 = "neura.data_mov"(%168) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %171 = "neura.mul"(%169, %170) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %172 = "neura.data_mov"(%171) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %173 = "neura.add"(%172) {rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %174 = "neura.data_mov"(%173) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %175 = "neura.data_mov"(%166) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %174 to [%175 : !neura.data<index, i1>]  {rhs_value = "%input1"} : !neura.data<i32, i1>
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
        %3 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = neura.load_indexed [%3 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %5 = "neura.data_mov"(%4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.div"(%5) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %7 to [%8 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %10 = "neura.add"(%9) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %11 = "neura.data_mov"(%10) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = "neura.data_mov"(%12) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.div"(%13) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%14) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%10) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %15 to [%16 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %18 = "neura.add"(%17) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %19 = "neura.data_mov"(%18) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %20 = neura.load_indexed [%19 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = "neura.data_mov"(%20) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %22 = "neura.div"(%21) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %23 = "neura.data_mov"(%22) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %24 = "neura.data_mov"(%18) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %23 to [%24 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.add"(%25) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %27 = "neura.data_mov"(%26) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %28 = neura.load_indexed [%27 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = "neura.data_mov"(%28) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %30 = "neura.div"(%29) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %31 = "neura.data_mov"(%30) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %32 = "neura.data_mov"(%26) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %31 to [%32 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %33 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %34 = "neura.add"(%33) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %35 = "neura.data_mov"(%34) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %36 = neura.load_indexed [%35 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %37 = "neura.data_mov"(%36) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %38 = "neura.div"(%37) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %39 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %40 = "neura.data_mov"(%34) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %39 to [%40 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %41 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %42 = "neura.add"(%41) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%42) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %44 = neura.load_indexed [%43 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %45 = "neura.data_mov"(%44) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %46 = "neura.div"(%45) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %48 = "neura.data_mov"(%42) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %47 to [%48 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %49 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %50 = "neura.add"(%49) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %51 = "neura.data_mov"(%50) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %52 = neura.load_indexed [%51 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %53 = "neura.data_mov"(%52) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %54 = "neura.div"(%53) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %55 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %56 = "neura.data_mov"(%50) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %55 to [%56 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %57 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %58 = "neura.add"(%57) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %59 = "neura.data_mov"(%58) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = neura.load_indexed [%59 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %61 = "neura.data_mov"(%60) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %62 = "neura.div"(%61) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %63 = "neura.data_mov"(%62) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %64 = "neura.data_mov"(%58) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %63 to [%64 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %65 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %66 = "neura.add"(%65) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %67 = "neura.data_mov"(%66) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %68 = neura.load_indexed [%67 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %69 = "neura.data_mov"(%68) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %70 = "neura.div"(%69) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %71 = "neura.data_mov"(%70) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %72 = "neura.data_mov"(%66) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %71 to [%72 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %73 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %74 = "neura.add"(%73) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %75 = "neura.data_mov"(%74) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %76 = neura.load_indexed [%75 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %77 = "neura.data_mov"(%76) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %78 = "neura.div"(%77) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %79 = "neura.data_mov"(%78) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %80 = "neura.data_mov"(%74) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %79 to [%80 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %81 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %82 = "neura.add"(%81) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %83 = "neura.data_mov"(%82) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %84 = neura.load_indexed [%83 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %85 = "neura.data_mov"(%84) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.div"(%85) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%86) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %88 = "neura.data_mov"(%82) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %87 to [%88 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %89 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.add"(%89) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = "neura.data_mov"(%90) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %92 = neura.load_indexed [%91 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %93 = "neura.data_mov"(%92) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %94 = "neura.div"(%93) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.data_mov"(%90) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %95 to [%96 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %97 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %98 = "neura.add"(%97) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %99 = "neura.data_mov"(%98) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = neura.load_indexed [%99 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %101 = "neura.data_mov"(%100) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %102 = "neura.div"(%101) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %103 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %104 = "neura.data_mov"(%98) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %103 to [%104 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %105 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %106 = "neura.add"(%105) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %107 = "neura.data_mov"(%106) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %108 = neura.load_indexed [%107 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %109 = "neura.data_mov"(%108) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %110 = "neura.div"(%109) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %111 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %112 = "neura.data_mov"(%106) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %111 to [%112 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %113 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %114 = "neura.add"(%113) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %115 = "neura.data_mov"(%114) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %116 = neura.load_indexed [%115 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %117 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.div"(%117) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.data_mov"(%114) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %119 to [%120 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
        %121 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %122 = "neura.add"(%121) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %123 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = neura.load_indexed [%123 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %125 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %126 = "neura.div"(%125) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %127 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %128 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %127 to [%128 : !neura.data<index, i1>]  {rhs_value = "%input0"} : !neura.data<i32, i1>
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
        %4 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = neura.load_indexed [%4 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %8 = "neura.data_mov"(%3) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %25 = "neura.data_mov"(%20) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %26 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %42 = "neura.data_mov"(%37) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %43 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %59 = "neura.data_mov"(%54) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %60 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %76 = "neura.data_mov"(%71) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %77 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %93 = "neura.data_mov"(%88) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %94 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %110 = "neura.data_mov"(%105) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %127 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %128 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %144 = "neura.data_mov"(%139) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %161 = "neura.data_mov"(%156) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %162 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %178 = "neura.data_mov"(%173) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %179 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %195 = "neura.data_mov"(%190) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %196 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %212 = "neura.data_mov"(%207) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %213 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %229 = "neura.data_mov"(%224) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %230 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %246 = "neura.data_mov"(%241) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %247 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
        %263 = "neura.data_mov"(%258) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %264 = "neura.data_mov"(%2) : (!neura.data<index, i1>) -> !neura.data<index, i1>
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
  func.func @ffn_gate(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
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
  func.func @ffn_up(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>) {
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
  func.func @ffn_act(%arg0: memref<32xi32>, %arg1: memref<32xi32>, %arg2: memref<32xi32>) {
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
        %6 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%5) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.mul"(%6, %7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %19 = "neura.mul"(%17, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %30 = "neura.mul"(%28, %29) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %41 = "neura.mul"(%39, %40) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %52 = "neura.mul"(%50, %51) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %63 = "neura.mul"(%61, %62) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %74 = "neura.mul"(%72, %73) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
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
        %85 = "neura.mul"(%83, %84) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %87 = "neura.data_mov"(%78) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %86 to [%87 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %88 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %89 = "neura.add"(%88) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %90 = "neura.data_mov"(%89) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %91 = neura.load_indexed [%90 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %92 = "neura.data_mov"(%89) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %93 = neura.load_indexed [%92 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %94 = "neura.data_mov"(%91) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %95 = "neura.data_mov"(%93) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %96 = "neura.mul"(%94, %95) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %97 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %98 = "neura.data_mov"(%89) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %97 to [%98 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %99 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %100 = "neura.add"(%99) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %101 = "neura.data_mov"(%100) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %102 = neura.load_indexed [%101 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %103 = "neura.data_mov"(%100) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %104 = neura.load_indexed [%103 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %105 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %106 = "neura.data_mov"(%104) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %107 = "neura.mul"(%105, %106) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %108 = "neura.data_mov"(%107) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %109 = "neura.data_mov"(%100) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %108 to [%109 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %110 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %111 = "neura.add"(%110) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %112 = "neura.data_mov"(%111) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %113 = neura.load_indexed [%112 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %114 = "neura.data_mov"(%111) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %115 = neura.load_indexed [%114 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %116 = "neura.data_mov"(%113) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %117 = "neura.data_mov"(%115) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %118 = "neura.mul"(%116, %117) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %119 = "neura.data_mov"(%118) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %120 = "neura.data_mov"(%111) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %119 to [%120 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %121 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %122 = "neura.add"(%121) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %123 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %124 = neura.load_indexed [%123 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %125 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %126 = neura.load_indexed [%125 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %127 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %128 = "neura.data_mov"(%126) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %129 = "neura.mul"(%127, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %130 = "neura.data_mov"(%129) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %131 = "neura.data_mov"(%122) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %130 to [%131 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %132 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %133 = "neura.add"(%132) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %134 = "neura.data_mov"(%133) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %135 = neura.load_indexed [%134 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %136 = "neura.data_mov"(%133) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %137 = neura.load_indexed [%136 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %138 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %139 = "neura.data_mov"(%137) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %140 = "neura.mul"(%138, %139) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %141 = "neura.data_mov"(%140) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %142 = "neura.data_mov"(%133) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %141 to [%142 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %143 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %144 = "neura.add"(%143) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %145 = "neura.data_mov"(%144) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %146 = neura.load_indexed [%145 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %147 = "neura.data_mov"(%144) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %148 = neura.load_indexed [%147 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %149 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %150 = "neura.data_mov"(%148) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %151 = "neura.mul"(%149, %150) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %152 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %153 = "neura.data_mov"(%144) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %152 to [%153 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %154 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %155 = "neura.add"(%154) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %156 = "neura.data_mov"(%155) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %157 = neura.load_indexed [%156 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %158 = "neura.data_mov"(%155) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %159 = neura.load_indexed [%158 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %160 = "neura.data_mov"(%157) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %161 = "neura.data_mov"(%159) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %162 = "neura.mul"(%160, %161) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %163 = "neura.data_mov"(%162) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %164 = "neura.data_mov"(%155) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %163 to [%164 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
        %165 = "neura.data_mov"(%1) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %166 = "neura.add"(%165) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %167 = "neura.data_mov"(%166) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %168 = neura.load_indexed [%167 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
        %169 = "neura.data_mov"(%166) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %170 = neura.load_indexed [%169 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
        %171 = "neura.data_mov"(%168) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %172 = "neura.data_mov"(%170) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %173 = "neura.mul"(%171, %172) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %174 = "neura.data_mov"(%173) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %175 = "neura.data_mov"(%166) : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %174 to [%175 : !neura.data<index, i1>]  {rhs_value = "%input2"} : !neura.data<i32, i1>
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
}

