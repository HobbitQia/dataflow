#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel(%arg0: !llvm.ptr {llvm.nocapture}, %arg1: !llvm.ptr {llvm.nocapture}, %arg2: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(128 : i32) : i32
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(2 : i32) : i32
    %6 = llvm.mlir.constant(2 : i64) : i64
    %7 = llvm.mlir.constant(3 : i32) : i32
    %8 = llvm.mlir.constant(3 : i64) : i64
    %9 = llvm.mlir.constant(4 : i64) : i64
    %10 = llvm.mlir.constant(8 : i32) : i32
    llvm.br ^bb1(%0, %0, %1, %2 : i32, i32, i32, i32)
  ^bb1(%11: i32, %12: i32, %13: i32, %14: i32):  // 2 preds: ^bb0, ^bb7
    %15 = llvm.icmp "eq" %14, %0 : i32
    llvm.cond_br %15, ^bb7, ^bb2
  ^bb2:  // pred: ^bb1
    %16 = llvm.icmp "sgt" %13, %0 : i32
    %17 = llvm.sext %13 : i32 to i64
    %18 = llvm.sext %12 : i32 to i64
    %19 = llvm.zext %14 : i32 to i64
    llvm.br ^bb3(%3 : i64)
  ^bb3(%20: i64):  // 2 preds: ^bb2, ^bb6
    %21 = llvm.add %20, %18 overflow<nsw> : i64
    %22 = llvm.getelementptr inbounds %arg2[%21] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %23 = llvm.load %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = llvm.getelementptr inbounds %arg3[%21] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.cond_br %16, ^bb4, ^bb6
  ^bb4:  // pred: ^bb3
    %26 = llvm.trunc %20 : i64 to i32
    %27 = llvm.shl %26, %2 : i32
    %28 = llvm.mul %27, %13 overflow<nsw> : i32
    %29 = llvm.sext %28 : i32 to i64
    llvm.br ^bb5(%3 : i64)
  ^bb5(%30: i64):  // 2 preds: ^bb4, ^bb5
    %31 = llvm.add %30, %29 overflow<nsw> : i64
    %32 = llvm.trunc %31 : i64 to i32
    %33 = llvm.add %13, %32 : i32
    %34 = llvm.sext %33 : i32 to i64
    %35 = llvm.getelementptr inbounds %arg0[%34] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %36 = llvm.load %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.mul %36, %23 overflow<nsw> : i32
    %38 = llvm.getelementptr inbounds %arg1[%34] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %39 = llvm.load %38 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %40 = llvm.mul %39, %25 overflow<nsw> : i32
    %41 = llvm.sub %37, %40 overflow<nsw> : i32
    %42 = llvm.mul %36, %25 overflow<nsw> : i32
    %43 = llvm.mul %39, %23 overflow<nsw> : i32
    %44 = llvm.add %43, %42 overflow<nsw> : i32
    %45 = llvm.getelementptr inbounds %arg0[%31] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %46 = llvm.load %45 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %47 = llvm.sub %46, %41 overflow<nsw> : i32
    llvm.store %47, %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %48 = llvm.load %45 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %49 = llvm.add %48, %41 overflow<nsw> : i32
    llvm.store %49, %45 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.getelementptr inbounds %arg1[%31] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %51 = llvm.load %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.sub %51, %44 overflow<nsw> : i32
    llvm.store %52, %38 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %53 = llvm.load %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %54 = llvm.add %53, %44 overflow<nsw> : i32
    llvm.store %54, %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %55 = llvm.add %33, %2 overflow<nsw> : i32
    %56 = llvm.sext %55 : i32 to i64
    %57 = llvm.getelementptr inbounds %arg0[%56] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %58 = llvm.load %57 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %59 = llvm.mul %58, %23 overflow<nsw> : i32
    %60 = llvm.getelementptr inbounds %arg1[%56] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %61 = llvm.load %60 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %62 = llvm.mul %61, %25 overflow<nsw> : i32
    %63 = llvm.sub %59, %62 overflow<nsw> : i32
    %64 = llvm.mul %58, %25 overflow<nsw> : i32
    %65 = llvm.mul %61, %23 overflow<nsw> : i32
    %66 = llvm.add %65, %64 overflow<nsw> : i32
    %67 = llvm.or %31, %4 : i64
    %68 = llvm.getelementptr inbounds %arg0[%67] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %69 = llvm.load %68 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %70 = llvm.sub %69, %63 overflow<nsw> : i32
    llvm.store %70, %57 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %71 = llvm.load %68 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %72 = llvm.add %71, %63 overflow<nsw> : i32
    llvm.store %72, %68 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %73 = llvm.getelementptr inbounds %arg1[%67] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %74 = llvm.load %73 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %75 = llvm.sub %74, %66 overflow<nsw> : i32
    llvm.store %75, %60 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %76 = llvm.load %73 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %77 = llvm.add %76, %66 overflow<nsw> : i32
    llvm.store %77, %73 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %78 = llvm.add %33, %5 overflow<nsw> : i32
    %79 = llvm.sext %78 : i32 to i64
    %80 = llvm.getelementptr inbounds %arg0[%79] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %81 = llvm.load %80 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %82 = llvm.mul %81, %23 overflow<nsw> : i32
    %83 = llvm.getelementptr inbounds %arg1[%79] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %84 = llvm.load %83 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %85 = llvm.mul %84, %25 overflow<nsw> : i32
    %86 = llvm.sub %82, %85 overflow<nsw> : i32
    %87 = llvm.mul %81, %25 overflow<nsw> : i32
    %88 = llvm.mul %84, %23 overflow<nsw> : i32
    %89 = llvm.add %88, %87 overflow<nsw> : i32
    %90 = llvm.add %31, %6 overflow<nsw> : i64
    %91 = llvm.getelementptr inbounds %arg0[%90] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %92 = llvm.load %91 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %93 = llvm.sub %92, %86 overflow<nsw> : i32
    llvm.store %93, %80 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %94 = llvm.load %91 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %95 = llvm.add %94, %86 overflow<nsw> : i32
    llvm.store %95, %91 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %96 = llvm.getelementptr inbounds %arg1[%90] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %97 = llvm.load %96 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %98 = llvm.sub %97, %89 overflow<nsw> : i32
    llvm.store %98, %83 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %99 = llvm.load %96 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %100 = llvm.add %99, %89 overflow<nsw> : i32
    llvm.store %100, %96 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %101 = llvm.add %33, %7 overflow<nsw> : i32
    %102 = llvm.sext %101 : i32 to i64
    %103 = llvm.getelementptr inbounds %arg0[%102] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %104 = llvm.load %103 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %105 = llvm.mul %104, %23 overflow<nsw> : i32
    %106 = llvm.getelementptr inbounds %arg1[%102] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %107 = llvm.load %106 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %108 = llvm.mul %107, %25 overflow<nsw> : i32
    %109 = llvm.sub %105, %108 overflow<nsw> : i32
    %110 = llvm.mul %104, %25 overflow<nsw> : i32
    %111 = llvm.mul %107, %23 overflow<nsw> : i32
    %112 = llvm.add %111, %110 overflow<nsw> : i32
    %113 = llvm.add %31, %8 overflow<nsw> : i64
    %114 = llvm.getelementptr inbounds %arg0[%113] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %115 = llvm.load %114 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %116 = llvm.sub %115, %109 overflow<nsw> : i32
    llvm.store %116, %103 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %117 = llvm.load %114 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %118 = llvm.add %117, %109 overflow<nsw> : i32
    llvm.store %118, %114 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %119 = llvm.getelementptr inbounds %arg1[%113] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %120 = llvm.load %119 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %121 = llvm.sub %120, %112 overflow<nsw> : i32
    llvm.store %121, %106 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %122 = llvm.load %119 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %123 = llvm.add %122, %112 overflow<nsw> : i32
    llvm.store %123, %119 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %124 = llvm.add %30, %9 overflow<nsw, nuw> : i64
    %125 = llvm.icmp "slt" %124, %17 : i64
    llvm.cond_br %125, ^bb5(%124 : i64), ^bb6 {loop_annotation = #loop_annotation}
  ^bb6:  // 2 preds: ^bb3, ^bb5
    %126 = llvm.add %20, %4 overflow<nsw, nuw> : i64
    %127 = llvm.icmp "eq" %126, %19 : i64
    llvm.cond_br %127, ^bb7, ^bb3(%126 : i64) {loop_annotation = #loop_annotation}
  ^bb7:  // 2 preds: ^bb1, ^bb6
    %128 = llvm.shl %14, %2 overflow<nsw> : i32
    %129 = llvm.sdiv %13, %5 : i32
    %130 = llvm.shl %12, %2 : i32
    %131 = llvm.or %130, %2 : i32
    %132 = llvm.add %11, %2 overflow<nsw, nuw> : i32
    %133 = llvm.icmp "eq" %132, %10 : i32
    llvm.cond_br %133, ^bb8, ^bb1(%132, %131, %129, %128 : i32, i32, i32, i32) {loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    llvm.return
  }
}
