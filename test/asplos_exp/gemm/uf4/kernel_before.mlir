#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %9 = llvm.mlir.poison : vector<4xi32>
    %10 = llvm.mlir.constant(4 : i64) : i64
    %11 = llvm.mlir.constant(60 : i64) : i64
    %12 = llvm.mlir.constant(0 : i32) : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%3 : i64)
  ^bb1(%13: i64):  // 2 preds: ^bb0, ^bb3
    %14 = llvm.shl %13, %4 overflow<nsw> : i64
    llvm.br ^bb2(%3 : i64)
  ^bb2(%15: i64):  // 2 preds: ^bb1, ^bb2
    %16 = llvm.add %15, %14 overflow<nsw, nuw> : i64
    %17 = llvm.add %15, %13 overflow<nsw, nuw> : i64
    %18 = llvm.getelementptr inbounds %5[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %19 = llvm.trunc %17 : i64 to i32
    llvm.store %19, %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.sub %13, %15 overflow<nsw> : i64
    %21 = llvm.getelementptr inbounds %6[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %22 = llvm.trunc %20 : i64 to i32
    llvm.store %22, %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.add %15, %7 overflow<nsw, nuw> : i64
    %24 = llvm.icmp "eq" %23, %8 : i64
    llvm.cond_br %24, ^bb3, ^bb2(%23 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %25 = llvm.add %13, %7 overflow<nsw, nuw> : i64
    %26 = llvm.icmp "eq" %25, %8 : i64
    llvm.cond_br %26, ^bb4(%3 : i64), ^bb1(%25 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%27: i64):  // 2 preds: ^bb3, ^bb8
    %28 = llvm.shl %27, %4 overflow<nsw> : i64
    llvm.br ^bb5(%3 : i64)
  ^bb5(%29: i64):  // 2 preds: ^bb4, ^bb7
    %30 = llvm.add %29, %28 overflow<nsw, nuw> : i64
    %31 = llvm.getelementptr inbounds %5[0, %30] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %32 = llvm.shl %29, %4 overflow<nsw> : i64
    %33 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %34 = llvm.insertelement %33, %9[%3 : i64] : vector<4xi32>
    %35 = llvm.shufflevector %34, %9 [0, 0, 0, 0] : vector<4xi32> 
    llvm.br ^bb6(%3 : i64)
  ^bb6(%36: i64):  // 2 preds: ^bb5, ^bb6
    %37 = llvm.add %36, %32 overflow<nsw, nuw> : i64
    %38 = llvm.getelementptr inbounds %6[0, %37] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %39 = llvm.add %36, %28 overflow<nsw, nuw> : i64
    %40 = llvm.getelementptr inbounds %0[0, %39] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %41 = llvm.load %38 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> vector<4xi32>
    %42 = llvm.mul %41, %35 overflow<nsw> : vector<4xi32>
    %43 = llvm.load %40 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> vector<4xi32>
    %44 = llvm.add %43, %42 overflow<nsw> : vector<4xi32>
    llvm.store %44, %40 {alignment = 16 : i64, tbaa = [#tbaa_tag]} : vector<4xi32>, !llvm.ptr
    %45 = llvm.add %36, %10 overflow<nsw, nuw> : i64
    %46 = llvm.icmp "ult" %36, %11 : i64
    llvm.cond_br %46, ^bb6(%45 : i64), ^bb7 {loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    %47 = llvm.add %29, %7 overflow<nsw, nuw> : i64
    %48 = llvm.icmp "eq" %47, %8 : i64
    llvm.cond_br %48, ^bb8, ^bb5(%47 : i64) {loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    %49 = llvm.add %27, %7 overflow<nsw, nuw> : i64
    %50 = llvm.icmp "eq" %49, %8 : i64
    llvm.cond_br %50, ^bb9, ^bb4(%49 : i64) {loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return %12 : i32
  }
  func.func @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.constant"() <{value = 6 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.constant"() <{value = 2 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.constant"() <{value = 3 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.constant"() <{value = 4 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.constant"() <{value = 60 : i64}> : () -> !neura.data<i64, i1>
    %10 = "neura.constant"() <{value = 64 : i64}> : () -> !neura.data<i64, i1>
    neura.br %3, %4, %3, %1, %2, %0, %5, %6, %7, %8, %9, %10 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb1(%11: !neura.data<i64, i1>, %12: !neura.data<i64, i1>, %13: !neura.data<i64, i1>, %14: !neura.data<!llvm.ptr, i1>, %15: !neura.data<!llvm.ptr, i1>, %16: !neura.data<!llvm.ptr, i1>, %17: !neura.data<i64, i1>, %18: !neura.data<i64, i1>, %19: !neura.data<i64, i1>, %20: !neura.data<i64, i1>, %21: !neura.data<i64, i1>, %22: !neura.data<i64, i1>):  // 2 preds: ^bb0, ^bb5
    %23 = "neura.shl"(%11, %12) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.br %13, %23, %14, %12, %13, %15, %16, %17, %18, %19, %20, %21, %22, %11 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb2
  ^bb2(%24: !neura.data<i64, i1>, %25: !neura.data<i64, i1>, %26: !neura.data<!llvm.ptr, i1>, %27: !neura.data<i64, i1>, %28: !neura.data<i64, i1>, %29: !neura.data<!llvm.ptr, i1>, %30: !neura.data<!llvm.ptr, i1>, %31: !neura.data<i64, i1>, %32: !neura.data<i64, i1>, %33: !neura.data<i64, i1>, %34: !neura.data<i64, i1>, %35: !neura.data<i64, i1>, %36: !neura.data<i64, i1>, %37: !neura.data<i64, i1>):  // 2 preds: ^bb1, ^bb4
    %38 = "neura.add"(%24, %25) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = "neura.gep"(%26, %38) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = "neura.shl"(%24, %27) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.br %28, %39, %40, %29, %25, %30, %31, %32, %33, %34, %35, %24, %36, %37, %26, %27, %28 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb3
  ^bb3(%41: !neura.data<i64, i1>, %42: !neura.data<!llvm.ptr, i1>, %43: !neura.data<i64, i1>, %44: !neura.data<!llvm.ptr, i1>, %45: !neura.data<i64, i1>, %46: !neura.data<!llvm.ptr, i1>, %47: !neura.data<i64, i1>, %48: !neura.data<i64, i1>, %49: !neura.data<i64, i1>, %50: !neura.data<i64, i1>, %51: !neura.data<i64, i1>, %52: !neura.data<i64, i1>, %53: !neura.data<i64, i1>, %54: !neura.data<i64, i1>, %55: !neura.data<!llvm.ptr, i1>, %56: !neura.data<i64, i1>, %57: !neura.data<i64, i1>):  // 2 preds: ^bb2, ^bb3
    %58 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %59 = "neura.add"(%41, %43) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.gep"(%44, %59) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %61 = "neura.load"(%60) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %62 = "neura.mul"(%61, %58) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %63 = "neura.add"(%41, %45) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %64 = "neura.gep"(%46, %63) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %65 = "neura.load"(%64) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %66 = "neura.add"(%65, %62) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%66, %64) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %67 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %68 = "neura.or"(%59, %47) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.gep"(%44, %68) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = "neura.load"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %71 = "neura.mul"(%70, %67) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %72 = "neura.or"(%63, %47) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %73 = "neura.gep"(%46, %72) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %74 = "neura.load"(%73) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %75 = "neura.add"(%74, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%75, %73) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %76 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %77 = "neura.or"(%59, %48) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78 = "neura.gep"(%44, %77) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %79 = "neura.load"(%78) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %80 = "neura.mul"(%79, %76) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %81 = "neura.or"(%63, %48) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82 = "neura.gep"(%46, %81) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.load"(%82) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %84 = "neura.add"(%83, %80) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%84, %82) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %85 = "neura.load"(%42) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %86 = "neura.or"(%59, %49) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %87 = "neura.gep"(%44, %86) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %88 = "neura.load"(%87) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %89 = "neura.mul"(%88, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %90 = "neura.or"(%63, %49) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %91 = "neura.gep"(%46, %90) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %92 = "neura.load"(%91) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %93 = "neura.add"(%92, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%93, %91) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %94 = "neura.add"(%41, %50) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %95 = "neura.icmp"(%41, %51) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %95 : !neura.data<i1, i1> then %94, %42, %43, %44, %45, %46, %47, %48, %49, %50, %51, %52, %53, %54, %55, %56, %57 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb3 else %52, %47, %53, %54, %45, %55, %56, %57, %44, %46, %48, %49, %50, %51 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb4
  ^bb4(%96: !neura.data<i64, i1>, %97: !neura.data<i64, i1>, %98: !neura.data<i64, i1>, %99: !neura.data<i64, i1>, %100: !neura.data<i64, i1>, %101: !neura.data<!llvm.ptr, i1>, %102: !neura.data<i64, i1>, %103: !neura.data<i64, i1>, %104: !neura.data<!llvm.ptr, i1>, %105: !neura.data<!llvm.ptr, i1>, %106: !neura.data<i64, i1>, %107: !neura.data<i64, i1>, %108: !neura.data<i64, i1>, %109: !neura.data<i64, i1>):  // pred: ^bb3
    %110 = "neura.add"(%96, %97) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %111 = "neura.icmp"(%110, %98) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %111 : !neura.data<i1, i1> then %99, %97, %98, %102, %103, %101, %104, %105, %106, %107, %108, %109 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb5 else %110, %100, %101, %102, %103, %104, %105, %97, %106, %107, %108, %109, %98, %99 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb2
  ^bb5(%112: !neura.data<i64, i1>, %113: !neura.data<i64, i1>, %114: !neura.data<i64, i1>, %115: !neura.data<i64, i1>, %116: !neura.data<i64, i1>, %117: !neura.data<!llvm.ptr, i1>, %118: !neura.data<!llvm.ptr, i1>, %119: !neura.data<!llvm.ptr, i1>, %120: !neura.data<i64, i1>, %121: !neura.data<i64, i1>, %122: !neura.data<i64, i1>, %123: !neura.data<i64, i1>):  // pred: ^bb4
    %124 = "neura.add"(%112, %113) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %125 = "neura.icmp"(%124, %114) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %125 : !neura.data<i1, i1> then %125 : !neura.data<i1, i1> to ^bb6 else %124, %115, %116, %117, %118, %119, %113, %120, %121, %122, %123, %114 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb6(%126: !neura.data<i1, i1>):  // pred: ^bb5
    "neura.return"(%126) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

