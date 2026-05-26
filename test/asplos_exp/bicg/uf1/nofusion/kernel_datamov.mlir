#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i16 = dense<16> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external local_unnamed_addr @A(dense<0> : tensor<256x256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x array<256 x i32>>
  llvm.mlir.global external local_unnamed_addr @r(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @p(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @s(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.mlir.global external local_unnamed_addr @q(dense<0> : tensor<256xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local} : !llvm.array<256 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.addressof @r : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.mlir.constant(255 : i32) : i32
    %4 = llvm.mlir.addressof @A : !llvm.ptr
    %5 = llvm.mlir.constant(256 : i64) : i64
    %6 = llvm.mlir.addressof @p : !llvm.ptr
    %7 = llvm.mlir.addressof @s : !llvm.ptr
    %8 = llvm.mlir.constant(0 : i8) : i8
    %9 = llvm.mlir.constant(1024 : i64) : i64
    %10 = llvm.mlir.addressof @q : !llvm.ptr
    %11 = llvm.mlir.constant(0 : i32) : i32
    llvm.br ^bb1(%0 : i64)
  ^bb1(%12: i64):  // 2 preds: ^bb0, ^bb3
    %13 = llvm.getelementptr inbounds %1[0, %12] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %14 = llvm.trunc %12 : i64 to i32
    llvm.store %14, %13 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb2(%0 : i64)
  ^bb2(%15: i64):  // 2 preds: ^bb1, ^bb2
    %16 = llvm.add %15, %2 overflow<nsw, nuw> : i64
    %17 = llvm.mul %16, %12 overflow<nsw, nuw> : i64
    %18 = llvm.trunc %17 : i64 to i32
    %19 = llvm.and %18, %3 : i32
    %20 = llvm.getelementptr inbounds %4[0, %12, %15] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    llvm.store %19, %20 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.icmp "eq" %16, %5 : i64
    llvm.cond_br %21, ^bb3, ^bb2(%16 : i64) {loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    %22 = llvm.add %12, %2 overflow<nsw, nuw> : i64
    %23 = llvm.icmp "eq" %22, %5 : i64
    llvm.cond_br %23, ^bb4(%0 : i64), ^bb1(%22 : i64) {loop_annotation = #loop_annotation}
  ^bb4(%24: i64):  // 2 preds: ^bb3, ^bb4
    %25 = llvm.getelementptr inbounds %6[0, %24] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %26 = llvm.trunc %24 : i64 to i32
    llvm.store %26, %25 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %27 = llvm.add %24, %2 overflow<nsw, nuw> : i64
    %28 = llvm.icmp "eq" %27, %5 : i64
    llvm.cond_br %28, ^bb5, ^bb4(%27 : i64) {loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    "llvm.intr.memset"(%7, %8, %9) <{isVolatile = false, tbaa = [#tbaa_tag]}> : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb6(%0 : i64)
  ^bb6(%29: i64):  // 2 preds: ^bb5, ^bb8
    %30 = llvm.getelementptr inbounds %10[0, %29] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %31 = llvm.getelementptr inbounds %1[0, %29] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %32 = llvm.load %31 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb7(%11, %0 : i32, i64)
  ^bb7(%33: i32, %34: i64):  // 2 preds: ^bb6, ^bb7
    %35 = llvm.getelementptr inbounds %7[0, %34] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %36 = llvm.load %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.getelementptr inbounds %4[0, %29, %34] : (!llvm.ptr, i64, i64) -> !llvm.ptr, !llvm.array<256 x array<256 x i32>>
    %38 = llvm.load %37 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.mul %38, %32 overflow<nsw> : i32
    %40 = llvm.add %39, %36 overflow<nsw> : i32
    llvm.store %40, %35 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %41 = llvm.getelementptr inbounds %6[0, %34] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x i32>
    %42 = llvm.load %41 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.mul %42, %38 overflow<nsw> : i32
    %44 = llvm.add %43, %33 overflow<nsw> : i32
    %45 = llvm.add %34, %2 overflow<nsw, nuw> : i64
    %46 = llvm.icmp "eq" %45, %5 : i64
    llvm.cond_br %46, ^bb8, ^bb7(%44, %45 : i32, i64) {loop_annotation = #loop_annotation}
  ^bb8:  // pred: ^bb7
    llvm.store %44, %30 {alignment = 4 : i64, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %47 = llvm.add %29, %2 overflow<nsw, nuw> : i64
    %48 = llvm.icmp "eq" %47, %5 : i64
    llvm.cond_br %48, ^bb9, ^bb6(%47 : i64) {loop_annotation = #loop_annotation}
  ^bb9:  // pred: ^bb8
    llvm.return %11 : i32
  }
  func.func @_Z6kernelPA256_iPiS1_S1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
    %5 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
    %6 = "neura.constant"() <{value = 0 : i8}> : () -> !neura.data<i8, i1>
    %7 = "neura.constant"() <{value = 1024 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
    %10 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %11 = "neura.grant_once"() <{constant_value = 256 : i64}> : () -> !neura.data<i64, i1>
    %12 = "neura.data_mov"(%2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %13 = "neura.data_mov"(%6) : (!neura.data<i8, i1>) -> !neura.data<i8, i1>
    %14 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    "neura.memset"(%12, %13, %14) <{is_volatile = false}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i8, i1>, !neura.data<i64, i1>) -> ()
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = "neura.data_mov"(%11) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = neura.phi_start %16, %15 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = "neura.data_mov"(%10) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %20 = neura.phi_start %19, %18 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %22 = "neura.data_mov"(%4) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = neura.phi_start %22, %21 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %24 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %25 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %26 = neura.phi_start %25, %24 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %27 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %28 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %29 = neura.phi_start %28, %27 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = neura.phi_start %31, %30 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %34 = "neura.data_mov"(%5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = neura.phi_start %34, %33 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %36 = neura.reserve : !neura.data<i32, i1>
    %37 = "neura.data_mov"(%9) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %38 = neura.phi_start %37, %36 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %39 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %40 = "neura.data_mov"(%3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %41 = neura.phi_start %40, %39 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %42 = neura.reserve : !neura.data<i64, i1>
    %43 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %44 = neura.phi_start %43, %42 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %45 = "neura.data_mov"(%41) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.data_mov"(%44) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %47 = "neura.gep"(%45, %46) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %48 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %49 = "neura.data_mov"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%48, %49) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %50 = "neura.data_mov"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %51 = "neura.data_mov"(%44) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = "neura.gep"(%50, %51) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %53 = neura.reserve : !neura.data<i64, i1>
    %54 = "neura.data_mov"(%32) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55 = neura.phi_start %54, %53 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %56 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %57 = "neura.data_mov"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %58 = neura.phi_start %57, %56 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %59 = neura.reserve : !neura.data<i32, i1>
    %60 = "neura.data_mov"(%38) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %61 = neura.phi_start %60, %59 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %62 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %63 = "neura.data_mov"(%41) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %64 = neura.phi_start %63, %62 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %65 = neura.reserve : !neura.data<i64, i1>
    %66 = "neura.data_mov"(%17) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67 = neura.phi_start %66, %65 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %68 = neura.reserve : !neura.data<i64, i1>
    %69 = "neura.data_mov"(%20) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70 = neura.phi_start %69, %68 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %71 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %72 = "neura.data_mov"(%23) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %73 = neura.phi_start %72, %71 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %74 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %75 = "neura.data_mov"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %76 = neura.phi_start %75, %74 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %77 = neura.reserve : !neura.data<i64, i1>
    %78 = "neura.data_mov"(%44) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %79 = neura.phi_start %78, %77 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %80 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %81 = "neura.data_mov"(%26) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %82 = neura.phi_start %81, %80 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %83 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %84 = "neura.data_mov"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %85 = neura.phi_start %84, %83 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %86 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %87 = "neura.data_mov"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %88 = neura.phi_start %87, %86 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %89 = neura.reserve : !neura.data<i64, i1>
    %90 = "neura.data_mov"(%32) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %91 = neura.phi_start %90, %89 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %92 = "neura.data_mov"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %93 = "neura.data_mov"(%91) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %94 = "neura.gep"(%92, %93) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %95 = "neura.data_mov"(%94) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %96 = "neura.load"(%95) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %97 = "neura.data_mov"(%85) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %98 = "neura.load"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %99 = "neura.data_mov"(%82) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %100 = "neura.data_mov"(%79) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %101 = "neura.data_mov"(%91) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %102 = "neura.gep"(%99, %100, %101) <{operandSegmentSizes = array<i32: 1, 2>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = "neura.data_mov"(%102) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %104 = "neura.load"(%103) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %105 = "neura.data_mov"(%104) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %106 = "neura.data_mov"(%98) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %107 = "neura.mul"(%105, %106) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %108 = "neura.data_mov"(%107) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %109 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %110 = "neura.add"(%108, %109) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %111 = "neura.data_mov"(%110) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %112 = "neura.data_mov"(%94) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%111, %112) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %113 = "neura.data_mov"(%76) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %114 = "neura.load"(%113) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %115 = "neura.data_mov"(%102) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %116 = "neura.load"(%115) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %117 = "neura.data_mov"(%73) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %118 = "neura.data_mov"(%91) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %119 = "neura.gep"(%117, %118) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %120 = "neura.data_mov"(%119) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %121 = "neura.load"(%120) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %122 = "neura.data_mov"(%121) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %123 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %124 = "neura.mul"(%122, %123) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %125 = "neura.data_mov"(%124) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %126 = "neura.data_mov"(%114) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %127 = "neura.add"(%125, %126) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %128 = "neura.data_mov"(%127) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %129 = "neura.data_mov"(%76) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%128, %129) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %130 = "neura.data_mov"(%91) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %131 = "neura.data_mov"(%70) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %132 = "neura.add"(%130, %131) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %133 = "neura.data_mov"(%132) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %134 = "neura.data_mov"(%67) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %135 = "neura.icmp"(%133, %134) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %136 = "neura.data_mov"(%135) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %137 = "neura.not"(%136) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %138 = "neura.data_mov"(%132) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %139 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %140 = neura.grant_predicate %138, %139 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %140 -> %89 : !neura.data<i64, i1> !neura.data<i64, i1>
    %141 = "neura.data_mov"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %142 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %143 = neura.grant_predicate %141, %142 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %143 -> %86 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %144 = "neura.data_mov"(%85) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %145 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %146 = neura.grant_predicate %144, %145 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %146 -> %83 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %147 = "neura.data_mov"(%82) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %148 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %149 = neura.grant_predicate %147, %148 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %149 -> %80 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %150 = "neura.data_mov"(%79) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %151 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %152 = neura.grant_predicate %150, %151 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %152 -> %77 : !neura.data<i64, i1> !neura.data<i64, i1>
    %153 = "neura.data_mov"(%76) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %154 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %155 = neura.grant_predicate %153, %154 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %155 -> %74 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %156 = "neura.data_mov"(%73) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %157 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %158 = neura.grant_predicate %156, %157 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %158 -> %71 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %159 = "neura.data_mov"(%70) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %160 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %161 = neura.grant_predicate %159, %160 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %161 -> %68 : !neura.data<i64, i1> !neura.data<i64, i1>
    %162 = "neura.data_mov"(%67) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %163 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %164 = neura.grant_predicate %162, %163 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %164 -> %65 : !neura.data<i64, i1> !neura.data<i64, i1>
    %165 = "neura.data_mov"(%64) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %166 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %167 = neura.grant_predicate %165, %166 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %167 -> %62 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %168 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %169 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %170 = neura.grant_predicate %168, %169 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %170 -> %59 : !neura.data<i32, i1> !neura.data<i32, i1>
    %171 = "neura.data_mov"(%58) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %172 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %173 = neura.grant_predicate %171, %172 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %173 -> %56 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %174 = "neura.data_mov"(%55) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %175 = "neura.data_mov"(%137) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %176 = neura.grant_predicate %174, %175 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %176 -> %53 : !neura.data<i64, i1> !neura.data<i64, i1>
    %177 = "neura.data_mov"(%79) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %178 = "neura.data_mov"(%135) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %179 = neura.grant_predicate %177, %178 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %180 = "neura.data_mov"(%70) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %181 = "neura.data_mov"(%135) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %182 = neura.grant_predicate %180, %181 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %183 = "neura.data_mov"(%67) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %184 = "neura.data_mov"(%135) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %185 = neura.grant_predicate %183, %184 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %186 = "neura.data_mov"(%64) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %187 = "neura.data_mov"(%135) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %188 = neura.grant_predicate %186, %187 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %189 = "neura.data_mov"(%61) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %190 = "neura.data_mov"(%135) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %191 = neura.grant_predicate %189, %190 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    %192 = "neura.data_mov"(%58) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %193 = "neura.data_mov"(%135) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %194 = neura.grant_predicate %192, %193 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %195 = "neura.data_mov"(%55) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %196 = "neura.data_mov"(%135) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %197 = neura.grant_predicate %195, %196 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %198 = "neura.data_mov"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %199 = "neura.data_mov"(%135) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %200 = neura.grant_predicate %198, %199 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %201 = "neura.data_mov"(%82) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %202 = "neura.data_mov"(%135) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %203 = neura.grant_predicate %201, %202 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %204 = "neura.data_mov"(%73) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %205 = "neura.data_mov"(%135) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %206 = neura.grant_predicate %204, %205 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %207 = "neura.data_mov"(%179) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %208 = "neura.data_mov"(%182) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %209 = "neura.add"(%207, %208) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %210 = "neura.data_mov"(%209) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %211 = "neura.data_mov"(%185) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %212 = "neura.icmp"(%210, %211) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %213 = "neura.data_mov"(%212) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %214 = "neura.not"(%213) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %215 = "neura.data_mov"(%209) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %216 = "neura.data_mov"(%214) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %217 = neura.grant_predicate %215, %216 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %217 -> %42 : !neura.data<i64, i1> !neura.data<i64, i1>
    %218 = "neura.data_mov"(%188) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %219 = "neura.data_mov"(%214) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %220 = neura.grant_predicate %218, %219 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %220 -> %39 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %221 = "neura.data_mov"(%191) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %222 = "neura.data_mov"(%214) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %223 = neura.grant_predicate %221, %222 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %223 -> %36 : !neura.data<i32, i1> !neura.data<i32, i1>
    %224 = "neura.data_mov"(%194) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %225 = "neura.data_mov"(%214) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %226 = neura.grant_predicate %224, %225 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %226 -> %33 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %227 = "neura.data_mov"(%197) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %228 = "neura.data_mov"(%214) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %229 = neura.grant_predicate %227, %228 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %229 -> %30 : !neura.data<i64, i1> !neura.data<i64, i1>
    %230 = "neura.data_mov"(%200) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %231 = "neura.data_mov"(%214) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %232 = neura.grant_predicate %230, %231 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %232 -> %27 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %233 = "neura.data_mov"(%203) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %234 = "neura.data_mov"(%214) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %235 = neura.grant_predicate %233, %234 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %235 -> %24 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %236 = "neura.data_mov"(%206) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %237 = "neura.data_mov"(%214) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %238 = neura.grant_predicate %236, %237 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %238 -> %21 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %239 = "neura.data_mov"(%182) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %240 = "neura.data_mov"(%214) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %241 = neura.grant_predicate %239, %240 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %241 -> %18 : !neura.data<i64, i1> !neura.data<i64, i1>
    %242 = "neura.data_mov"(%185) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %243 = "neura.data_mov"(%214) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %244 = neura.grant_predicate %242, %243 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %244 -> %15 : !neura.data<i64, i1> !neura.data<i64, i1>
    %245 = "neura.data_mov"(%212) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %246 = "neura.data_mov"(%212) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %247 = neura.grant_predicate %245, %246 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %248 = "neura.data_mov"(%247) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %248 : !neura.data<i1, i1>
    neura.yield
  }
}

