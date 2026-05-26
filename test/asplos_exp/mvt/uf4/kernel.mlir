#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal @_ZZ4mainE1A(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.mlir.global internal @_ZZ4mainE2x1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal @_ZZ4mainE2x2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal @_ZZ4mainE2y1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal @_ZZ4mainE2y2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.addressof @_ZZ4mainE2x1 : !llvm.ptr
    %1 = llvm.mlir.constant(0 : i8) : i8
    %2 = llvm.mlir.constant(256 : i64) : i64
    %3 = llvm.mlir.addressof @_ZZ4mainE2x2 : !llvm.ptr
    %4 = llvm.mlir.constant(0 : i64) : i64
    %5 = llvm.mlir.addressof @_ZZ4mainE2y1 : !llvm.ptr
    %6 = llvm.mlir.constant(3 : i32) : i32
    %7 = llvm.mlir.addressof @_ZZ4mainE2y2 : !llvm.ptr
    %8 = llvm.mlir.constant(4 : i32) : i32
    %9 = llvm.mlir.constant(1 : i64) : i64
    %10 = llvm.mlir.constant(64 : i64) : i64
    %11 = llvm.mlir.constant(6 : i32) : i32
    %12 = llvm.mlir.constant(63 : i32) : i32
    %13 = llvm.mlir.addressof @_ZZ4mainE1A : !llvm.ptr
    %14 = llvm.mlir.constant(4096 : i64) : i64
    %15 = llvm.mlir.constant(0 : i32) : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    "llvm.intr.memset"(%3, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%4 : i64)
  ^bb1(%16: i64):  // 2 preds: ^bb0, ^bb1
    %17 = llvm.getelementptr inbounds %5[%4, %16] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %18 = llvm.trunc %16 : i64 to i32
    %19 = llvm.add %18, %6 : i32
    llvm.store %19, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.getelementptr inbounds %7[%4, %16] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %21 = llvm.trunc %16 : i64 to i32
    %22 = llvm.add %21, %8 : i32
    llvm.store %22, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.add %16, %9 overflow<nsw, nuw> : i64
    %24 = llvm.icmp "eq" %23, %10 : i64
    llvm.cond_br %24, ^bb2(%4 : i64), ^bb1(%23 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%25: i64):  // 2 preds: ^bb1, ^bb2
    %26 = llvm.trunc %25 : i64 to i32
    %27 = llvm.lshr %26, %11 : i32
    %28 = llvm.and %26, %12 : i32
    %29 = llvm.mul %27, %28 overflow<nsw, nuw> : i32
    %30 = llvm.and %29, %12 : i32
    %31 = llvm.getelementptr inbounds %13[%4, %25] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    llvm.store %30, %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %32 = llvm.add %25, %9 overflow<nsw, nuw> : i64
    %33 = llvm.icmp "eq" %32, %14 : i64
    llvm.cond_br %33, ^bb3, ^bb2(%32 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.call tail @_Z6kernelPiS_PKiS1_S1_(%0, %3, %13, %5, %7) {no_unwind} : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> ()
    llvm.return %15 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPiS_PKiS1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(6 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(2 : i64) : i64
    %4 = llvm.mlir.constant(3 : i64) : i64
    %5 = llvm.mlir.constant(4 : i64) : i64
    %6 = llvm.mlir.constant(60 : i64) : i64
    %7 = llvm.mlir.constant(64 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%8: i64):  // 2 preds: ^bb0, ^bb3
    %9 = llvm.getelementptr inbounds %arg3[%8] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %10 = llvm.shl %8, %1 overflow<nsw> : i64
    %11 = llvm.getelementptr inbounds %arg4[%8] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.br ^bb2(%0 : i64)
  ^bb2(%12: i64):  // 2 preds: ^bb1, ^bb2
    %13 = llvm.getelementptr inbounds %arg0[%12] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %14 = llvm.load %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %15 = llvm.shl %12, %1 overflow<nsw, nuw> : i64
    %16 = llvm.add %15, %8 overflow<nsw, nuw> : i64
    %17 = llvm.getelementptr inbounds %arg2[%16] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %18 = llvm.load %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %19 = llvm.load %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %20 = llvm.mul %19, %18 overflow<nsw> : i32
    %21 = llvm.add %20, %14 overflow<nsw> : i32
    llvm.store %21, %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.getelementptr inbounds %arg1[%12] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %23 = llvm.load %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = llvm.add %12, %10 overflow<nsw, nuw> : i64
    %25 = llvm.getelementptr inbounds %arg2[%24] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %26 = llvm.load %25 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %27 = llvm.load %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %28 = llvm.mul %27, %26 overflow<nsw> : i32
    %29 = llvm.add %28, %23 overflow<nsw> : i32
    llvm.store %29, %22 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %30 = llvm.or %12, %2 : i64
    %31 = llvm.getelementptr inbounds %arg0[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %32 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %33 = llvm.shl %30, %1 overflow<nsw> : i64
    %34 = llvm.add %33, %8 overflow<nsw, nuw> : i64
    %35 = llvm.getelementptr inbounds %arg2[%34] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %36 = llvm.load %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.load %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %38 = llvm.mul %37, %36 overflow<nsw> : i32
    %39 = llvm.add %38, %32 overflow<nsw> : i32
    llvm.store %39, %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %40 = llvm.getelementptr inbounds %arg1[%30] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %41 = llvm.load %40 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %42 = llvm.add %30, %10 overflow<nsw, nuw> : i64
    %43 = llvm.getelementptr inbounds %arg2[%42] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %44 = llvm.load %43 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.load %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.mul %45, %44 overflow<nsw> : i32
    %47 = llvm.add %46, %41 overflow<nsw> : i32
    llvm.store %47, %40 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %48 = llvm.or %12, %3 : i64
    %49 = llvm.getelementptr inbounds %arg0[%48] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %50 = llvm.load %49 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %51 = llvm.shl %48, %1 overflow<nsw> : i64
    %52 = llvm.add %51, %8 overflow<nsw, nuw> : i64
    %53 = llvm.getelementptr inbounds %arg2[%52] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %54 = llvm.load %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %55 = llvm.load %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %56 = llvm.mul %55, %54 overflow<nsw> : i32
    %57 = llvm.add %56, %50 overflow<nsw> : i32
    llvm.store %57, %49 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %58 = llvm.getelementptr inbounds %arg1[%48] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %59 = llvm.load %58 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %60 = llvm.add %48, %10 overflow<nsw, nuw> : i64
    %61 = llvm.getelementptr inbounds %arg2[%60] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %62 = llvm.load %61 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %63 = llvm.load %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %64 = llvm.mul %63, %62 overflow<nsw> : i32
    %65 = llvm.add %64, %59 overflow<nsw> : i32
    llvm.store %65, %58 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %66 = llvm.or %12, %4 : i64
    %67 = llvm.getelementptr inbounds %arg0[%66] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %68 = llvm.load %67 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %69 = llvm.shl %66, %1 overflow<nsw> : i64
    %70 = llvm.add %69, %8 overflow<nsw, nuw> : i64
    %71 = llvm.getelementptr inbounds %arg2[%70] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %72 = llvm.load %71 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %73 = llvm.load %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %74 = llvm.mul %73, %72 overflow<nsw> : i32
    %75 = llvm.add %74, %68 overflow<nsw> : i32
    llvm.store %75, %67 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %76 = llvm.getelementptr inbounds %arg1[%66] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %77 = llvm.load %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %78 = llvm.add %66, %10 overflow<nsw, nuw> : i64
    %79 = llvm.getelementptr inbounds %arg2[%78] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %80 = llvm.load %79 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %81 = llvm.load %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %82 = llvm.mul %81, %80 overflow<nsw> : i32
    %83 = llvm.add %82, %77 overflow<nsw> : i32
    llvm.store %83, %76 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %84 = llvm.add %12, %5 overflow<nsw, nuw> : i64
    %85 = llvm.icmp "ult" %12, %6 : i64
    llvm.cond_br %85, ^bb2(%84 : i64), ^bb3 {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %86 = llvm.add %8, %2 overflow<nsw, nuw> : i64
    %87 = llvm.icmp "eq" %86, %7 : i64
    llvm.cond_br %87, ^bb4, ^bb1(%86 : i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return
  }
}
