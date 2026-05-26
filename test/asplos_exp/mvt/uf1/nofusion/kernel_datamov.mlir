#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %16 = llvm.mlir.constant(0 : i32) : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    "llvm.intr.memset"(%3, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%4 : i64)
  ^bb1(%17: i64):  // 2 preds: ^bb0, ^bb1
    %18 = llvm.getelementptr inbounds %5[0, %17] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %19 = llvm.trunc %17 : i64 to i32
    %20 = llvm.add %19, %6 : i32
    llvm.store %20, %18 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.getelementptr inbounds %7[0, %17] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %22 = llvm.trunc %17 : i64 to i32
    %23 = llvm.add %22, %8 : i32
    llvm.store %23, %21 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %24 = llvm.add %17, %9 overflow<nsw, nuw> : i64
    %25 = llvm.icmp "eq" %24, %10 : i64
    llvm.cond_br %25, ^bb2(%4 : i64), ^bb1(%24 : i64) {loop_annotation = #loop_annotation}
  ^bb2(%26: i64):  // 2 preds: ^bb1, ^bb2
    %27 = llvm.trunc %26 : i64 to i32
    %28 = llvm.lshr %27, %11 : i32
    %29 = llvm.and %27, %12 : i32
    %30 = llvm.mul %28, %29 overflow<nsw, nuw> : i32
    %31 = llvm.and %30, %12 : i32
    %32 = llvm.getelementptr inbounds %13[0, %26] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    llvm.store %31, %32 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %33 = llvm.add %26, %9 overflow<nsw, nuw> : i64
    %34 = llvm.icmp "eq" %33, %14 : i64
    llvm.cond_br %34, ^bb3(%4 : i64), ^bb2(%33 : i64) {loop_annotation = #loop_annotation}
  ^bb3(%35: i64):  // 2 preds: ^bb2, ^bb5
    %36 = llvm.getelementptr inbounds %5[0, %35] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %37 = llvm.shl %35, %15 overflow<nsw> : i64
    %38 = llvm.getelementptr inbounds %7[0, %35] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %39 = llvm.load %36 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %40 = llvm.load %38 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb4(%4 : i64)
  ^bb4(%41: i64):  // 2 preds: ^bb3, ^bb4
    %42 = llvm.getelementptr inbounds %0[0, %41] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %43 = llvm.load %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %44 = llvm.shl %41, %15 overflow<nsw, nuw> : i64
    %45 = llvm.add %44, %35 overflow<nsw, nuw> : i64
    %46 = llvm.getelementptr inbounds %13[0, %45] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %47 = llvm.load %46 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.mul %39, %47 overflow<nsw> : i32
    %49 = llvm.add %48, %43 overflow<nsw> : i32
    llvm.store %49, %42 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.getelementptr inbounds %3[0, %41] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %51 = llvm.load %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.add %41, %37 overflow<nsw, nuw> : i64
    %53 = llvm.getelementptr inbounds %13[0, %52] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %54 = llvm.load %53 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %55 = llvm.mul %40, %54 overflow<nsw> : i32
    %56 = llvm.add %55, %51 overflow<nsw> : i32
    llvm.store %56, %50 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %57 = llvm.add %41, %9 overflow<nsw, nuw> : i64
    %58 = llvm.icmp "eq" %57, %10 : i64
    llvm.cond_br %58, ^bb5, ^bb4(%57 : i64) {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %59 = llvm.add %35, %9 overflow<nsw, nuw> : i64
    %60 = llvm.icmp "eq" %59, %10 : i64
    llvm.cond_br %60, ^bb6, ^bb3(%59 : i64) {loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    llvm.return %16 : i32
  }
  func.func @_Z6kernelPiS_PKiS1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
    %5 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %11 = neura.phi_start %10, %9 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = neura.phi_start %13, %12 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %17 = neura.phi_start %16, %15 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %18 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %19 = "neura.data_mov"(%2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %20 = neura.phi_start %19, %18 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %21 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %22 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = neura.phi_start %22, %21 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = neura.phi_start %25, %24 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %27 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %28 = "neura.data_mov"(%4) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %29 = neura.phi_start %28, %27 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = "neura.data_mov"(%6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = neura.phi_start %31, %30 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %34 = "neura.data_mov"(%3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = neura.phi_start %34, %33 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %38 = neura.phi_start %37, %36 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %39 = "neura.data_mov"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %41 = "neura.gep"(%39, %40) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %42 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %43 = "neura.data_mov"(%32) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %44 = "neura.shl"(%42, %43) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.data_mov"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %47 = "neura.gep"(%45, %46) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %48 = neura.reserve : !neura.data<i64, i1>
    %49 = "neura.data_mov"(%26) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50 = neura.phi_start %49, %48 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %51 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %52 = "neura.data_mov"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %53 = neura.phi_start %52, %51 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %54 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %55 = "neura.data_mov"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = neura.phi_start %55, %54 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %57 = neura.reserve : !neura.data<i64, i1>
    %58 = "neura.data_mov"(%11) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = neura.phi_start %58, %57 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %60 = neura.reserve : !neura.data<i64, i1>
    %61 = "neura.data_mov"(%14) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62 = neura.phi_start %61, %60 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %63 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %64 = "neura.data_mov"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %65 = neura.phi_start %64, %63 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %66 = neura.reserve : !neura.data<i64, i1>
    %67 = "neura.data_mov"(%44) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = neura.phi_start %67, %66 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %69 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %70 = "neura.data_mov"(%17) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = neura.phi_start %70, %69 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %72 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %73 = "neura.data_mov"(%41) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %74 = neura.phi_start %73, %72 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %75 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %76 = "neura.data_mov"(%20) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %77 = neura.phi_start %76, %75 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %78 = neura.reserve : !neura.data<i64, i1>
    %79 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %80 = neura.phi_start %79, %78 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %81 = neura.reserve : !neura.data<i64, i1>
    %82 = "neura.data_mov"(%32) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83 = neura.phi_start %82, %81 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %84 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %85 = "neura.data_mov"(%23) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %86 = neura.phi_start %85, %84 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %87 = neura.reserve : !neura.data<i64, i1>
    %88 = "neura.data_mov"(%26) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %89 = neura.phi_start %88, %87 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %90 = "neura.data_mov"(%86) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %91 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %92 = "neura.gep"(%90, %91) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %93 = "neura.data_mov"(%92) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %94 = "neura.load"(%93) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %95 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %96 = "neura.data_mov"(%83) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %97 = "neura.shl"(%95, %96) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98 = "neura.data_mov"(%97) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %99 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %100 = "neura.add"(%98, %99) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %101 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %102 = "neura.data_mov"(%100) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %103 = "neura.gep"(%101, %102) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %104 = "neura.data_mov"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %105 = "neura.load"(%104) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %106 = "neura.data_mov"(%74) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %107 = "neura.load"(%106) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %108 = "neura.data_mov"(%107) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %109 = "neura.data_mov"(%105) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %110 = "neura.mul"(%108, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %111 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %112 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %113 = "neura.add"(%111, %112) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %114 = "neura.data_mov"(%113) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %115 = "neura.data_mov"(%92) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%114, %115) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %116 = "neura.data_mov"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %117 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %118 = "neura.gep"(%116, %117) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %119 = "neura.data_mov"(%118) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %120 = "neura.load"(%119) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %121 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %122 = "neura.data_mov"(%68) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %123 = "neura.add"(%121, %122) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %124 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %125 = "neura.data_mov"(%123) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %126 = "neura.gep"(%124, %125) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %127 = "neura.data_mov"(%126) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %128 = "neura.load"(%127) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %129 = "neura.data_mov"(%65) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %130 = "neura.load"(%129) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %131 = "neura.data_mov"(%130) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %132 = "neura.data_mov"(%128) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %133 = "neura.mul"(%131, %132) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %134 = "neura.data_mov"(%133) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %135 = "neura.data_mov"(%120) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %136 = "neura.add"(%134, %135) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %137 = "neura.data_mov"(%136) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %138 = "neura.data_mov"(%118) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%137, %138) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %139 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %140 = "neura.data_mov"(%62) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %141 = "neura.add"(%139, %140) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %142 = "neura.data_mov"(%141) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %143 = "neura.data_mov"(%59) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %144 = "neura.icmp"(%142, %143) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %145 = "neura.data_mov"(%144) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %146 = "neura.not"(%145) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %147 = "neura.data_mov"(%141) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %148 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %149 = neura.grant_predicate %147, %148 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %149 -> %87 : !neura.data<i64, i1> !neura.data<i64, i1>
    %150 = "neura.data_mov"(%86) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %151 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %152 = neura.grant_predicate %150, %151 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %152 -> %84 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %153 = "neura.data_mov"(%83) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %154 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %155 = neura.grant_predicate %153, %154 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %155 -> %81 : !neura.data<i64, i1> !neura.data<i64, i1>
    %156 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %157 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %158 = neura.grant_predicate %156, %157 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %158 -> %78 : !neura.data<i64, i1> !neura.data<i64, i1>
    %159 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %160 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %161 = neura.grant_predicate %159, %160 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %161 -> %75 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %162 = "neura.data_mov"(%74) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %163 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %164 = neura.grant_predicate %162, %163 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %164 -> %72 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %165 = "neura.data_mov"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %166 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %167 = neura.grant_predicate %165, %166 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %167 -> %69 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %168 = "neura.data_mov"(%68) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %169 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %170 = neura.grant_predicate %168, %169 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %170 -> %66 : !neura.data<i64, i1> !neura.data<i64, i1>
    %171 = "neura.data_mov"(%65) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %172 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %173 = neura.grant_predicate %171, %172 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %173 -> %63 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %174 = "neura.data_mov"(%62) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %175 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %176 = neura.grant_predicate %174, %175 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %176 -> %60 : !neura.data<i64, i1> !neura.data<i64, i1>
    %177 = "neura.data_mov"(%59) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %178 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %179 = neura.grant_predicate %177, %178 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %179 -> %57 : !neura.data<i64, i1> !neura.data<i64, i1>
    %180 = "neura.data_mov"(%56) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %181 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %182 = neura.grant_predicate %180, %181 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %182 -> %54 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %183 = "neura.data_mov"(%53) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %184 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %185 = neura.grant_predicate %183, %184 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %185 -> %51 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %186 = "neura.data_mov"(%50) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %187 = "neura.data_mov"(%146) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %188 = neura.grant_predicate %186, %187 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %188 -> %48 : !neura.data<i64, i1> !neura.data<i64, i1>
    %189 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %190 = "neura.data_mov"(%144) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %191 = neura.grant_predicate %189, %190 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %192 = "neura.data_mov"(%62) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %193 = "neura.data_mov"(%144) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %194 = neura.grant_predicate %192, %193 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %195 = "neura.data_mov"(%59) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %196 = "neura.data_mov"(%144) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %197 = neura.grant_predicate %195, %196 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %198 = "neura.data_mov"(%56) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %199 = "neura.data_mov"(%144) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %200 = neura.grant_predicate %198, %199 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %201 = "neura.data_mov"(%83) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %202 = "neura.data_mov"(%144) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %203 = neura.grant_predicate %201, %202 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %204 = "neura.data_mov"(%53) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %205 = "neura.data_mov"(%144) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %206 = neura.grant_predicate %204, %205 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %207 = "neura.data_mov"(%50) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %208 = "neura.data_mov"(%144) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %209 = neura.grant_predicate %207, %208 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %210 = "neura.data_mov"(%86) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %211 = "neura.data_mov"(%144) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %212 = neura.grant_predicate %210, %211 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %213 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %214 = "neura.data_mov"(%144) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %215 = neura.grant_predicate %213, %214 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %216 = "neura.data_mov"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %217 = "neura.data_mov"(%144) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %218 = neura.grant_predicate %216, %217 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %219 = "neura.data_mov"(%191) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %220 = "neura.data_mov"(%194) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %221 = "neura.add"(%219, %220) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %222 = "neura.data_mov"(%221) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %223 = "neura.data_mov"(%197) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %224 = "neura.icmp"(%222, %223) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %225 = "neura.data_mov"(%224) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %226 = "neura.not"(%225) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %227 = "neura.data_mov"(%221) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %228 = "neura.data_mov"(%226) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %229 = neura.grant_predicate %227, %228 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %229 -> %36 : !neura.data<i64, i1> !neura.data<i64, i1>
    %230 = "neura.data_mov"(%200) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %231 = "neura.data_mov"(%226) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %232 = neura.grant_predicate %230, %231 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %232 -> %33 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %233 = "neura.data_mov"(%203) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %234 = "neura.data_mov"(%226) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %235 = neura.grant_predicate %233, %234 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %235 -> %30 : !neura.data<i64, i1> !neura.data<i64, i1>
    %236 = "neura.data_mov"(%206) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %237 = "neura.data_mov"(%226) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %238 = neura.grant_predicate %236, %237 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %238 -> %27 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %239 = "neura.data_mov"(%209) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %240 = "neura.data_mov"(%226) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %241 = neura.grant_predicate %239, %240 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %241 -> %24 : !neura.data<i64, i1> !neura.data<i64, i1>
    %242 = "neura.data_mov"(%212) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %243 = "neura.data_mov"(%226) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %244 = neura.grant_predicate %242, %243 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %244 -> %21 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %245 = "neura.data_mov"(%215) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %246 = "neura.data_mov"(%226) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %247 = neura.grant_predicate %245, %246 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %247 -> %18 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %248 = "neura.data_mov"(%218) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %249 = "neura.data_mov"(%226) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %250 = neura.grant_predicate %248, %249 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %250 -> %15 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %251 = "neura.data_mov"(%194) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %252 = "neura.data_mov"(%226) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %253 = neura.grant_predicate %251, %252 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %253 -> %12 : !neura.data<i64, i1> !neura.data<i64, i1>
    %254 = "neura.data_mov"(%197) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %255 = "neura.data_mov"(%226) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %256 = neura.grant_predicate %254, %255 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %256 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    %257 = "neura.data_mov"(%224) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %258 = "neura.data_mov"(%224) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %259 = neura.grant_predicate %257, %258 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %260 = "neura.data_mov"(%259) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %260 : !neura.data<i1, i1>
    neura.yield
  }
}

