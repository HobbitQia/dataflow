#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr constant @_ZZ4mainE11coefficient(dense<[25, 150, 375, -225, 50, 75, -300, 125, 20, 22, 230, 210, 48, 28, -240, 560]> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<16 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE5state(dense<0> : tensor<12xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<12 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.addressof @_ZZ4mainE5state : !llvm.ptr
    %3 = llvm.mlir.constant(12 : i64) : i64
    %4 = llvm.getelementptr inbounds %2[%0, %1] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %5 = llvm.mlir.addressof @_ZZ4mainE11coefficient : !llvm.ptr
    %6 = llvm.mlir.constant(2 : i64) : i64
    %7 = llvm.mlir.constant(8 : i64) : i64
    %8 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%9: i64):  // 2 preds: ^bb0, ^bb1
    %10 = llvm.add %9, %1 overflow<nsw, nuw> : i64
    %11 = llvm.getelementptr inbounds %2[%0, %9] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %12 = llvm.trunc %10 : i64 to i32
    llvm.store %12, %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %13 = llvm.icmp "eq" %10, %3 : i64
    llvm.cond_br %13, ^bb2, ^bb1(%10 : i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    %14 = llvm.load %2 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %15 = llvm.load %4 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb3(%15, %14, %0 : i32, i32, i64)
  ^bb3(%16: i32, %17: i32, %18: i64):  // 2 preds: ^bb2, ^bb3
    %19 = llvm.shl %18, %1 overflow<nsw, nuw> : i64
    %20 = llvm.getelementptr inbounds %5[%0, %19] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %21 = llvm.load %20 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.or %19, %1 : i64
    %23 = llvm.getelementptr inbounds %5[%0, %22] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %24 = llvm.load %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.add %18, %6 overflow<nsw, nuw> : i64
    %26 = llvm.getelementptr inbounds %2[%0, %25] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<12 x i32>
    %27 = llvm.load %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %16, %26 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %28 = llvm.mul %24, %17 overflow<nsw> : i32
    %29 = llvm.mul %27, %21 overflow<nsw> : i32
    %30 = llvm.sub %28, %29 overflow<nsw> : i32
    llvm.store %30, %2 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %31 = llvm.mul %27, %24 overflow<nsw> : i32
    %32 = llvm.mul %21, %17 overflow<nsw> : i32
    %33 = llvm.add %31, %32 overflow<nsw> : i32
    llvm.store %33, %4 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %34 = llvm.add %18, %1 overflow<nsw, nuw> : i64
    %35 = llvm.icmp "eq" %34, %7 : i64
    llvm.cond_br %35, ^bb4, ^bb3(%33, %30, %34 : i32, i32, i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return %8 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPiPKi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(0 : i64) : i64
    %2 = llvm.mlir.constant(2 : i64) : i64
    %3 = llvm.mlir.constant(8 : i64) : i64
    %4 = llvm.getelementptr inbounds %arg0[%0] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %5 = llvm.load %arg0 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %6 = llvm.load %4 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb1(%6, %5, %1 : i32, i32, i64)
  ^bb1(%7: i32, %8: i32, %9: i64):  // 2 preds: ^bb0, ^bb1
    %10 = llvm.shl %9, %0 overflow<nsw, nuw> : i64
    %11 = llvm.getelementptr inbounds %arg1[%10] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %12 = llvm.load %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %13 = llvm.or %10, %0 : i64
    %14 = llvm.getelementptr inbounds %arg1[%13] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %15 = llvm.load %14 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %16 = llvm.add %9, %2 overflow<nsw, nuw> : i64
    %17 = llvm.getelementptr inbounds %arg0[%16] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %18 = llvm.load %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.store %7, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.mul %8, %15 overflow<nsw> : i32
    %20 = llvm.mul %18, %12 overflow<nsw> : i32
    %21 = llvm.sub %19, %20 overflow<nsw> : i32
    llvm.store %21, %arg0 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.mul %18, %15 overflow<nsw> : i32
    %23 = llvm.mul %8, %12 overflow<nsw> : i32
    %24 = llvm.add %22, %23 overflow<nsw> : i32
    llvm.store %24, %4 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %9, %0 overflow<nsw, nuw> : i64
    %26 = llvm.icmp "eq" %25, %3 : i64
    llvm.cond_br %26, ^bb2, ^bb1(%24, %21, %25 : i32, i32, i64) {loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}
