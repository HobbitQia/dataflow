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
  func.func @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 62 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.phi_start %8, %9 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.phi_start %7, %11 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.phi_start %6, %13 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.phi_start %5, %15 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %18 = neura.phi_start %0, %17 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %19 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %20 = neura.phi_start %2, %19 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %21 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %22 = neura.phi_start %1, %21 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24 = neura.phi_start %3, %23 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = neura.phi_start %4, %25 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %27 = neura.reserve : !neura.data<i64, i1>
    %28 = neura.phi_start %3, %27 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %29 = "neura.shl"(%28, %26) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = neura.phi_start %28, %30 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %32 = neura.reserve : !neura.data<i64, i1>
    %33 = neura.phi_start %10, %32 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = neura.phi_start %12, %34 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = neura.phi_start %14, %36 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39 = neura.phi_start %16, %38 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %41 = neura.phi_start %18, %40 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %42 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %43 = neura.phi_start %20, %42 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %44 = neura.reserve : !neura.data<i64, i1>
    %45 = neura.phi_start %24, %44 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %46 = neura.reserve : !neura.data<i64, i1>
    %47 = neura.phi_start %26, %46 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %49 = neura.phi_start %22, %48 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51 = neura.phi_start %29, %50 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %52 = neura.reserve : !neura.data<i64, i1>
    %53 = neura.phi_start %24, %52 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %54 = "neura.add"(%53, %51) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55 = "neura.gep"(%49, %54) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = "neura.shl"(%53, %47) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = neura.reserve : !neura.data<i64, i1>
    %58 = neura.phi_start %45, %57 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %59 = neura.reserve : !neura.data<i64, i1>
    %60 = neura.phi_start %47, %59 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %61 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %62 = neura.phi_start %49, %61 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %63 = neura.reserve : !neura.data<i64, i1>
    %64 = neura.phi_start %31, %63 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %65 = neura.reserve : !neura.data<i64, i1>
    %66 = neura.phi_start %33, %65 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %67 = neura.reserve : !neura.data<i64, i1>
    %68 = neura.phi_start %53, %67 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %69 = neura.reserve : !neura.data<i64, i1>
    %70 = neura.phi_start %35, %69 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %71 = neura.reserve : !neura.data<i64, i1>
    %72 = neura.phi_start %37, %71 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %73 = neura.reserve : !neura.data<i64, i1>
    %74 = neura.phi_start %39, %73 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %75 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %76 = neura.phi_start %41, %75 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %77 = neura.reserve : !neura.data<i64, i1>
    %78 = neura.phi_start %51, %77 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %79 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %80 = neura.phi_start %43, %79 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %81 = neura.reserve : !neura.data<i64, i1>
    %82 = neura.phi_start %56, %81 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %83 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %84 = neura.phi_start %55, %83 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %85 = neura.reserve : !neura.data<i64, i1>
    %86 = neura.phi_start %45, %85 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %87 = "neura.load"(%84) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %88 = "neura.add"(%86, %82) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %89 = "neura.gep"(%80, %88) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %90 = "neura.load"(%89) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %91 = "neura.mul"(%90, %87) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %92 = "neura.add"(%86, %78) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %93 = "neura.gep"(%76, %92) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %94 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %95 = "neura.add"(%94, %91) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%95, %93) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %96 = "neura.load"(%84) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %97 = "neura.or"(%88, %74) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98 = "neura.gep"(%80, %97) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %99 = "neura.load"(%98) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %100 = "neura.mul"(%99, %96) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %101 = "neura.or"(%92, %74) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %102 = "neura.gep"(%76, %101) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = "neura.load"(%102) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %104 = "neura.add"(%103, %100) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%104, %102) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %105 = "neura.add"(%86, %72) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %106 = "neura.icmp"(%86, %70) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %107 = neura.grant_predicate %105, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %107 -> %85 : !neura.data<i64, i1> !neura.data<i64, i1>
    %108 = neura.grant_predicate %84, %106 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %108 -> %83 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %109 = neura.grant_predicate %82, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %109 -> %81 : !neura.data<i64, i1> !neura.data<i64, i1>
    %110 = neura.grant_predicate %80, %106 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %110 -> %79 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %111 = neura.grant_predicate %78, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %111 -> %77 : !neura.data<i64, i1> !neura.data<i64, i1>
    %112 = neura.grant_predicate %76, %106 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %112 -> %75 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %113 = neura.grant_predicate %74, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %113 -> %73 : !neura.data<i64, i1> !neura.data<i64, i1>
    %114 = neura.grant_predicate %72, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %114 -> %71 : !neura.data<i64, i1> !neura.data<i64, i1>
    %115 = neura.grant_predicate %70, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %115 -> %69 : !neura.data<i64, i1> !neura.data<i64, i1>
    %116 = neura.grant_predicate %68, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %116 -> %67 : !neura.data<i64, i1> !neura.data<i64, i1>
    %117 = neura.grant_predicate %66, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %117 -> %65 : !neura.data<i64, i1> !neura.data<i64, i1>
    %118 = neura.grant_predicate %64, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %118 -> %63 : !neura.data<i64, i1> !neura.data<i64, i1>
    %119 = neura.grant_predicate %62, %106 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %119 -> %61 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %120 = neura.grant_predicate %60, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %120 -> %59 : !neura.data<i64, i1> !neura.data<i64, i1>
    %121 = neura.grant_predicate %58, %106 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %121 -> %57 : !neura.data<i64, i1> !neura.data<i64, i1>
    %122 = "neura.not"(%106) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %123 = neura.grant_predicate %68, %122 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %124 = neura.grant_predicate %74, %122 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %125 = neura.grant_predicate %66, %122 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %126 = neura.grant_predicate %64, %122 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %127 = neura.grant_predicate %78, %122 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %128 = neura.grant_predicate %62, %122 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %129 = neura.grant_predicate %60, %122 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %130 = neura.grant_predicate %58, %122 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %131 = neura.grant_predicate %80, %122 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %132 = neura.grant_predicate %76, %122 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %133 = neura.grant_predicate %72, %122 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %134 = neura.grant_predicate %70, %122 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %135 = "neura.add"(%123, %124) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %136 = "neura.icmp"(%135, %125) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %137 = "neura.not"(%136) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %138 = neura.grant_predicate %135, %137 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %138 -> %52 : !neura.data<i64, i1> !neura.data<i64, i1>
    %139 = neura.grant_predicate %127, %137 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %139 -> %50 : !neura.data<i64, i1> !neura.data<i64, i1>
    %140 = neura.grant_predicate %128, %137 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %140 -> %48 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %141 = neura.grant_predicate %129, %137 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %141 -> %46 : !neura.data<i64, i1> !neura.data<i64, i1>
    %142 = neura.grant_predicate %130, %137 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %142 -> %44 : !neura.data<i64, i1> !neura.data<i64, i1>
    %143 = neura.grant_predicate %131, %137 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %143 -> %42 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %144 = neura.grant_predicate %132, %137 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %144 -> %40 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %145 = neura.grant_predicate %124, %137 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %145 -> %38 : !neura.data<i64, i1> !neura.data<i64, i1>
    %146 = neura.grant_predicate %133, %137 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %146 -> %36 : !neura.data<i64, i1> !neura.data<i64, i1>
    %147 = neura.grant_predicate %134, %137 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %147 -> %34 : !neura.data<i64, i1> !neura.data<i64, i1>
    %148 = neura.grant_predicate %125, %137 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %148 -> %32 : !neura.data<i64, i1> !neura.data<i64, i1>
    %149 = neura.grant_predicate %126, %137 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %149 -> %30 : !neura.data<i64, i1> !neura.data<i64, i1>
    %150 = neura.grant_predicate %126, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %151 = neura.grant_predicate %124, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %152 = neura.grant_predicate %125, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %153 = neura.grant_predicate %129, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %154 = neura.grant_predicate %130, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %155 = neura.grant_predicate %128, %136 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %156 = neura.grant_predicate %131, %136 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %157 = neura.grant_predicate %132, %136 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %158 = neura.grant_predicate %133, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %159 = neura.grant_predicate %134, %136 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %160 = "neura.add"(%150, %151) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %161 = "neura.icmp"(%160, %152) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %162 = "neura.not"(%161) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %163 = neura.grant_predicate %160, %162 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %163 -> %27 : !neura.data<i64, i1> !neura.data<i64, i1>
    %164 = neura.grant_predicate %153, %162 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %164 -> %25 : !neura.data<i64, i1> !neura.data<i64, i1>
    %165 = neura.grant_predicate %154, %162 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %165 -> %23 : !neura.data<i64, i1> !neura.data<i64, i1>
    %166 = neura.grant_predicate %155, %162 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %166 -> %21 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %167 = neura.grant_predicate %156, %162 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %167 -> %19 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %168 = neura.grant_predicate %157, %162 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %168 -> %17 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %169 = neura.grant_predicate %151, %162 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %169 -> %15 : !neura.data<i64, i1> !neura.data<i64, i1>
    %170 = neura.grant_predicate %158, %162 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %170 -> %13 : !neura.data<i64, i1> !neura.data<i64, i1>
    %171 = neura.grant_predicate %159, %162 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %171 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    %172 = neura.grant_predicate %152, %162 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %172 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    %173 = neura.grant_predicate %161, %161 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %173 : !neura.data<i1, i1>
    neura.yield
  }
}

