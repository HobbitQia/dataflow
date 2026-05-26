#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE9data_real(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE9data_imag(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @_ZZ4mainE9data_real : !llvm.ptr
    %2 = llvm.mlir.addressof @_ZZ4mainE9data_imag : !llvm.ptr
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(1 : i64) : i64
    %5 = llvm.mlir.constant(256 : i64) : i64
    %6 = llvm.mlir.constant(128 : i64) : i64
    %7 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%8: i64):  // 2 preds: ^bb0, ^bb1
    %9 = llvm.getelementptr inbounds %1[%0, %8] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %10 = llvm.trunc %8 : i64 to i32
    llvm.store %10, %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %11 = llvm.getelementptr inbounds %2[%0, %8] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    llvm.store %3, %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %12 = llvm.add %8, %4 overflow<nsw, nuw> : i64
    %13 = llvm.icmp "eq" %12, %5 : i64
    llvm.cond_br %13, ^bb2(%0 : i64), ^bb1(%12 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%14: i64):  // 2 preds: ^bb1, ^bb2
    %15 = llvm.add %14, %6 overflow<nsw, nuw> : i64
    %16 = llvm.getelementptr inbounds %1[%0, %15] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %17 = llvm.load %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.shl %17, %3 overflow<nsw> : i32
    %19 = llvm.getelementptr inbounds %2[%0, %15] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %20 = llvm.load %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.shl %20, %3 overflow<nsw> : i32
    %22 = llvm.sub %18, %21 overflow<nsw> : i32
    %23 = llvm.add %21, %18 overflow<nsw> : i32
    %24 = llvm.getelementptr inbounds %1[%0, %14] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.sub %25, %22 overflow<nsw> : i32
    llvm.store %26, %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %27 = llvm.add %22, %25 overflow<nsw> : i32
    llvm.store %27, %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %28 = llvm.getelementptr inbounds %2[%0, %14] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %29 = llvm.load %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.sub %29, %23 overflow<nsw> : i32
    llvm.store %30, %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %31 = llvm.add %29, %23 overflow<nsw> : i32
    llvm.store %31, %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %32 = llvm.add %14, %4 overflow<nsw, nuw> : i64
    %33 = llvm.icmp "eq" %32, %6 : i64
    llvm.cond_br %33, ^bb3, ^bb2(%32 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.return %7 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPiS_iil(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: i32 {llvm.noundef}, %arg3: i32 {llvm.noundef}, %arg4: i64 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(128 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%3: i64):  // 2 preds: ^bb0, ^bb1
    %4 = llvm.add %3, %arg4 overflow<nsw> : i64
    %5 = llvm.add %4, %1 : i64
    %6 = llvm.getelementptr inbounds %arg0[%5] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %7 = llvm.load %6 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %8 = llvm.mul %7, %arg2 overflow<nsw> : i32
    %9 = llvm.getelementptr inbounds %arg1[%5] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %10 = llvm.load %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %11 = llvm.mul %10, %arg3 overflow<nsw> : i32
    %12 = llvm.sub %8, %11 overflow<nsw> : i32
    %13 = llvm.mul %7, %arg3 overflow<nsw> : i32
    %14 = llvm.mul %10, %arg2 overflow<nsw> : i32
    %15 = llvm.add %14, %13 overflow<nsw> : i32
    %16 = llvm.getelementptr inbounds %arg0[%4] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %17 = llvm.load %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.sub %17, %12 overflow<nsw> : i32
    llvm.store %18, %6 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.add %17, %12 overflow<nsw> : i32
    llvm.store %19, %16 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.getelementptr inbounds %arg1[%4] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %21 = llvm.load %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.sub %21, %15 overflow<nsw> : i32
    llvm.store %22, %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.add %21, %15 overflow<nsw> : i32
    llvm.store %23, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %24 = llvm.add %3, %2 overflow<nsw, nuw> : i64
    %25 = llvm.icmp "eq" %24, %1 : i64
    llvm.cond_br %25, ^bb2, ^bb1(%24 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}
