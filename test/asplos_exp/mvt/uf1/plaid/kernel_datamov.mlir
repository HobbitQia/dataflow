#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1A(dense<0> : tensor<4096xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<4096 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2x1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2x2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2y1(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<64 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE2y2(dense<0> : tensor<64xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<64 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.addressof @_ZZ4mainE2x1 {latency = 1 : i32} : !llvm.ptr
    %1 = llvm.mlir.constant(0 : i8) {latency = 1 : i32} : i8
    %2 = llvm.mlir.constant(256 : i64) {latency = 1 : i32} : i64
    %3 = llvm.mlir.addressof @_ZZ4mainE2x2 {latency = 1 : i32} : !llvm.ptr
    %4 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %5 = llvm.mlir.addressof @_ZZ4mainE2y1 {latency = 1 : i32} : !llvm.ptr
    %6 = llvm.mlir.constant(3 : i32) {latency = 1 : i32} : i32
    %7 = llvm.mlir.addressof @_ZZ4mainE2y2 {latency = 1 : i32} : !llvm.ptr
    %8 = llvm.mlir.constant(4 : i32) {latency = 1 : i32} : i32
    %9 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %10 = llvm.mlir.constant(64 : i64) {latency = 1 : i32} : i64
    %11 = llvm.mlir.constant(6 : i32) {latency = 1 : i32} : i32
    %12 = llvm.mlir.constant(63 : i32) {latency = 1 : i32} : i32
    %13 = llvm.mlir.addressof @_ZZ4mainE1A {latency = 1 : i32} : !llvm.ptr
    %14 = llvm.mlir.constant(4096 : i64) {latency = 1 : i32} : i64
    %15 = llvm.mlir.constant(6 : i64) {latency = 1 : i32} : i64
    %16 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    "llvm.intr.memset"(%0, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> {latency = 1 : i32} : (!llvm.ptr, i8, i64) -> ()
    "llvm.intr.memset"(%3, %1, %2) <{isVolatile = false, tbaa = [#tbaa_tag]}> {latency = 1 : i32} : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb1(%4 : i64) {latency = 1 : i32}
  ^bb1(%17: i64):  // 2 preds: ^bb0, ^bb1
    %18 = llvm.getelementptr inbounds %5[0, %17] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %19 = llvm.trunc %17 {latency = 1 : i32} : i64 to i32
    %20 = llvm.add %19, %6 {latency = 1 : i32} : i32
    llvm.store %20, %18 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.getelementptr inbounds %7[0, %17] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %22 = llvm.trunc %17 {latency = 1 : i32} : i64 to i32
    %23 = llvm.add %22, %8 {latency = 1 : i32} : i32
    llvm.store %23, %21 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %24 = llvm.add %17, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %25 = llvm.icmp "eq" %24, %10 {latency = 1 : i32} : i64
    llvm.cond_br %25, ^bb2(%4 : i64), ^bb1(%24 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%26: i64):  // 2 preds: ^bb1, ^bb2
    %27 = llvm.trunc %26 {latency = 1 : i32} : i64 to i32
    %28 = llvm.lshr %27, %11 {latency = 1 : i32} : i32
    %29 = llvm.and %27, %12 {latency = 1 : i32} : i32
    %30 = llvm.mul %28, %29 overflow<nsw, nuw> {latency = 1 : i32} : i32
    %31 = llvm.and %30, %12 {latency = 1 : i32} : i32
    %32 = llvm.getelementptr inbounds %13[0, %26] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    llvm.store %31, %32 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %33 = llvm.add %26, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %34 = llvm.icmp "eq" %33, %14 {latency = 1 : i32} : i64
    llvm.cond_br %34, ^bb3(%4 : i64), ^bb2(%33 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3(%35: i64):  // 2 preds: ^bb2, ^bb5
    %36 = llvm.getelementptr inbounds %5[0, %35] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %37 = llvm.shl %35, %15 overflow<nsw> {latency = 1 : i32} : i64
    %38 = llvm.getelementptr inbounds %7[0, %35] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %39 = llvm.load %36 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %40 = llvm.load %38 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb4(%4 : i64) {latency = 1 : i32}
  ^bb4(%41: i64):  // 2 preds: ^bb3, ^bb4
    %42 = llvm.getelementptr inbounds %0[0, %41] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %43 = llvm.load %42 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %44 = llvm.shl %41, %15 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %45 = llvm.add %44, %35 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %46 = llvm.getelementptr inbounds %13[0, %45] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %47 = llvm.load %46 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.mul %39, %47 overflow<nsw> {latency = 1 : i32} : i32
    %49 = llvm.add %48, %43 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %49, %42 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %50 = llvm.getelementptr inbounds %3[0, %41] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<64 x i32>
    %51 = llvm.load %50 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.add %41, %37 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %53 = llvm.getelementptr inbounds %13[0, %52] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4096 x i32>
    %54 = llvm.load %53 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %55 = llvm.mul %40, %54 overflow<nsw> {latency = 1 : i32} : i32
    %56 = llvm.add %55, %51 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %56, %50 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %57 = llvm.add %41, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %58 = llvm.icmp "eq" %57, %10 {latency = 1 : i32} : i64
    llvm.cond_br %58, ^bb5, ^bb4(%57 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb5:  // pred: ^bb4
    %59 = llvm.add %35, %9 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %60 = llvm.icmp "eq" %59, %10 {latency = 1 : i32} : i64
    llvm.cond_br %60, ^bb6, ^bb3(%59 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    llvm.return {latency = 1 : i32} %16 : i32
  }
  func.func @_Z6kernelPiS_PKiS1_S1_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.grant_once"() <{constant_value = "%arg3"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.grant_once"() <{constant_value = "%arg4"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %5 = "neura.grant_once"() <{constant_value = 0 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 6 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 64 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %11 = neura.phi_start %10, %9 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = neura.phi_start %13, %12 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %17 = neura.phi_start %16, %15 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %18 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %19 = "neura.data_mov"(%2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %20 = neura.phi_start %19, %18 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %21 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %22 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = neura.phi_start %22, %21 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = neura.phi_start %25, %24 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %27 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %28 = "neura.data_mov"(%4) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %29 = neura.phi_start %28, %27 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = "neura.data_mov"(%6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = neura.phi_start %31, %30 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %34 = "neura.data_mov"(%3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = neura.phi_start %34, %33 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %38 = neura.phi_start %37, %36 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %39 = "neura.data_mov"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %41 = "neura.gep"(%39, %40) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %42 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %43 = "neura.data_mov"(%32) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %44 = "neura.shl"(%42, %43) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.data_mov"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %47 = "neura.gep"(%45, %46) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %48 = neura.reserve : !neura.data<i64, i1>
    %49 = "neura.data_mov"(%26) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50 = neura.phi_start %49, %48 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %51 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %52 = "neura.data_mov"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %53 = neura.phi_start %52, %51 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %54 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %55 = "neura.data_mov"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = neura.phi_start %55, %54 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %57 = neura.reserve : !neura.data<i64, i1>
    %58 = "neura.data_mov"(%11) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = neura.phi_start %58, %57 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %60 = neura.reserve : !neura.data<i64, i1>
    %61 = "neura.data_mov"(%14) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62 = neura.phi_start %61, %60 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %63 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %64 = "neura.data_mov"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %65 = neura.phi_start %64, %63 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %66 = neura.reserve : !neura.data<i64, i1>
    %67 = "neura.data_mov"(%44) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = neura.phi_start %67, %66 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %69 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %70 = "neura.data_mov"(%17) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = neura.phi_start %70, %69 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %72 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %73 = "neura.data_mov"(%41) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %74 = neura.phi_start %73, %72 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %75 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %76 = "neura.data_mov"(%20) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %77 = neura.phi_start %76, %75 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %78 = neura.reserve : !neura.data<i64, i1>
    %79 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %80 = neura.phi_start %79, %78 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %81 = neura.reserve : !neura.data<i64, i1>
    %82 = "neura.data_mov"(%32) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83 = neura.phi_start %82, %81 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %84 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %85 = "neura.data_mov"(%23) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %86 = neura.phi_start %85, %84 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %87 = neura.reserve : !neura.data<i64, i1>
    %88 = "neura.data_mov"(%26) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %89 = neura.phi_start %88, %87 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %90 = "neura.data_mov"(%86) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %91 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %92 = "neura.gep"(%90, %91) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %93 = "neura.data_mov"(%92) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %94 = "neura.load"(%93) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %95 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %96 = "neura.data_mov"(%83) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %97 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %99 = "neura.fused_op"(%95, %96, %97, %98) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.unicast:shl->add->gep"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>):
      %237 = "neura.shl"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %238 = "neura.add"(%237, %arg7) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %239 = "neura.gep"(%arg8, %238) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%239 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %100 = "neura.data_mov"(%99) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %101 = "neura.data_mov"(%74) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %102 = "neura.fused_op"(%100, %101) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.fan_in:load->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %237 = "neura.load"(%arg5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %238 = "neura.load"(%arg6) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %239 = "neura.mul"(%238, %237) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%239 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %103 = "neura.data_mov"(%102) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %104 = "neura.data_mov"(%94) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %105 = "neura.add"(%103, %104) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %106 = "neura.data_mov"(%105) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %107 = "neura.data_mov"(%92) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%106, %107) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %108 = "neura.data_mov"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %109 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %110 = "neura.gep"(%108, %109) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %111 = "neura.data_mov"(%110) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %112 = "neura.load"(%111) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %113 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %114 = "neura.data_mov"(%68) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %115 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %116 = "neura.fused_op"(%113, %114, %115) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>):
      %237 = "neura.add"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %238 = "neura.gep"(%arg7, %237) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %239 = "neura.load"(%238) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%239 : !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %117 = "neura.data_mov"(%116) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %118 = "neura.data_mov"(%65) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %119 = "neura.data_mov"(%112) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %120 = "neura.fused_op"(%118, %117, %119) <{frequency = 1 : i64, pattern_id = 3 : i64, pattern_name = "plaid.unicast:load->mul->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>):
      %237 = "neura.load"(%arg5) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %238 = "neura.mul"(%237, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %239 = "neura.add"(%238, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%239 : !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %121 = "neura.data_mov"(%120) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %122 = "neura.data_mov"(%110) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%121, %122) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %123 = "neura.data_mov"(%89) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %124 = "neura.data_mov"(%62) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %125 = "neura.data_mov"(%59) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %126:3 = "neura.fused_op"(%123, %124, %125) <{frequency = 1 : i64, pattern_id = 4 : i64, pattern_name = "plaid.unicast:add->icmp->not"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %237 = "neura.add"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %238 = "neura.icmp"(%237, %arg7) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %239 = "neura.not"(%238) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      neura.yield results(%237, %238, %239 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    %127 = "neura.data_mov"(%126#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %128 = "neura.data_mov"(%126#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %129 = "neura.data_mov"(%126#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %130 = "neura.data_mov"(%126#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %131 = "neura.data_mov"(%126#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %132 = "neura.data_mov"(%126#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %133 = "neura.data_mov"(%126#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %134 = "neura.data_mov"(%126#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %135 = "neura.data_mov"(%126#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %136 = "neura.data_mov"(%126#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %137 = "neura.data_mov"(%126#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %138 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %139 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %140 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %141 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %142 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %143 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %144 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %145 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %146 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %147 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %148 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %149 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %150 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %151 = "neura.data_mov"(%126#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %152 = neura.grant_predicate %127, %151 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %152 -> %87 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %153 = "neura.data_mov"(%86) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %154 = neura.grant_predicate %153, %150 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %154 -> %84 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %155 = "neura.data_mov"(%83) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %156 = neura.grant_predicate %155, %149 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %156 -> %81 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %157 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %158 = neura.grant_predicate %157, %148 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %158 -> %78 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %159 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %160 = neura.grant_predicate %159, %147 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %160 -> %75 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %161 = "neura.data_mov"(%74) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %162 = neura.grant_predicate %161, %146 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %162 -> %72 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %163 = "neura.data_mov"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %164 = neura.grant_predicate %163, %145 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %164 -> %69 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %165 = "neura.data_mov"(%68) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %166 = neura.grant_predicate %165, %144 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %166 -> %66 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %167 = "neura.data_mov"(%65) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %168 = neura.grant_predicate %167, %143 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %168 -> %63 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %169 = "neura.data_mov"(%62) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %170 = neura.grant_predicate %169, %142 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %170 -> %60 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %171 = "neura.data_mov"(%59) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %172 = neura.grant_predicate %171, %141 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %172 -> %57 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %173 = "neura.data_mov"(%56) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %174 = neura.grant_predicate %173, %140 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %174 -> %54 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %175 = "neura.data_mov"(%53) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %176 = neura.grant_predicate %175, %139 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %176 -> %51 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %177 = "neura.data_mov"(%50) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %178 = neura.grant_predicate %177, %138 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %178 -> %48 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %179 = "neura.data_mov"(%80) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %180 = neura.grant_predicate %179, %137 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %181 = "neura.data_mov"(%62) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %182 = neura.grant_predicate %181, %136 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %183 = "neura.data_mov"(%59) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %184 = neura.grant_predicate %183, %135 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %185 = "neura.data_mov"(%56) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %186 = neura.grant_predicate %185, %134 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %187 = "neura.data_mov"(%83) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %188 = neura.grant_predicate %187, %133 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %189 = "neura.data_mov"(%53) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %190 = neura.grant_predicate %189, %132 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %191 = "neura.data_mov"(%50) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %192 = neura.grant_predicate %191, %131 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %193 = "neura.data_mov"(%86) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %194 = neura.grant_predicate %193, %130 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %195 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %196 = neura.grant_predicate %195, %129 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %197 = "neura.data_mov"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %198 = neura.grant_predicate %197, %128 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %199 = "neura.data_mov"(%180) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %200 = "neura.data_mov"(%182) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %201 = "neura.data_mov"(%184) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %202:3 = "neura.fused_op"(%199, %200, %201) <{frequency = 1 : i64, pattern_id = 5 : i64, pattern_name = "plaid.unicast:add->icmp->not"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>):
      %237 = "neura.add"(%arg5, %arg6) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %238 = "neura.icmp"(%237, %arg7) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %239 = "neura.not"(%238) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      neura.yield results(%237, %238, %239 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    %203 = "neura.data_mov"(%202#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %204 = "neura.data_mov"(%202#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %205 = "neura.data_mov"(%202#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %206 = "neura.data_mov"(%202#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %207 = "neura.data_mov"(%202#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %208 = "neura.data_mov"(%202#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %209 = "neura.data_mov"(%202#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %210 = "neura.data_mov"(%202#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %211 = "neura.data_mov"(%202#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %212 = "neura.data_mov"(%202#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %213 = "neura.data_mov"(%202#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %214 = "neura.data_mov"(%202#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %215 = "neura.data_mov"(%202#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %216 = neura.grant_predicate %203, %215 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %216 -> %36 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %217 = "neura.data_mov"(%186) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %218 = neura.grant_predicate %217, %214 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %218 -> %33 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %219 = "neura.data_mov"(%188) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %220 = neura.grant_predicate %219, %213 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %220 -> %30 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %221 = "neura.data_mov"(%190) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %222 = neura.grant_predicate %221, %212 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %222 -> %27 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %223 = "neura.data_mov"(%192) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %224 = neura.grant_predicate %223, %211 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %224 -> %24 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %225 = "neura.data_mov"(%194) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %226 = neura.grant_predicate %225, %210 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %226 -> %21 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %227 = "neura.data_mov"(%196) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %228 = neura.grant_predicate %227, %209 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %228 -> %18 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %229 = "neura.data_mov"(%198) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %230 = neura.grant_predicate %229, %208 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %230 -> %15 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %231 = "neura.data_mov"(%182) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %232 = neura.grant_predicate %231, %207 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %232 -> %12 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %233 = "neura.data_mov"(%184) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %234 = neura.grant_predicate %233, %206 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %234 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %235 = neura.grant_predicate %205, %204 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %236 = "neura.data_mov"(%235) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %236 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

