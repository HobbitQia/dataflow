#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1A(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<4096 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2x1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2x2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2y1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2y2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<64 x i32>
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
    %15 = llvm.mlir.constant(6 : i64) : i64
    %16 = llvm.mlir.constant(2 : i64) : i64
    %17 = llvm.mlir.constant(62 : i64) : i64
    %18 = llvm.mlir.constant(0 : i32) : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    "llvm.intr.memset"(%3, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%4 : i64)
  ^bb1(%19: i64):  // 2 preds: ^bb0, ^bb1
    %20 = llvm.getelementptr inbounds %5[%4, %19] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %21 = llvm.trunc %19 : i64 to i32
    %22 = llvm.add %21, %6 : i32
    llvm.store %22, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.getelementptr inbounds %7[%4, %19] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %24 = llvm.trunc %19 : i64 to i32
    %25 = llvm.add %24, %8 : i32
    llvm.store %25, %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %26 = llvm.add %19, %9 overflow<nsw, nuw> : i64
    %27 = llvm.icmp "eq" %26, %10 : i64
    llvm.cond_br %27, ^bb2(%4 : i64), ^bb1(%26 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%28: i64):  // 2 preds: ^bb1, ^bb2
    %29 = llvm.trunc %28 : i64 to i32
    %30 = llvm.lshr %29, %11 : i32
    %31 = llvm.and %29, %12 : i32
    %32 = llvm.mul %30, %31 overflow<nsw, nuw> : i32
    %33 = llvm.and %32, %12 : i32
    %34 = llvm.getelementptr inbounds %13[%4, %28] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    llvm.store %33, %34 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %35 = llvm.add %28, %9 overflow<nsw, nuw> : i64
    %36 = llvm.icmp "eq" %35, %14 : i64
    llvm.cond_br %36, ^bb3(%4 : i64), ^bb2(%35 : i64) {loop_annotation = #loop_annotation}
  ^bb3(%37: i64):  // 2 preds: ^bb2, ^bb5
    %38 = llvm.getelementptr inbounds %5[%4, %37] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %39 = llvm.shl %37, %15 overflow<nsw> : i64
    %40 = llvm.getelementptr inbounds %7[%4, %37] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %41 = llvm.load %38 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %42 = llvm.load %40 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb4(%4 : i64)
  ^bb4(%43: i64):  // 2 preds: ^bb3, ^bb4
    %44 = llvm.getelementptr inbounds %0[%4, %43] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %45 = llvm.load %44 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.shl %43, %15 overflow<nsw, nuw> : i64
    %47 = llvm.add %46, %37 overflow<nsw, nuw> : i64
    %48 = llvm.getelementptr inbounds %13[%4, %47] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %49 = llvm.load %48 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.mul %41, %49 overflow<nsw> : i32
    %51 = llvm.add %50, %45 overflow<nsw> : i32
    llvm.store %51, %44 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %52 = llvm.getelementptr inbounds %3[%4, %43] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %53 = llvm.load %52 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %54 = llvm.add %43, %39 overflow<nsw, nuw> : i64
    %55 = llvm.getelementptr inbounds %13[%4, %54] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %56 = llvm.load %55 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %57 = llvm.mul %42, %56 overflow<nsw> : i32
    %58 = llvm.add %57, %53 overflow<nsw> : i32
    llvm.store %58, %52 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %59 = llvm.or %43, %9 : i64
    %60 = llvm.getelementptr inbounds %0[%4, %59] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %61 = llvm.load %60 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %62 = llvm.shl %59, %15 overflow<nsw> : i64
    %63 = llvm.add %62, %37 overflow<nsw, nuw> : i64
    %64 = llvm.getelementptr inbounds %13[%4, %63] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %65 = llvm.load %64 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %66 = llvm.mul %65, %41 overflow<nsw> : i32
    %67 = llvm.add %66, %61 overflow<nsw> : i32
    llvm.store %67, %60 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %68 = llvm.getelementptr inbounds %3[%4, %59] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %69 = llvm.load %68 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %70 = llvm.add %59, %39 overflow<nsw, nuw> : i64
    %71 = llvm.getelementptr inbounds %13[%4, %70] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %72 = llvm.load %71 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %73 = llvm.mul %72, %42 overflow<nsw> : i32
    %74 = llvm.add %73, %69 overflow<nsw> : i32
    llvm.store %74, %68 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %75 = llvm.add %43, %16 overflow<nsw, nuw> : i64
    %76 = llvm.icmp "ult" %43, %17 : i64
    llvm.cond_br %76, ^bb4(%75 : i64), ^bb5 {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %77 = llvm.add %37, %9 overflow<nsw, nuw> : i64
    %78 = llvm.icmp "eq" %77, %10 : i64
    llvm.cond_br %78, ^bb6, ^bb3(%77 : i64) {loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    llvm.return %18 : i32
  }
  llvm.func local_unnamed_addr @_Z6kernelPiS_PKiS1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(6 : i64) : i64
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(2 : i64) : i64
    %4 = llvm.mlir.constant(62 : i64) : i64
    %5 = llvm.mlir.constant(64 : i64) : i64
    llvm.br ^bb1(%0 : i64)
  ^bb1(%6: i64):  // 2 preds: ^bb0, ^bb3
    %7 = llvm.getelementptr inbounds %arg3[%6] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %8 = llvm.shl %6, %1 overflow<nsw> : i64
    %9 = llvm.getelementptr inbounds %arg4[%6] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    llvm.br ^bb2(%0 : i64)
  ^bb2(%10: i64):  // 2 preds: ^bb1, ^bb2
    %11 = llvm.getelementptr inbounds %arg0[%10] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %12 = llvm.load %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %13 = llvm.shl %10, %1 overflow<nsw, nuw> : i64
    %14 = llvm.add %13, %6 overflow<nsw, nuw> : i64
    %15 = llvm.getelementptr inbounds %arg2[%14] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %16 = llvm.load %15 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %17 = llvm.load %7 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %18 = llvm.mul %17, %16 overflow<nsw> : i32
    %19 = llvm.add %18, %12 overflow<nsw> : i32
    llvm.store %19, %11 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.getelementptr inbounds %arg1[%10] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %21 = llvm.load %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.add %10, %8 overflow<nsw, nuw> : i64
    %23 = llvm.getelementptr inbounds %arg2[%22] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %24 = llvm.load %23 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.load %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %26 = llvm.mul %25, %24 overflow<nsw> : i32
    %27 = llvm.add %26, %21 overflow<nsw> : i32
    llvm.store %27, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %28 = llvm.or %10, %2 : i64
    %29 = llvm.getelementptr inbounds %arg0[%28] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %30 = llvm.load %29 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %31 = llvm.shl %28, %1 overflow<nsw> : i64
    %32 = llvm.add %31, %6 overflow<nsw, nuw> : i64
    %33 = llvm.getelementptr inbounds %arg2[%32] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %34 = llvm.load %33 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.load %7 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %36 = llvm.mul %35, %34 overflow<nsw> : i32
    %37 = llvm.add %36, %30 overflow<nsw> : i32
    llvm.store %37, %29 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %38 = llvm.getelementptr inbounds %arg1[%28] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %39 = llvm.load %38 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %40 = llvm.add %28, %8 overflow<nsw, nuw> : i64
    %41 = llvm.getelementptr inbounds %arg2[%40] : (!llvm.ptr, i64) -> !llvm.ptr, i32
    %42 = llvm.load %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.load %9 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %44 = llvm.mul %43, %42 overflow<nsw> : i32
    %45 = llvm.add %44, %39 overflow<nsw> : i32
    llvm.store %45, %38 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %46 = llvm.add %10, %3 overflow<nsw, nuw> : i64
    %47 = llvm.icmp "ult" %10, %4 : i64
    llvm.cond_br %47, ^bb2(%46 : i64), ^bb3 {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %48 = llvm.add %6, %2 overflow<nsw, nuw> : i64
    %49 = llvm.icmp "eq" %48, %5 : i64
    llvm.cond_br %49, ^bb4, ^bb1(%48 : i64) {loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return
  }
}
