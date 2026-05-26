#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1C(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1A(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1B(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.addressof @_ZZ4mainE1C : !llvm.ptr
    %1 = llvm.mlir.constant(0 : i8) : i8
    %2 = llvm.mlir.constant(16384 : i64) : i64
    %3 = llvm.mlir.constant(0 : i64) : i64
    %4 = llvm.mlir.constant(6 : i64) : i64
    %5 = llvm.mlir.addressof @_ZZ4mainE1A : !llvm.ptr
    %6 = llvm.mlir.addressof @_ZZ4mainE1B : !llvm.ptr
    %7 = llvm.mlir.constant(1 : i64) : i64
    %8 = llvm.mlir.constant(64 : i64) : i64
    %9 = llvm.mlir.constant(0 : i32) : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%3 : i64)
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb3
    %11 = llvm.shl %10, %4 overflow<nsw> : i64
    llvm.br ^bb2(%3 : i64)
  ^bb2(%12: i64):  // 2 preds: ^bb1, ^bb2
    %13 = llvm.add %12, %11 overflow<nsw, nuw> : i64
    %14 = llvm.add %12, %10 overflow<nsw, nuw> : i64
    %15 = llvm.getelementptr inbounds %5[%3, %13] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %16 = llvm.trunc %14 : i64 to i32
    llvm.store %16, %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.sub %10, %12 overflow<nsw> : i64
    %18 = llvm.getelementptr inbounds %6[%3, %13] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %19 = llvm.trunc %17 : i64 to i32
    llvm.store %19, %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.add %12, %7 overflow<nsw, nuw> : i64
    %21 = llvm.icmp "eq" %20, %8 : i64
    llvm.cond_br %21, ^bb3, ^bb2(%20 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %22 = llvm.add %10, %7 overflow<nsw, nuw> : i64
    %23 = llvm.icmp "eq" %22, %8 : i64
    llvm.cond_br %23, ^bb4(%3 : i64), ^bb1(%22 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%24: i64):  // 2 preds: ^bb3, ^bb8
    %25 = llvm.shl %24, %4 overflow<nsw> : i64
    llvm.br ^bb5(%3 : i64)
  ^bb5(%26: i64):  // 2 preds: ^bb4, ^bb7
    %27 = llvm.add %26, %25 overflow<nsw, nuw> : i64
    %28 = llvm.getelementptr inbounds %5[%3, %27] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %29 = llvm.shl %26, %4 overflow<nsw> : i64
    %30 = llvm.load %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb6(%3 : i64)
  ^bb6(%31: i64):  // 2 preds: ^bb5, ^bb6
    %32 = llvm.add %31, %29 overflow<nsw, nuw> : i64
    %33 = llvm.getelementptr inbounds %6[%3, %32] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %34 = llvm.load %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.mul %34, %30 overflow<nsw> : i32
    %36 = llvm.add %31, %25 overflow<nsw, nuw> : i64
    %37 = llvm.getelementptr inbounds %0[%3, %36] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %38 = llvm.load %37 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.add %38, %35 overflow<nsw> : i32
    llvm.store %39, %37 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %40 = llvm.add %31, %7 overflow<nsw, nuw> : i64
    %41 = llvm.icmp "eq" %40, %8 : i64
    llvm.cond_br %41, ^bb7, ^bb6(%40 : i64) {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    %42 = llvm.add %26, %7 overflow<nsw, nuw> : i64
    %43 = llvm.icmp "eq" %42, %8 : i64
    llvm.cond_br %43, ^bb8, ^bb5(%42 : i64) {loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    %44 = llvm.add %24, %7 overflow<nsw, nuw> : i64
    %45 = llvm.icmp "eq" %44, %8 : i64
    llvm.cond_br %45, ^bb9, ^bb4(%44 : i64) {loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return %9 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(6 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(64 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%4: i64):  // 2 preds: ^bb0, ^bb5
    %5 = llvm.shl %4, %1 overflow<nsw> : i64
    llvm.br ^bb2(%0 : i64)
  ^bb2(%6: i64):  // 2 preds: ^bb1, ^bb4
    %7 = llvm.add %6, %5 overflow<nsw, nuw> : i64
    %8 = llvm.getelementptr inbounds %arg1[%7] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %9 = llvm.shl %6, %1 overflow<nsw> : i64
    llvm.br ^bb3(%0 : i64)
  ^bb3(%10: i64):  // 2 preds: ^bb2, ^bb3
    %11 = llvm.load %8 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %12 = llvm.add %10, %9 overflow<nsw, nuw> : i64
    %13 = llvm.getelementptr inbounds %arg2[%12] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %14 = llvm.load %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %15 = llvm.mul %14, %11 overflow<nsw> : i32
    %16 = llvm.add %10, %5 overflow<nsw, nuw> : i64
    %17 = llvm.getelementptr inbounds %arg0[%16] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %18 = llvm.load %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %19 = llvm.add %18, %15 overflow<nsw> : i32
    llvm.store %19, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.add %10, %2 overflow<nsw, nuw> : i64
    %21 = llvm.icmp "eq" %20, %3 : i64
    llvm.cond_br %21, ^bb4, ^bb3(%20 : i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    %22 = llvm.add %6, %2 overflow<nsw, nuw> : i64
    %23 = llvm.icmp "eq" %22, %3 : i64
    llvm.cond_br %23, ^bb5, ^bb2(%22 : i64) {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %24 = llvm.add %4, %2 overflow<nsw, nuw> : i64
    %25 = llvm.icmp "eq" %24, %3 : i64
    llvm.cond_br %25, ^bb6, ^bb1(%24 : i64) {loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    llvm.return
  }
}
