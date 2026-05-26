#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %9 = llvm.mlir.constant(2 : i64) : i64
    %10 = llvm.mlir.constant(62 : i64) : i64
    %11 = llvm.mlir.constant(0 : i32) : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%3 : i64)
  ^bb1(%12: i64):  // 2 preds: ^bb0, ^bb3
    %13 = llvm.shl %12, %4 overflow<nsw> : i64
    llvm.br ^bb2(%3 : i64)
  ^bb2(%14: i64):  // 2 preds: ^bb1, ^bb2
    %15 = llvm.add %14, %13 overflow<nsw, nuw> : i64
    %16 = llvm.add %14, %12 overflow<nsw, nuw> : i64
    %17 = llvm.getelementptr inbounds %5[%3, %15] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %18 = llvm.trunc %16 : i64 to i32
    llvm.store %18, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.sub %12, %14 overflow<nsw> : i64
    %20 = llvm.getelementptr inbounds %6[%3, %15] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %21 = llvm.trunc %19 : i64 to i32
    llvm.store %21, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.add %14, %7 overflow<nsw, nuw> : i64
    %23 = llvm.icmp "eq" %22, %8 : i64
    llvm.cond_br %23, ^bb3, ^bb2(%22 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %24 = llvm.add %12, %7 overflow<nsw, nuw> : i64
    %25 = llvm.icmp "eq" %24, %8 : i64
    llvm.cond_br %25, ^bb4(%3 : i64), ^bb1(%24 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%26: i64):  // 2 preds: ^bb3, ^bb8
    %27 = llvm.shl %26, %4 overflow<nsw> : i64
    llvm.br ^bb5(%3 : i64)
  ^bb5(%28: i64):  // 2 preds: ^bb4, ^bb7
    %29 = llvm.add %28, %27 overflow<nsw, nuw> : i64
    %30 = llvm.getelementptr inbounds %5[%3, %29] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %31 = llvm.shl %28, %4 overflow<nsw> : i64
    %32 = llvm.load %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb6(%3 : i64)
  ^bb6(%33: i64):  // 2 preds: ^bb5, ^bb6
    %34 = llvm.add %33, %31 overflow<nsw, nuw> : i64
    %35 = llvm.getelementptr inbounds %6[%3, %34] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %36 = llvm.load %35 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.mul %36, %32 overflow<nsw> : i32
    %38 = llvm.add %33, %27 overflow<nsw, nuw> : i64
    %39 = llvm.getelementptr inbounds %0[%3, %38] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %40 = llvm.load %39 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.add %40, %37 overflow<nsw> : i32
    llvm.store %41, %39 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %42 = llvm.or %34, %7 : i64
    %43 = llvm.getelementptr inbounds %6[%3, %42] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %44 = llvm.load %43 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.mul %44, %32 overflow<nsw> : i32
    %46 = llvm.or %38, %7 : i64
    %47 = llvm.getelementptr inbounds %0[%3, %46] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %48 = llvm.load %47 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %49 = llvm.add %48, %45 overflow<nsw> : i32
    llvm.store %49, %47 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.add %33, %9 overflow<nsw, nuw> : i64
    %51 = llvm.icmp "ult" %33, %10 : i64
    llvm.cond_br %51, ^bb6(%50 : i64), ^bb7 {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    %52 = llvm.add %28, %7 overflow<nsw, nuw> : i64
    %53 = llvm.icmp "eq" %52, %8 : i64
    llvm.cond_br %53, ^bb8, ^bb5(%52 : i64) {loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    %54 = llvm.add %26, %7 overflow<nsw, nuw> : i64
    %55 = llvm.icmp "eq" %54, %8 : i64
    llvm.cond_br %55, ^bb9, ^bb4(%54 : i64) {loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return %11 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(6 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(2 : i64) : i64
    %4 = llvm.mlir.constant(62 : i64) : i64
    %5 = llvm.mlir.constant(64 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%6: i64):  // 2 preds: ^bb0, ^bb5
    %7 = llvm.shl %6, %1 overflow<nsw> : i64
    llvm.br ^bb2(%0 : i64)
  ^bb2(%8: i64):  // 2 preds: ^bb1, ^bb4
    %9 = llvm.add %8, %7 overflow<nsw, nuw> : i64
    %10 = llvm.getelementptr inbounds %arg1[%9] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %11 = llvm.shl %8, %1 overflow<nsw> : i64
    llvm.br ^bb3(%0 : i64)
  ^bb3(%12: i64):  // 2 preds: ^bb2, ^bb3
    %13 = llvm.load %10 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %14 = llvm.add %12, %11 overflow<nsw, nuw> : i64
    %15 = llvm.getelementptr inbounds %arg2[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %16 = llvm.load %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %17 = llvm.mul %16, %13 overflow<nsw> : i32
    %18 = llvm.add %12, %7 overflow<nsw, nuw> : i64
    %19 = llvm.getelementptr inbounds %arg0[%18] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %20 = llvm.load %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %21 = llvm.add %20, %17 overflow<nsw> : i32
    llvm.store %21, %19 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.load %10 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.or %14, %2 : i64
    %24 = llvm.getelementptr inbounds %arg2[%23] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %25 = llvm.load %24 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.mul %25, %22 overflow<nsw> : i32
    %27 = llvm.or %18, %2 : i64
    %28 = llvm.getelementptr inbounds %arg0[%27] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %29 = llvm.load %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %30 = llvm.add %29, %26 overflow<nsw> : i32
    llvm.store %30, %28 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %31 = llvm.add %12, %3 overflow<nsw, nuw> : i64
    %32 = llvm.icmp "ult" %12, %4 : i64
    llvm.cond_br %32, ^bb3(%31 : i64), ^bb4 {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    %33 = llvm.add %8, %2 overflow<nsw, nuw> : i64
    %34 = llvm.icmp "eq" %33, %5 : i64
    llvm.cond_br %34, ^bb5, ^bb2(%33 : i64) {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %35 = llvm.add %6, %2 overflow<nsw, nuw> : i64
    %36 = llvm.icmp "eq" %35, %5 : i64
    llvm.cond_br %36, ^bb6, ^bb1(%35 : i64) {loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    llvm.return
  }
}
