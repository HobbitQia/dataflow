#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel(%arg0: !llvm.ptr {llvm.nocapture}, %arg1: !llvm.ptr {llvm.nocapture}, %arg2: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(128 : i32) : i32
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(2 : i64) : i64
    %6 = llvm.mlir.constant(2 : i32) : i32
    %7 = llvm.mlir.constant(8 : i32) : i32
    llvm.br ^bb1(%0, %0, %1, %2 : i32, i32, i32, i32)
  ^bb1(%8: i32, %9: i32, %10: i32, %11: i32):  // 2 preds: ^bb0, ^bb6
    %12 = llvm.icmp "ne" %11, %0 : i32
    %13 = llvm.icmp "sgt" %10, %0 : i32
    %14 = llvm.and %12, %13 : i1
    llvm.cond_br %14, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    %15 = llvm.zext %10 : i32 to i64
    %16 = llvm.sext %9 : i32 to i64
    %17 = llvm.zext %11 : i32 to i64
    llvm.br ^bb3(%3 : i64)
  ^bb3(%18: i64):  // 2 preds: ^bb2, ^bb5
    %19 = llvm.add %18, %16 overflow<nsw> : i64
    %20 = llvm.getelementptr inbounds %arg2[%19] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %21 = llvm.load %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.getelementptr inbounds %arg3[%19] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %23 = llvm.load %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = llvm.shl %18, %4 overflow<nsw, nuw> : i64
    %25 = llvm.mul %24, %15 overflow<nsw> : i64
    llvm.br ^bb4(%3 : i64)
  ^bb4(%26: i64):  // 2 preds: ^bb3, ^bb4
    %27 = llvm.add %26, %25 overflow<nsw, nuw> : i64
    %28 = llvm.trunc %27 : i64 to i32
    %29 = llvm.add %10, %28 : i32
    %30 = llvm.sext %29 : i32 to i64
    %31 = llvm.getelementptr inbounds %arg0[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %32 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.mul %32, %21 overflow<nsw> : i32
    %34 = llvm.getelementptr inbounds %arg1[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %35 = llvm.load %34 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %36 = llvm.mul %35, %23 overflow<nsw> : i32
    %37 = llvm.sub %33, %36 overflow<nsw> : i32
    %38 = llvm.mul %32, %23 overflow<nsw> : i32
    %39 = llvm.mul %35, %21 overflow<nsw> : i32
    %40 = llvm.add %39, %38 overflow<nsw> : i32
    %41 = llvm.getelementptr inbounds %arg0[%27] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %42 = llvm.load %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.sub %42, %37 overflow<nsw> : i32
    llvm.store %43, %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %44 = llvm.load %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.add %44, %37 overflow<nsw> : i32
    llvm.store %45, %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %46 = llvm.getelementptr inbounds %arg1[%27] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.sub %47, %40 overflow<nsw> : i32
    llvm.store %48, %34 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %49 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.add %49, %40 overflow<nsw> : i32
    llvm.store %50, %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %51 = llvm.add %29, %2 overflow<nsw> : i32
    %52 = llvm.sext %51 : i32 to i64
    %53 = llvm.getelementptr inbounds %arg0[%52] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %54 = llvm.load %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %55 = llvm.mul %54, %21 overflow<nsw> : i32
    %56 = llvm.getelementptr inbounds %arg1[%52] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %57 = llvm.load %56 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %58 = llvm.mul %57, %23 overflow<nsw> : i32
    %59 = llvm.sub %55, %58 overflow<nsw> : i32
    %60 = llvm.mul %54, %23 overflow<nsw> : i32
    %61 = llvm.mul %57, %21 overflow<nsw> : i32
    %62 = llvm.add %61, %60 overflow<nsw> : i32
    %63 = llvm.or %27, %4 : i64
    %64 = llvm.getelementptr inbounds %arg0[%63] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %65 = llvm.load %64 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %66 = llvm.sub %65, %59 overflow<nsw> : i32
    llvm.store %66, %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %67 = llvm.load %64 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %68 = llvm.add %67, %59 overflow<nsw> : i32
    llvm.store %68, %64 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %69 = llvm.getelementptr inbounds %arg1[%63] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %70 = llvm.load %69 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %71 = llvm.sub %70, %62 overflow<nsw> : i32
    llvm.store %71, %56 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %72 = llvm.load %69 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %73 = llvm.add %72, %62 overflow<nsw> : i32
    llvm.store %73, %69 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %74 = llvm.add %26, %5 overflow<nsw, nuw> : i64
    %75 = llvm.icmp "ult" %74, %15 : i64
    llvm.cond_br %75, ^bb4(%74 : i64), ^bb5 {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %76 = llvm.add %18, %4 overflow<nsw, nuw> : i64
    %77 = llvm.icmp "eq" %76, %17 : i64
    llvm.cond_br %77, ^bb6, ^bb3(%76 : i64) {loop_annotation = #loop_annotation}
  ^bb6:  // 2 preds: ^bb1, ^bb5
    %78 = llvm.shl %11, %2 overflow<nsw> : i32
    %79 = llvm.sdiv %10, %6 : i32
    %80 = llvm.shl %9, %2 : i32
    %81 = llvm.or %80, %2 : i32
    %82 = llvm.add %8, %2 overflow<nsw, nuw> : i32
    %83 = llvm.icmp "eq" %82, %7 : i32
    llvm.cond_br %83, ^bb7, ^bb1(%82, %81, %79, %78 : i32, i32, i32, i32) {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    llvm.return
  }
}
