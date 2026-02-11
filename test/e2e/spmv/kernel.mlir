#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#loop_annotation1 = #llvm.loop_annotation<unroll = #loop_unroll>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel(%arg0: i32, %arg1: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg5: !llvm.ptr {llvm.nocapture}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(-1 : i32) : i32
    %2 = llvm.mlir.constant(3 : i32) : i32
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(-4 : i32) : i32
    %5 = llvm.mlir.constant(1 : i64) : i64
    %6 = llvm.mlir.constant(2 : i64) : i64
    %7 = llvm.mlir.constant(3 : i64) : i64
    %8 = llvm.mlir.constant(4 : i64) : i64
    %9 = llvm.icmp "sgt" %arg0, %0 : i32
    llvm.cond_br %9, ^bb1, ^bb6
  ^bb1:  // pred: ^bb0
    %10 = llvm.add %arg0, %1 overflow<nsw> : i32
    %11 = llvm.and %arg0, %2 : i32
    %12 = llvm.icmp "ult" %10, %2 : i32
    llvm.cond_br %12, ^bb4(%3 : i64), ^bb2
  ^bb2:  // pred: ^bb1
    %13 = llvm.and %arg0, %4 : i32
    llvm.br ^bb3(%3, %13 : i64, i32)
  ^bb3(%14: i64, %15: i32):  // 2 preds: ^bb2, ^bb3
    %16 = llvm.getelementptr inbounds %arg1[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %17 = llvm.load %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.getelementptr inbounds %arg2[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %19 = llvm.load %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %20 = llvm.sext %19 : i32 to i64
    %21 = llvm.getelementptr inbounds %arg4[%20] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %22 = llvm.load %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.mul %22, %17 overflow<nsw> : i32
    %24 = llvm.getelementptr inbounds %arg3[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.sext %25 : i32 to i64
    %27 = llvm.getelementptr inbounds %arg5[%26] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %28 = llvm.load %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.add %28, %23 overflow<nsw> : i32
    llvm.store %29, %27 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %30 = llvm.or %14, %5 : i64
    %31 = llvm.getelementptr inbounds %arg1[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %32 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.getelementptr inbounds %arg2[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %34 = llvm.load %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.sext %34 : i32 to i64
    %36 = llvm.getelementptr inbounds %arg4[%35] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %37 = llvm.load %36 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %38 = llvm.mul %37, %32 overflow<nsw> : i32
    %39 = llvm.getelementptr inbounds %arg3[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %40 = llvm.load %39 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.sext %40 : i32 to i64
    %42 = llvm.getelementptr inbounds %arg5[%41] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %43 = llvm.load %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %44 = llvm.add %43, %38 overflow<nsw> : i32
    llvm.store %44, %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %45 = llvm.or %14, %6 : i64
    %46 = llvm.getelementptr inbounds %arg1[%45] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.getelementptr inbounds %arg2[%45] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %49 = llvm.load %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.sext %49 : i32 to i64
    %51 = llvm.getelementptr inbounds %arg4[%50] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %52 = llvm.load %51 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %53 = llvm.mul %52, %47 overflow<nsw> : i32
    %54 = llvm.getelementptr inbounds %arg3[%45] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %55 = llvm.load %54 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %56 = llvm.sext %55 : i32 to i64
    %57 = llvm.getelementptr inbounds %arg5[%56] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %58 = llvm.load %57 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %59 = llvm.add %58, %53 overflow<nsw> : i32
    llvm.store %59, %57 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %60 = llvm.or %14, %7 : i64
    %61 = llvm.getelementptr inbounds %arg1[%60] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %62 = llvm.load %61 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %63 = llvm.getelementptr inbounds %arg2[%60] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %64 = llvm.load %63 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %65 = llvm.sext %64 : i32 to i64
    %66 = llvm.getelementptr inbounds %arg4[%65] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %67 = llvm.load %66 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %68 = llvm.mul %67, %62 overflow<nsw> : i32
    %69 = llvm.getelementptr inbounds %arg3[%60] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %70 = llvm.load %69 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %71 = llvm.sext %70 : i32 to i64
    %72 = llvm.getelementptr inbounds %arg5[%71] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %73 = llvm.load %72 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %74 = llvm.add %73, %68 overflow<nsw> : i32
    llvm.store %74, %72 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %75 = llvm.add %14, %8 overflow<nsw, nuw> : i64
    %76 = llvm.add %15, %4 : i32
    %77 = llvm.icmp "eq" %76, %0 : i32
    llvm.cond_br %77, ^bb4(%75 : i64), ^bb3(%75, %76 : i64, i32) {loop_annotation = #loop_annotation}
  ^bb4(%78: i64):  // 2 preds: ^bb1, ^bb3
    %79 = llvm.icmp "eq" %11, %0 : i32
    llvm.cond_br %79, ^bb6, ^bb5(%78, %11 : i64, i32)
  ^bb5(%80: i64, %81: i32):  // 2 preds: ^bb4, ^bb5
    %82 = llvm.getelementptr inbounds %arg1[%80] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %83 = llvm.load %82 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %84 = llvm.getelementptr inbounds %arg2[%80] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %85 = llvm.load %84 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %86 = llvm.sext %85 : i32 to i64
    %87 = llvm.getelementptr inbounds %arg4[%86] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %88 = llvm.load %87 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %89 = llvm.mul %88, %83 overflow<nsw> : i32
    %90 = llvm.getelementptr inbounds %arg3[%80] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %91 = llvm.load %90 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %92 = llvm.sext %91 : i32 to i64
    %93 = llvm.getelementptr inbounds %arg5[%92] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %94 = llvm.load %93 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %95 = llvm.add %94, %89 overflow<nsw> : i32
    llvm.store %95, %93 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %96 = llvm.add %80, %5 overflow<nsw, nuw> : i64
    %97 = llvm.add %81, %1 : i32
    %98 = llvm.icmp "eq" %97, %0 : i32
    llvm.cond_br %98, ^bb6, ^bb5(%96, %97 : i64, i32) {loop_annotation = #loop_annotation1}
  ^bb6:  // 3 preds: ^bb0, ^bb4, ^bb5
    llvm.return
  }
}
