#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C/C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  llvm.func local_unnamed_addr @kernel(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: !llvm.ptr {llvm.nocapture}, %arg4: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg5: !llvm.ptr {llvm.nocapture, llvm.readnone}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unsafe_fp_math = false} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(70 : i16) : i16
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.mlir.constant(70 : i32) : i32
    %4 = llvm.mlir.constant(2 : i32) : i32
    %5 = llvm.mlir.constant(4198 : i32) : i32
    llvm.br ^bb1(%0 : i32)
  ^bb1(%6: i32):  // 2 preds: ^bb0, ^bb1
    %7 = llvm.trunc %6 : i32 to i16
    %8 = llvm.udiv %7, %1 : i16
    %9 = llvm.urem %7, %1 : i16
    %10 = llvm.zext %8 : i16 to i64
    %11 = llvm.zext %9 : i16 to i64
    %12 = llvm.getelementptr inbounds %arg4[%10, %11] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<70 x i32>
    %13 = llvm.load %12 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %14 = llvm.icmp "sgt" %13, %0 : i32
    %15 = llvm.select %14, %13, %0 : i1, i32
    %16 = llvm.getelementptr inbounds %arg3[%10, %11] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<70 x i32>
    llvm.store %15, %16 {alignment = 4 : i64} : i32, !llvm.ptr
    %17 = llvm.or %6, %2 : i32
    %18 = llvm.urem %17, %3 : i32
    %19 = llvm.zext %18 : i32 to i64
    %20 = llvm.getelementptr inbounds %arg4[%10, %19] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<70 x i32>
    %21 = llvm.load %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.icmp "sgt" %21, %0 : i32
    %23 = llvm.select %22, %21, %0 : i1, i32
    %24 = llvm.getelementptr inbounds %arg3[%10, %19] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<70 x i32>
    llvm.store %23, %24 {alignment = 4 : i64} : i32, !llvm.ptr
    %25 = llvm.add %6, %4 overflow<nsw, nuw> : i32
    %26 = llvm.icmp "ult" %6, %5 : i32
    llvm.cond_br %26, ^bb1(%25 : i32), ^bb2 {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}
