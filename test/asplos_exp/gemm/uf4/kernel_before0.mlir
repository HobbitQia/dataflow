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
  func.func @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.grant_once"() <{constant_value = 60 : i64}> : () -> !neura.data<i64, i1>
    %10 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.phi_start %10, %11 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.phi_start %9, %13 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.phi_start %8, %15 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.phi_start %7, %17 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = neura.phi_start %6, %19 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = neura.phi_start %5, %21 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %24 = neura.phi_start %0, %23 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %25 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %26 = neura.phi_start %2, %25 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %27 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %28 = neura.phi_start %1, %27 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30 = neura.phi_start %3, %29 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<i64, i1>
    %32 = neura.phi_start %4, %31 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = neura.phi_start %3, %33 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %35 = "neura.shl"(%34, %32) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = neura.phi_start %34, %36 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39 = neura.phi_start %12, %38 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = neura.phi_start %14, %40 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %42 = neura.reserve : !neura.data<i64, i1>
    %43 = neura.phi_start %16, %42 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %44 = neura.reserve : !neura.data<i64, i1>
    %45 = neura.phi_start %18, %44 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %46 = neura.reserve : !neura.data<i64, i1>
    %47 = neura.phi_start %20, %46 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<i64, i1>
    %49 = neura.phi_start %22, %48 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %50 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %51 = neura.phi_start %24, %50 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %52 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %53 = neura.phi_start %26, %52 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %54 = neura.reserve : !neura.data<i64, i1>
    %55 = neura.phi_start %30, %54 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %56 = neura.reserve : !neura.data<i64, i1>
    %57 = neura.phi_start %32, %56 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %58 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %59 = neura.phi_start %28, %58 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %60 = neura.reserve : !neura.data<i64, i1>
    %61 = neura.phi_start %35, %60 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %62 = neura.reserve : !neura.data<i64, i1>
    %63 = neura.phi_start %30, %62 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %64 = "neura.add"(%63, %61) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = "neura.gep"(%59, %64) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %66 = "neura.shl"(%63, %57) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67 = neura.reserve : !neura.data<i64, i1>
    %68 = neura.phi_start %55, %67 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %69 = neura.reserve : !neura.data<i64, i1>
    %70 = neura.phi_start %57, %69 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %71 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %72 = neura.phi_start %59, %71 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %73 = neura.reserve : !neura.data<i64, i1>
    %74 = neura.phi_start %37, %73 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %75 = neura.reserve : !neura.data<i64, i1>
    %76 = neura.phi_start %39, %75 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %77 = neura.reserve : !neura.data<i64, i1>
    %78 = neura.phi_start %63, %77 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %79 = neura.reserve : !neura.data<i64, i1>
    %80 = neura.phi_start %41, %79 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %81 = neura.reserve : !neura.data<i64, i1>
    %82 = neura.phi_start %43, %81 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %83 = neura.reserve : !neura.data<i64, i1>
    %84 = neura.phi_start %45, %83 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %85 = neura.reserve : !neura.data<i64, i1>
    %86 = neura.phi_start %47, %85 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %87 = neura.reserve : !neura.data<i64, i1>
    %88 = neura.phi_start %49, %87 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %89 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %90 = neura.phi_start %51, %89 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %91 = neura.reserve : !neura.data<i64, i1>
    %92 = neura.phi_start %61, %91 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %93 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %94 = neura.phi_start %53, %93 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %95 = neura.reserve : !neura.data<i64, i1>
    %96 = neura.phi_start %66, %95 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %97 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %98 = neura.phi_start %65, %97 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %99 = neura.reserve : !neura.data<i64, i1>
    %100 = neura.phi_start %55, %99 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %101 = "neura.load"(%98) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %102 = "neura.add"(%100, %96) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %103 = "neura.gep"(%94, %102) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %104 = "neura.load"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %105 = "neura.mul"(%104, %101) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %106 = "neura.add"(%100, %92) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %107 = "neura.gep"(%90, %106) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %108 = "neura.load"(%107) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %109 = "neura.add"(%108, %105) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%109, %107) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %110 = "neura.load"(%98) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %111 = "neura.or"(%102, %88) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %112 = "neura.gep"(%94, %111) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %113 = "neura.load"(%112) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %114 = "neura.mul"(%113, %110) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %115 = "neura.or"(%106, %88) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %116 = "neura.gep"(%90, %115) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %117 = "neura.load"(%116) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %118 = "neura.add"(%117, %114) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%118, %116) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %119 = "neura.load"(%98) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %120 = "neura.or"(%102, %86) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %121 = "neura.gep"(%94, %120) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %122 = "neura.load"(%121) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %123 = "neura.mul"(%122, %119) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %124 = "neura.or"(%106, %86) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %125 = "neura.gep"(%90, %124) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %126 = "neura.load"(%125) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %127 = "neura.add"(%126, %123) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%127, %125) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %128 = "neura.load"(%98) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %129 = "neura.or"(%102, %84) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %130 = "neura.gep"(%94, %129) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %131 = "neura.load"(%130) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %132 = "neura.mul"(%131, %128) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %133 = "neura.or"(%106, %84) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %134 = "neura.gep"(%90, %133) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %135 = "neura.load"(%134) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %136 = "neura.add"(%135, %132) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%136, %134) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %137 = "neura.add"(%100, %82) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %138 = "neura.icmp"(%100, %80) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %139 = neura.grant_predicate %137, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %139 -> %99 : !neura.data<i64, i1> !neura.data<i64, i1>
    %140 = neura.grant_predicate %98, %138 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %140 -> %97 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %141 = neura.grant_predicate %96, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %141 -> %95 : !neura.data<i64, i1> !neura.data<i64, i1>
    %142 = neura.grant_predicate %94, %138 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %142 -> %93 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %143 = neura.grant_predicate %92, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %143 -> %91 : !neura.data<i64, i1> !neura.data<i64, i1>
    %144 = neura.grant_predicate %90, %138 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %144 -> %89 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %145 = neura.grant_predicate %88, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %145 -> %87 : !neura.data<i64, i1> !neura.data<i64, i1>
    %146 = neura.grant_predicate %86, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %146 -> %85 : !neura.data<i64, i1> !neura.data<i64, i1>
    %147 = neura.grant_predicate %84, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %147 -> %83 : !neura.data<i64, i1> !neura.data<i64, i1>
    %148 = neura.grant_predicate %82, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %148 -> %81 : !neura.data<i64, i1> !neura.data<i64, i1>
    %149 = neura.grant_predicate %80, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %149 -> %79 : !neura.data<i64, i1> !neura.data<i64, i1>
    %150 = neura.grant_predicate %78, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %150 -> %77 : !neura.data<i64, i1> !neura.data<i64, i1>
    %151 = neura.grant_predicate %76, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %151 -> %75 : !neura.data<i64, i1> !neura.data<i64, i1>
    %152 = neura.grant_predicate %74, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %152 -> %73 : !neura.data<i64, i1> !neura.data<i64, i1>
    %153 = neura.grant_predicate %72, %138 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %153 -> %71 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %154 = neura.grant_predicate %70, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %154 -> %69 : !neura.data<i64, i1> !neura.data<i64, i1>
    %155 = neura.grant_predicate %68, %138 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %155 -> %67 : !neura.data<i64, i1> !neura.data<i64, i1>
    %156 = "neura.not"(%138) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %157 = neura.grant_predicate %78, %156 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %158 = neura.grant_predicate %88, %156 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %159 = neura.grant_predicate %76, %156 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %160 = neura.grant_predicate %74, %156 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %161 = neura.grant_predicate %92, %156 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %162 = neura.grant_predicate %72, %156 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %163 = neura.grant_predicate %70, %156 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %164 = neura.grant_predicate %68, %156 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %165 = neura.grant_predicate %94, %156 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %166 = neura.grant_predicate %90, %156 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %167 = neura.grant_predicate %86, %156 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %168 = neura.grant_predicate %84, %156 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %169 = neura.grant_predicate %82, %156 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %170 = neura.grant_predicate %80, %156 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %171 = "neura.add"(%157, %158) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %172 = "neura.icmp"(%171, %159) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %173 = "neura.not"(%172) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %174 = neura.grant_predicate %171, %173 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %174 -> %62 : !neura.data<i64, i1> !neura.data<i64, i1>
    %175 = neura.grant_predicate %161, %173 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %175 -> %60 : !neura.data<i64, i1> !neura.data<i64, i1>
    %176 = neura.grant_predicate %162, %173 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %176 -> %58 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %177 = neura.grant_predicate %163, %173 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %177 -> %56 : !neura.data<i64, i1> !neura.data<i64, i1>
    %178 = neura.grant_predicate %164, %173 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %178 -> %54 : !neura.data<i64, i1> !neura.data<i64, i1>
    %179 = neura.grant_predicate %165, %173 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %179 -> %52 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %180 = neura.grant_predicate %166, %173 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %180 -> %50 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %181 = neura.grant_predicate %158, %173 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %181 -> %48 : !neura.data<i64, i1> !neura.data<i64, i1>
    %182 = neura.grant_predicate %167, %173 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %182 -> %46 : !neura.data<i64, i1> !neura.data<i64, i1>
    %183 = neura.grant_predicate %168, %173 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %183 -> %44 : !neura.data<i64, i1> !neura.data<i64, i1>
    %184 = neura.grant_predicate %169, %173 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %184 -> %42 : !neura.data<i64, i1> !neura.data<i64, i1>
    %185 = neura.grant_predicate %170, %173 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %185 -> %40 : !neura.data<i64, i1> !neura.data<i64, i1>
    %186 = neura.grant_predicate %159, %173 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %186 -> %38 : !neura.data<i64, i1> !neura.data<i64, i1>
    %187 = neura.grant_predicate %160, %173 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %187 -> %36 : !neura.data<i64, i1> !neura.data<i64, i1>
    %188 = neura.grant_predicate %160, %172 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %189 = neura.grant_predicate %158, %172 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %190 = neura.grant_predicate %159, %172 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %191 = neura.grant_predicate %163, %172 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %192 = neura.grant_predicate %164, %172 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %193 = neura.grant_predicate %162, %172 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %194 = neura.grant_predicate %165, %172 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %195 = neura.grant_predicate %166, %172 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %196 = neura.grant_predicate %167, %172 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %197 = neura.grant_predicate %168, %172 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %198 = neura.grant_predicate %169, %172 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %199 = neura.grant_predicate %170, %172 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %200 = "neura.add"(%188, %189) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %201 = "neura.icmp"(%200, %190) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %202 = "neura.not"(%201) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %203 = neura.grant_predicate %200, %202 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %203 -> %33 : !neura.data<i64, i1> !neura.data<i64, i1>
    %204 = neura.grant_predicate %191, %202 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %204 -> %31 : !neura.data<i64, i1> !neura.data<i64, i1>
    %205 = neura.grant_predicate %192, %202 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %205 -> %29 : !neura.data<i64, i1> !neura.data<i64, i1>
    %206 = neura.grant_predicate %193, %202 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %206 -> %27 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %207 = neura.grant_predicate %194, %202 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %207 -> %25 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %208 = neura.grant_predicate %195, %202 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %208 -> %23 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %209 = neura.grant_predicate %189, %202 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %209 -> %21 : !neura.data<i64, i1> !neura.data<i64, i1>
    %210 = neura.grant_predicate %196, %202 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %210 -> %19 : !neura.data<i64, i1> !neura.data<i64, i1>
    %211 = neura.grant_predicate %197, %202 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %211 -> %17 : !neura.data<i64, i1> !neura.data<i64, i1>
    %212 = neura.grant_predicate %198, %202 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %212 -> %15 : !neura.data<i64, i1> !neura.data<i64, i1>
    %213 = neura.grant_predicate %199, %202 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %213 -> %13 : !neura.data<i64, i1> !neura.data<i64, i1>
    %214 = neura.grant_predicate %190, %202 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %214 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    %215 = neura.grant_predicate %201, %201 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %215 : !neura.data<i1, i1>
    neura.yield
  }
}

