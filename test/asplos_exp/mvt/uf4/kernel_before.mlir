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
    %17 = llvm.getelementptr inbounds %5[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %18 = llvm.trunc %16 : i64 to i32
    %19 = llvm.add %18, %6 : i32
    llvm.store %19, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %20 = llvm.getelementptr inbounds %7[0, %16] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
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
    %31 = llvm.getelementptr inbounds %13[0, %25] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    llvm.store %30, %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %32 = llvm.add %25, %9 overflow<nsw, nuw> : i64
    %33 = llvm.icmp "eq" %32, %14 : i64
    llvm.cond_br %33, ^bb3, ^bb2(%32 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %34 = func.call @_Z6kernelPiS_PKiS1_S1_(%0, %3, %13, %5, %7) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> !llvm.void
    llvm.return %15 : i32
  }
  func.func @_Z6kernelPiS_PKiS1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.constant"() <{value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.constant"() <{value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
    %5 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.constant"() <{value = 6 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.constant"() <{value = 2 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.constant"() <{value = 3 : i64}> : () -> !neura.data<i64, i1>
    %10 = "neura.constant"() <{value = 4 : i64}> : () -> !neura.data<i64, i1>
    %11 = "neura.constant"() <{value = 60 : i64}> : () -> !neura.data<i64, i1>
    %12 = "neura.constant"() <{value = 64 : i64}> : () -> !neura.data<i64, i1>
    neura.br %5, %3, %6, %4, %5, %0, %2, %1, %7, %8, %9, %10, %11, %12 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb1(%13: !neura.data<i64, i1>, %14: !neura.data<!llvm.ptr, i1>, %15: !neura.data<i64, i1>, %16: !neura.data<!llvm.ptr, i1>, %17: !neura.data<i64, i1>, %18: !neura.data<!llvm.ptr, i1>, %19: !neura.data<!llvm.ptr, i1>, %20: !neura.data<!llvm.ptr, i1>, %21: !neura.data<i64, i1>, %22: !neura.data<i64, i1>, %23: !neura.data<i64, i1>, %24: !neura.data<i64, i1>, %25: !neura.data<i64, i1>, %26: !neura.data<i64, i1>):  // 2 preds: ^bb0, ^bb3
    %27 = "neura.gep"(%14, %13) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %28 = "neura.shl"(%13, %15) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = "neura.gep"(%16, %13) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.br %17, %18, %15, %13, %19, %27, %20, %28, %29, %21, %22, %23, %24, %25, %26, %14, %16, %17 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1> to ^bb2
  ^bb2(%30: !neura.data<i64, i1>, %31: !neura.data<!llvm.ptr, i1>, %32: !neura.data<i64, i1>, %33: !neura.data<i64, i1>, %34: !neura.data<!llvm.ptr, i1>, %35: !neura.data<!llvm.ptr, i1>, %36: !neura.data<!llvm.ptr, i1>, %37: !neura.data<i64, i1>, %38: !neura.data<!llvm.ptr, i1>, %39: !neura.data<i64, i1>, %40: !neura.data<i64, i1>, %41: !neura.data<i64, i1>, %42: !neura.data<i64, i1>, %43: !neura.data<i64, i1>, %44: !neura.data<i64, i1>, %45: !neura.data<!llvm.ptr, i1>, %46: !neura.data<!llvm.ptr, i1>, %47: !neura.data<i64, i1>):  // 2 preds: ^bb1, ^bb2
    %48 = "neura.gep"(%31, %30) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %49 = "neura.load"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %50 = "neura.shl"(%30, %32) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.add"(%50, %33) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = "neura.gep"(%34, %51) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %53 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %54 = "neura.load"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %55 = "neura.mul"(%54, %53) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %56 = "neura.add"(%55, %49) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%56, %48) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %57 = "neura.gep"(%36, %30) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %58 = "neura.load"(%57) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %59 = "neura.add"(%30, %37) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.gep"(%34, %59) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %61 = "neura.load"(%60) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %62 = "neura.load"(%38) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %63 = "neura.mul"(%62, %61) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %64 = "neura.add"(%63, %58) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%64, %57) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %65 = "neura.or"(%30, %39) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66 = "neura.gep"(%31, %65) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %67 = "neura.load"(%66) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %68 = "neura.shl"(%65, %32) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.add"(%68, %33) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70 = "neura.gep"(%34, %69) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.load"(%70) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %72 = "neura.load"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %73 = "neura.mul"(%72, %71) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %74 = "neura.add"(%73, %67) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%74, %66) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %75 = "neura.gep"(%36, %65) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %76 = "neura.load"(%75) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %77 = "neura.add"(%65, %37) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %78 = "neura.gep"(%34, %77) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %79 = "neura.load"(%78) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %80 = "neura.load"(%38) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %81 = "neura.mul"(%80, %79) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %82 = "neura.add"(%81, %76) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%82, %75) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %83 = "neura.or"(%30, %40) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %84 = "neura.gep"(%31, %83) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %85 = "neura.load"(%84) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %86 = "neura.shl"(%83, %32) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %87 = "neura.add"(%86, %33) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %88 = "neura.gep"(%34, %87) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %89 = "neura.load"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %90 = "neura.load"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %91 = "neura.mul"(%90, %89) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %92 = "neura.add"(%91, %85) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%92, %84) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %93 = "neura.gep"(%36, %83) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %94 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %95 = "neura.add"(%83, %37) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %96 = "neura.gep"(%34, %95) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %97 = "neura.load"(%96) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %98 = "neura.load"(%38) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %99 = "neura.mul"(%98, %97) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %100 = "neura.add"(%99, %94) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%100, %93) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %101 = "neura.or"(%30, %41) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %102 = "neura.gep"(%31, %101) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = "neura.load"(%102) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %104 = "neura.shl"(%101, %32) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %105 = "neura.add"(%104, %33) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %106 = "neura.gep"(%34, %105) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %107 = "neura.load"(%106) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %108 = "neura.load"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %109 = "neura.mul"(%108, %107) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %110 = "neura.add"(%109, %103) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%110, %102) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %111 = "neura.gep"(%36, %101) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %112 = "neura.load"(%111) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %113 = "neura.add"(%101, %37) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %114 = "neura.gep"(%34, %113) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %115 = "neura.load"(%114) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %116 = "neura.load"(%38) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %117 = "neura.mul"(%116, %115) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %118 = "neura.add"(%117, %112) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%118, %111) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %119 = "neura.add"(%30, %42) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %120 = "neura.icmp"(%30, %43) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %120 : !neura.data<i1, i1> then %119, %31, %32, %33, %34, %35, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1> to ^bb2 else %33, %39, %44, %45, %32, %46, %47, %31, %34, %36, %40, %41, %42, %43 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb3
  ^bb3(%121: !neura.data<i64, i1>, %122: !neura.data<i64, i1>, %123: !neura.data<i64, i1>, %124: !neura.data<!llvm.ptr, i1>, %125: !neura.data<i64, i1>, %126: !neura.data<!llvm.ptr, i1>, %127: !neura.data<i64, i1>, %128: !neura.data<!llvm.ptr, i1>, %129: !neura.data<!llvm.ptr, i1>, %130: !neura.data<!llvm.ptr, i1>, %131: !neura.data<i64, i1>, %132: !neura.data<i64, i1>, %133: !neura.data<i64, i1>, %134: !neura.data<i64, i1>):  // pred: ^bb2
    %135 = "neura.add"(%121, %122) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %136 = "neura.icmp"(%135, %123) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %136 : !neura.data<i1, i1> then %136 : !neura.data<i1, i1> to ^bb4 else %135, %124, %125, %126, %127, %128, %129, %130, %122, %131, %132, %133, %134, %123 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb4(%137: !neura.data<i1, i1>):  // pred: ^bb3
    "neura.return"(%137) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

