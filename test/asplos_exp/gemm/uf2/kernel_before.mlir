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
    %17 = llvm.getelementptr inbounds %5[0, %15] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %18 = llvm.trunc %16 : i64 to i32
    llvm.store %18, %17 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.sub %12, %14 overflow<nsw> : i64
    %20 = llvm.getelementptr inbounds %6[0, %15] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
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
    %30 = llvm.getelementptr inbounds %5[0, %29] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %31 = llvm.shl %28, %4 overflow<nsw> : i64
    %32 = llvm.load %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb6(%3 : i64)
  ^bb6(%33: i64):  // 2 preds: ^bb5, ^bb6
    %34 = llvm.add %33, %31 overflow<nsw, nuw> : i64
    %35 = llvm.getelementptr inbounds %6[0, %34] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %36 = llvm.load %35 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.mul %36, %32 overflow<nsw> : i32
    %38 = llvm.add %33, %27 overflow<nsw, nuw> : i64
    %39 = llvm.getelementptr inbounds %0[0, %38] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %40 = llvm.load %39 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %41 = llvm.add %40, %37 overflow<nsw> : i32
    llvm.store %41, %39 {alignment = 8 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %42 = llvm.or %34, %7 : i64
    %43 = llvm.getelementptr inbounds %6[0, %42] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %44 = llvm.load %43 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.mul %44, %32 overflow<nsw> : i32
    %46 = llvm.or %38, %7 : i64
    %47 = llvm.getelementptr inbounds %0[0, %46] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
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
  func.func @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.constant"() <{value = 6 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.constant"() <{value = 2 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.constant"() <{value = 62 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.constant"() <{value = 64 : i64}> : () -> !neura.data<i64, i1>
    neura.br %3, %4, %3, %1, %2, %0, %5, %6, %7, %8 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb1(%9: !neura.data<i64, i1>, %10: !neura.data<i64, i1>, %11: !neura.data<i64, i1>, %12: !neura.data<!llvm.ptr, i1>, %13: !neura.data<!llvm.ptr, i1>, %14: !neura.data<!llvm.ptr, i1>, %15: !neura.data<i64, i1>, %16: !neura.data<i64, i1>, %17: !neura.data<i64, i1>, %18: !neura.data<i64, i1>):  // 2 preds: ^bb0, ^bb5
    %19 = "neura.shl"(%9, %10) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.br %11, %19, %12, %10, %11, %13, %14, %15, %16, %17, %18, %9 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb2
  ^bb2(%20: !neura.data<i64, i1>, %21: !neura.data<i64, i1>, %22: !neura.data<!llvm.ptr, i1>, %23: !neura.data<i64, i1>, %24: !neura.data<i64, i1>, %25: !neura.data<!llvm.ptr, i1>, %26: !neura.data<!llvm.ptr, i1>, %27: !neura.data<i64, i1>, %28: !neura.data<i64, i1>, %29: !neura.data<i64, i1>, %30: !neura.data<i64, i1>, %31: !neura.data<i64, i1>):  // 2 preds: ^bb1, ^bb4
    %32 = "neura.add"(%20, %21) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = "neura.gep"(%22, %32) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = "neura.shl"(%20, %23) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.br %24, %33, %34, %25, %21, %26, %27, %28, %29, %20, %30, %31, %22, %23, %24 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb3
  ^bb3(%35: !neura.data<i64, i1>, %36: !neura.data<!llvm.ptr, i1>, %37: !neura.data<i64, i1>, %38: !neura.data<!llvm.ptr, i1>, %39: !neura.data<i64, i1>, %40: !neura.data<!llvm.ptr, i1>, %41: !neura.data<i64, i1>, %42: !neura.data<i64, i1>, %43: !neura.data<i64, i1>, %44: !neura.data<i64, i1>, %45: !neura.data<i64, i1>, %46: !neura.data<i64, i1>, %47: !neura.data<!llvm.ptr, i1>, %48: !neura.data<i64, i1>, %49: !neura.data<i64, i1>):  // 2 preds: ^bb2, ^bb3
    %50 = "neura.load"(%36) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %51 = "neura.add"(%35, %37) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = "neura.gep"(%38, %51) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %53 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %54 = "neura.mul"(%53, %50) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %55 = "neura.add"(%35, %39) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %56 = "neura.gep"(%40, %55) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %57 = "neura.load"(%56) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %58 = "neura.add"(%57, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%58, %56) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %59 = "neura.load"(%36) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %60 = "neura.or"(%51, %41) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %61 = "neura.gep"(%38, %60) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %62 = "neura.load"(%61) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %63 = "neura.mul"(%62, %59) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %64 = "neura.or"(%55, %41) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = "neura.gep"(%40, %64) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %66 = "neura.load"(%65) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %67 = "neura.add"(%66, %63) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%67, %65) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %68 = "neura.add"(%35, %42) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.icmp"(%35, %43) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %69 : !neura.data<i1, i1> then %68, %36, %37, %38, %39, %40, %41, %42, %43, %44, %45, %46, %47, %48, %49 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb3 else %44, %41, %45, %46, %39, %47, %48, %49, %38, %40, %42, %43 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb4
  ^bb4(%70: !neura.data<i64, i1>, %71: !neura.data<i64, i1>, %72: !neura.data<i64, i1>, %73: !neura.data<i64, i1>, %74: !neura.data<i64, i1>, %75: !neura.data<!llvm.ptr, i1>, %76: !neura.data<i64, i1>, %77: !neura.data<i64, i1>, %78: !neura.data<!llvm.ptr, i1>, %79: !neura.data<!llvm.ptr, i1>, %80: !neura.data<i64, i1>, %81: !neura.data<i64, i1>):  // pred: ^bb3
    %82 = "neura.add"(%70, %71) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83 = "neura.icmp"(%82, %72) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %83 : !neura.data<i1, i1> then %73, %71, %72, %76, %77, %75, %78, %79, %80, %81 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb5 else %82, %74, %75, %76, %77, %78, %79, %71, %80, %81, %72, %73 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb2
  ^bb5(%84: !neura.data<i64, i1>, %85: !neura.data<i64, i1>, %86: !neura.data<i64, i1>, %87: !neura.data<i64, i1>, %88: !neura.data<i64, i1>, %89: !neura.data<!llvm.ptr, i1>, %90: !neura.data<!llvm.ptr, i1>, %91: !neura.data<!llvm.ptr, i1>, %92: !neura.data<i64, i1>, %93: !neura.data<i64, i1>):  // pred: ^bb4
    %94 = "neura.add"(%84, %85) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %95 = "neura.icmp"(%94, %86) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %95 : !neura.data<i1, i1> then %95 : !neura.data<i1, i1> to ^bb6 else %94, %87, %88, %89, %90, %91, %85, %92, %93, %86 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb6(%96: !neura.data<i1, i1>):  // pred: ^bb5
    "neura.return"(%96) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

