#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1S(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<512 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1T(dense<0> : tensor<512xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<512 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3DTW(dense<0> : tensor<263169xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<263169 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %2 = llvm.mlir.addressof @_ZZ4mainE1S {latency = 1 : i32} : !llvm.ptr
    %3 = llvm.mlir.addressof @_ZZ4mainE1T {latency = 1 : i32} : !llvm.ptr
    %4 = llvm.mlir.constant(3 : i32) {latency = 1 : i32} : i32
    %5 = llvm.mlir.constant(512 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.addressof @_ZZ4mainE3DTW {latency = 1 : i32} : !llvm.ptr
    %7 = llvm.mlir.constant(65535 : i32) {latency = 1 : i32} : i32
    %8 = llvm.mlir.constant(263169 : i64) {latency = 1 : i32} : i64
    %9 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    %10 = llvm.mlir.constant(513 : i64) {latency = 1 : i32} : i64
    %11 = llvm.mlir.constant(-513 : i64) {latency = 1 : i32} : i64
    %12 = llvm.mlir.constant(-1 : i64) {latency = 1 : i32} : i64
    %13 = llvm.mlir.constant(2 : i64) {latency = 1 : i32} : i64
    %14 = llvm.mlir.constant(510 : i64) {latency = 1 : i32} : i64
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%15: i64):  // 2 preds: ^bb0, ^bb1
    %16 = llvm.add %15, %1 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %17 = llvm.getelementptr inbounds %2[0, %15] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %18 = llvm.trunc %16 {latency = 1 : i32} : i64 to i32
    llvm.store %18, %17 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %19 = llvm.getelementptr inbounds %3[0, %15] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %20 = llvm.trunc %15 {latency = 1 : i32} : i64 to i32
    %21 = llvm.add %20, %4 {latency = 1 : i32} : i32
    llvm.store %21, %19 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.icmp "eq" %16, %5 {latency = 1 : i32} : i64
    llvm.cond_br %22, ^bb2(%0 : i64), ^bb1(%16 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%23: i64):  // 2 preds: ^bb1, ^bb2
    %24 = llvm.getelementptr inbounds %6[0, %23] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %7, %24 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %23, %1 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %26 = llvm.icmp "eq" %25, %8 {latency = 1 : i32} : i64
    llvm.cond_br %26, ^bb3, ^bb2(%25 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.store %9, %6 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    llvm.br ^bb4(%1 : i64) {latency = 1 : i32}
  ^bb4(%27: i64):  // 2 preds: ^bb3, ^bb6
    %28 = llvm.getelementptr inbounds %2[0, %27] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %29 = llvm.mul %27, %10 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %30 = llvm.add %29, %11 overflow<nsw> {latency = 1 : i32} : i64
    %31 = llvm.add %29, %10 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %32 = llvm.load %28 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    llvm.br ^bb5(%1 : i64) {latency = 1 : i32}
  ^bb5(%33: i64):  // 2 preds: ^bb4, ^bb5
    %34 = llvm.getelementptr inbounds %3[0, %33] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %35 = llvm.load %34 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %36 = llvm.sub %32, %35 overflow<nsw> {latency = 1 : i32} : i32
    %37 = llvm.sub %35, %32 overflow<nsw> {latency = 1 : i32} : i32
    %38 = llvm.icmp "sgt" %37, %36 {latency = 1 : i32} : i32
    %39 = llvm.select %38, %37, %36 {latency = 1 : i32} : i1, i32
    %40 = llvm.add %33, %30 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %41 = llvm.getelementptr inbounds %6[0, %40] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %42 = llvm.load %41 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.add %33, %29 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %44 = llvm.getelementptr inbounds %6[0, %43] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %45 = llvm.load %44 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.add %43, %12 overflow<nsw> {latency = 1 : i32} : i64
    %47 = llvm.getelementptr inbounds %6[0, %46] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %48 = llvm.load %47 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %49 = llvm.icmp "slt" %45, %42 {latency = 1 : i32} : i32
    %50 = llvm.select %49, %45, %42 {latency = 1 : i32} : i1, i32
    %51 = llvm.icmp "slt" %48, %50 {latency = 1 : i32} : i32
    %52 = llvm.select %51, %48, %50 {latency = 1 : i32} : i1, i32
    %53 = llvm.add %52, %39 overflow<nsw> {latency = 1 : i32} : i32
    %54 = llvm.add %33, %1 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %55 = llvm.add %54, %31 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %56 = llvm.getelementptr inbounds %6[0, %55] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %53, %56 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %57 = llvm.getelementptr inbounds %3[0, %54] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<512 x i32>
    %58 = llvm.load %57 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %59 = llvm.sub %32, %58 overflow<nsw> {latency = 1 : i32} : i32
    %60 = llvm.sub %58, %32 overflow<nsw> {latency = 1 : i32} : i32
    %61 = llvm.icmp "sgt" %60, %59 {latency = 1 : i32} : i32
    %62 = llvm.select %61, %60, %59 {latency = 1 : i32} : i1, i32
    %63 = llvm.add %54, %30 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %64 = llvm.getelementptr inbounds %6[0, %63] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %65 = llvm.load %64 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %66 = llvm.add %54, %29 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %67 = llvm.getelementptr inbounds %6[0, %66] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    %68 = llvm.load %67 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %69 = llvm.load %44 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %70 = llvm.icmp "slt" %68, %65 {latency = 1 : i32} : i32
    %71 = llvm.select %70, %68, %65 {latency = 1 : i32} : i1, i32
    %72 = llvm.icmp "slt" %69, %71 {latency = 1 : i32} : i32
    %73 = llvm.select %72, %69, %71 {latency = 1 : i32} : i1, i32
    %74 = llvm.add %73, %62 overflow<nsw> {latency = 1 : i32} : i32
    %75 = llvm.add %33, %13 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %76 = llvm.add %75, %31 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %77 = llvm.getelementptr inbounds %6[0, %76] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<263169 x i32>
    llvm.store %74, %77 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %78 = llvm.icmp "ult" %33, %14 {latency = 1 : i32} : i64
    llvm.cond_br %78, ^bb5(%75 : i64), ^bb6 {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb6:  // pred: ^bb5
    %79 = llvm.add %27, %1 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %80 = llvm.icmp "eq" %79, %5 {latency = 1 : i32} : i64
    llvm.cond_br %80, ^bb7, ^bb4(%79 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb7:  // pred: ^bb6
    llvm.return {latency = 1 : i32} %9 : i32
  }
  func.func @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = 513 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %1 = "neura.grant_once"() <{constant_value = -513 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %2 = "neura.grant_once"() <{constant_value = 512 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %3 = neura.reserve : !neura.data<i64, i1>
    %4 = neura.reserve : !neura.data<i64, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %8 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10:2 = "neura.fused_op"(%9) <{frequency = 5 : i64, pattern_id = 9 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %232 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %233 = neura.phi_start %232, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%232, %233 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %11 = "neura.data_mov"(%10#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %12 = "neura.data_mov"(%10#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = "neura.data_mov"(%10#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = "neura.data_mov"(%0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = neura.phi_start %16, %15 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %19 = "neura.fused_op"(%18) <{frequency = 5 : i64, pattern_id = 9 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>):
      %232 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %233 = neura.phi_start %232, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%233 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %20 = "neura.data_mov"(%19) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %21 = "neura.data_mov"(%19) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.phi_start %11, %22 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %24 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = "neura.gep"(%21, %24) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %26 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.data_mov"(%17) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.mul"(%26, %27) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = "neura.data_mov"(%1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31:2 = "neura.fused_op"(%29, %14, %30) <{frequency = 3 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %232 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %233 = "neura.add"(%arg5, %232) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%232, %233 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %32 = "neura.data_mov"(%31#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = "neura.data_mov"(%31#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %34 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %35 = "neura.data_mov"(%17) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = "neura.add"(%34, %35) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = neura.phi_start %32, %37 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %39 = neura.reserve : !neura.data<i64, i1>
    %40 = "neura.data_mov"(%17) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %41 = neura.phi_start %40, %39 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %42 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %43 = neura.phi_start %20, %42 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %44 = neura.reserve : !neura.data<i64, i1>
    %45 = neura.reserve : !neura.data<i64, i1>
    %46 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %47 = neura.phi_start %46, %45 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<i64, i1>
    %49 = "neura.fused_op"(%4, %48) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %232 = "neura.grant_once"() <{constant_value = 510 : i64}> : () -> !neura.data<i64, i1>
      %233 = neura.phi_start %232, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %234 = neura.phi_start %233, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%234 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %50 = "neura.data_mov"(%49) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.data_mov"(%49) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = "neura.data_mov"(%49) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %53 = neura.reserve : !neura.data<i64, i1>
    %54 = "neura.fused_op"(%5, %53) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %232 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %233 = neura.phi_start %232, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %234 = neura.phi_start %233, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%234 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55 = "neura.data_mov"(%54) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %56 = "neura.data_mov"(%54) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = "neura.data_mov"(%54) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %58 = neura.reserve : !neura.data<i64, i1>
    %59 = neura.reserve : !neura.data<i64, i1>
    %60 = neura.reserve : !neura.data<i64, i1>
    %61 = "neura.fused_op"(%6, %60) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %232 = "neura.grant_once"() <{constant_value = -1 : i64}> : () -> !neura.data<i64, i1>
      %233 = neura.phi_start %232, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %234 = neura.phi_start %233, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%234 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %62 = "neura.data_mov"(%61) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %63 = "neura.data_mov"(%61) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %64 = "neura.data_mov"(%61) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = neura.reserve : !neura.data<i64, i1>
    %66 = "neura.data_mov"(%28) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67 = neura.phi_start %66, %65 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %68 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %69 = "neura.fused_op"(%7, %68) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %232 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %233 = neura.phi_start %232, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %234 = neura.phi_start %233, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%234 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %70 = "neura.data_mov"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.data_mov"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %72 = "neura.data_mov"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %73 = "neura.data_mov"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %74 = "neura.data_mov"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %75 = "neura.data_mov"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %76 = "neura.data_mov"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %77 = "neura.data_mov"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %78 = "neura.data_mov"(%69) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %79 = neura.reserve : !neura.data<i64, i1>
    %80 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %81 = "neura.fused_op"(%8, %80) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %232 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %233 = neura.phi_start %232, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %234 = neura.phi_start %233, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%234 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %82 = "neura.data_mov"(%81) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.data_mov"(%81) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = "neura.data_mov"(%81) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %85 = "neura.data_mov"(%81) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %86 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %87 = "neura.data_mov"(%25) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %88 = neura.phi_start %87, %86 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %89 = neura.reserve : !neura.data<i64, i1>
    %90:2 = "neura.fused_op"(%13, %89, %57) <{frequency = 3 : i64, pattern_id = 12 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %232 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %233 = "neura.add"(%232, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%232, %233 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %91 = "neura.data_mov"(%90#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %92 = "neura.data_mov"(%90#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %93 = "neura.data_mov"(%90#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %94 = "neura.data_mov"(%90#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %95 = "neura.data_mov"(%90#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %96 = "neura.data_mov"(%90#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %97 = "neura.data_mov"(%90#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98:2 = "neura.fused_op"(%33, %79, %95, %78) <{frequency = 4 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->fused_op:fused_op:add->gep->load"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %232 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %233 = "neura.add"(%arg5, %232) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %234 = "neura.gep"(%arg6, %233) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %235 = "neura.load"(%234) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%232, %235 : !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i32, i1>)
    %99 = "neura.data_mov"(%98#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %100 = "neura.data_mov"(%98#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %101 = "neura.data_mov"(%98#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %102 = "neura.data_mov"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %103:5 = "neura.fused_op"(%94, %52, %97, %102, %85, %100) <{frequency = 12 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<i64, i1>):
      %232 = "neura.icmp"(%arg3, %arg4) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %233 = neura.grant_predicate %arg5, %232 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %234 = neura.grant_predicate %arg6, %232 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %235 = neura.grant_predicate %arg7, %232 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %236 = neura.grant_predicate %arg8, %232 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%232, %233, %234, %235, %236 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>)
    %104 = "neura.data_mov"(%103#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %105 = "neura.data_mov"(%103#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %106 = "neura.data_mov"(%103#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %107 = "neura.data_mov"(%103#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %108 = "neura.data_mov"(%103#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %109 = "neura.data_mov"(%103#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %110 = "neura.data_mov"(%103#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %111 = "neura.data_mov"(%103#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %112 = "neura.data_mov"(%103#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %113 = "neura.data_mov"(%103#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %114 = "neura.data_mov"(%103#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %115 = "neura.data_mov"(%103#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %116 = "neura.data_mov"(%103#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %117 = "neura.data_mov"(%103#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %118 = "neura.data_mov"(%103#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %119 = "neura.data_mov"(%103#3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %120 = "neura.data_mov"(%103#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %121:3 = "neura.fused_op"(%12, %59, %93, %84) <{frequency = 10 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->fused_op:add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %232 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %233 = "neura.add"(%arg5, %232) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %234 = "neura.gep"(%arg6, %233) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%232, %233, %234 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %122 = "neura.data_mov"(%121#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %123 = "neura.data_mov"(%121#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %124 = "neura.data_mov"(%121#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %125 = "neura.data_mov"(%121#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %126 = "neura.data_mov"(%121#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %127 = "neura.data_mov"(%121#2) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %128 = "neura.data_mov"(%36) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %129:2 = "neura.fused_op"(%128, %58, %126, %77) <{frequency = 10 : i64, pattern_id = 13 : i64, pattern_name = "phi_start->fused_op:add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %232 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %233 = "neura.add"(%arg5, %232) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %234 = "neura.gep"(%arg6, %233) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%232, %234 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %130 = "neura.data_mov"(%129#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %131 = "neura.data_mov"(%129#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %132 = "neura.data_mov"(%129#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %133 = "neura.data_mov"(%67) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %134:3 = "neura.fused_op"(%92, %133, %76, %101) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:add->gep->load->fused_op:icmp->sel"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i32, i1>):
      %232 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %233 = "neura.gep"(%arg5, %232) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %234 = "neura.load"(%233) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %235 = "neura.icmp"(%234, %arg6) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      %236 = "neura.sel"(%235, %234, %arg6) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%232, %233, %236 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %135 = "neura.data_mov"(%134#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %136 = "neura.data_mov"(%134#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %137 = "neura.data_mov"(%134#2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %138 = "neura.fused_op"(%83, %91) <{frequency = 8 : i64, pattern_id = 2 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %232 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %233 = "neura.load"(%232) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%233 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %139 = "neura.data_mov"(%138) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %140 = "neura.data_mov"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %141:2 = "neura.fused_op"(%140, %139) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:load->sub->sub->fused_op:icmp->sel"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i32, i1>):
      %232 = "neura.load"(%arg3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %233 = "neura.sub"(%arg4, %232) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %234 = "neura.sub"(%232, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %235 = "neura.icmp"(%233, %234) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      %236 = "neura.sel"(%235, %233, %234) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%232, %236 : !neura.data<i32, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %142 = "neura.data_mov"(%141#0) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %143 = "neura.data_mov"(%141#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %144 = "neura.fused_op"(%127, %142) <{frequency = 4 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:load->sub->sub->fused_op:icmp->sel"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i32, i1>):
      %232 = "neura.load"(%arg3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %233 = "neura.sub"(%arg4, %232) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %234 = "neura.sub"(%232, %arg4) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %235 = "neura.icmp"(%234, %233) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      %236 = "neura.sel"(%235, %234, %233) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%236 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %145 = "neura.data_mov"(%144) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %146 = "neura.fused_op"(%125, %99, %75) <{frequency = 6 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->gep->load"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %232 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %233 = "neura.gep"(%arg5, %232) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %234 = "neura.load"(%233) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%234 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %147 = "neura.data_mov"(%146) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %148 = "neura.data_mov"(%67) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %149 = "neura.fused_op"(%124, %148, %74, %147) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:add->gep->load->fused_op:icmp->sel"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i32, i1>):
      %232 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %233 = "neura.gep"(%arg5, %232) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %234 = "neura.load"(%233) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %235 = "neura.icmp"(%234, %arg6) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      %236 = "neura.sel"(%235, %234, %arg6) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%236 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %150 = "neura.data_mov"(%149) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %151 = "neura.fused_op"(%135, %64, %73) <{frequency = 6 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:add->gep->load"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %232 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %233 = "neura.gep"(%arg5, %232) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %234 = "neura.load"(%233) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%234 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %152 = "neura.data_mov"(%151) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %153 = "neura.fused_op"(%152, %137, %143) <{frequency = 4 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:icmp->sel->add"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i32, i1>):
      %232 = "neura.icmp"(%arg3, %arg4) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      %233 = "neura.sel"(%232, %arg3, %arg4) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %234 = "neura.add"(%233, %arg5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%234 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %154 = "neura.data_mov"(%153) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%154, %132) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %155 = "neura.fused_op"(%136, %150) <{frequency = 6 : i64, pattern_id = 11 : i64, pattern_name = "load->fused_op:icmp->sel"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i32, i1>):
      %232 = "neura.load"(%arg3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %233 = "neura.icmp"(%232, %arg4) <{cmpType = "slt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
      %234 = "neura.sel"(%233, %232, %arg4) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%234 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %156 = "neura.data_mov"(%155) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %157 = "neura.add"(%156, %145) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %158 = "neura.data_mov"(%2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %159:2 = "neura.fused_op"(%158, %3, %44, %116) <{frequency = 12 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %232 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %233 = neura.phi_start %232, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %234 = neura.grant_predicate %233, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%233, %234 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %160 = "neura.data_mov"(%159#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %161 = "neura.data_mov"(%159#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %162 = "neura.data_mov"(%47) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %163:4 = "neura.fused_op"(%115, %162, %123, %160) <{frequency = 4 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %232 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %233 = neura.grant_predicate %arg4, %232 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %234 = neura.grant_predicate %arg5, %232 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %235 = neura.grant_predicate %arg6, %232 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%232, %233, %234, %235 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %164 = "neura.data_mov"(%163#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %165 = "neura.data_mov"(%163#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %166 = "neura.data_mov"(%163#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %167 = "neura.data_mov"(%163#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %168 = "neura.data_mov"(%163#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %169 = "neura.data_mov"(%163#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %170 = "neura.data_mov"(%163#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %171 = "neura.data_mov"(%163#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %172 = "neura.data_mov"(%163#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %173 = "neura.data_mov"(%163#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %174 = "neura.data_mov"(%163#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %175 = "neura.data_mov"(%163#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %176 = "neura.data_mov"(%163#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %177 = "neura.fused_op"(%96, %131, %72) <{frequency = 8 : i64, pattern_id = 1 : i64, pattern_name = "add->gep"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %232 = "neura.add"(%arg3, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %233 = "neura.gep"(%arg5, %232) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%233 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %178 = "neura.data_mov"(%177) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %179 = "neura.data_mov"(%157) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%179, %178) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    neura.ctrl_mov %117 -> %89 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %118 -> %86 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %119 -> %80 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %120 -> %79 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %180 = neura.grant_predicate %71, %114 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %180 -> %68 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %181 = "neura.data_mov"(%67) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %182 = neura.grant_predicate %181, %113 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %182 -> %65 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %183 = neura.grant_predicate %63, %112 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %183 -> %60 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %184 = neura.grant_predicate %122, %111 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %184 -> %59 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %185 = neura.grant_predicate %130, %110 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %185 -> %58 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %186 = neura.grant_predicate %56, %109 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %186 -> %53 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %187 = neura.grant_predicate %51, %108 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %187 -> %48 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %188 = "neura.data_mov"(%47) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %189 = neura.grant_predicate %188, %107 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %189 -> %45 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %161 -> %44 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %190 = "neura.data_mov"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %191 = neura.grant_predicate %190, %106 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %191 -> %42 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %192 = "neura.data_mov"(%41) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %193 = neura.grant_predicate %192, %105 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %193 -> %39 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %194 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %195 = neura.grant_predicate %194, %104 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %195 -> %37 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %196 = neura.grant_predicate %55, %171 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %197 = "neura.add"(%172, %174) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %198 = "neura.data_mov"(%197) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %199:2 = "neura.fused_op"(%198, %176) <{frequency = 18 : i64, pattern_id = 5 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %232 = "neura.icmp"(%arg3, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %233 = neura.grant_predicate %232, %232 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%232, %233 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %200 = "neura.data_mov"(%199#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %201 = "neura.data_mov"(%199#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %202 = "neura.data_mov"(%196) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %203 = "neura.data_mov"(%197) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %204:5 = "neura.fused_op"(%200, %173, %202, %203, %50, %170) <{frequency = 14 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i1, i1>):
      %232 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %233 = neura.grant_predicate %arg4, %232 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %234 = neura.grant_predicate %arg5, %232 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %235 = neura.grant_predicate %arg6, %232 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %236 = neura.grant_predicate %arg7, %arg8 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %237 = neura.grant_predicate %236, %232 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%232, %233, %234, %235, %237 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %205 = "neura.data_mov"(%204#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %206 = "neura.data_mov"(%204#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %207 = "neura.data_mov"(%204#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %208 = "neura.data_mov"(%204#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %209 = "neura.data_mov"(%204#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %210 = "neura.data_mov"(%204#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %211 = "neura.data_mov"(%204#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %212 = "neura.data_mov"(%204#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %213 = "neura.data_mov"(%204#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %214 = "neura.data_mov"(%204#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %215 = "neura.data_mov"(%204#4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %216 = "neura.fused_op"(%62, %169, %211) <{frequency = 9 : i64, pattern_id = 10 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %232 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %233 = neura.grant_predicate %232, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%233 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %217 = "neura.data_mov"(%216) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %218 = "neura.fused_op"(%70, %168, %210) <{frequency = 9 : i64, pattern_id = 10 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %232 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %233 = neura.grant_predicate %232, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%233 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %219 = "neura.data_mov"(%218) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %220 = "neura.fused_op"(%82, %167, %209) <{frequency = 9 : i64, pattern_id = 10 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %232 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %233 = neura.grant_predicate %232, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%233 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %221 = "neura.data_mov"(%220) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %222 = "neura.data_mov"(%38) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %223 = "neura.fused_op"(%222, %166, %208) <{frequency = 9 : i64, pattern_id = 10 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %232 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %233 = neura.grant_predicate %232, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%233 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %224 = "neura.data_mov"(%223) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %225 = "neura.data_mov"(%41) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %226 = "neura.fused_op"(%225, %165, %207) <{frequency = 9 : i64, pattern_id = 10 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %232 = neura.grant_predicate %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %233 = neura.grant_predicate %232, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%233 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %227 = "neura.data_mov"(%226) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %228 = "neura.data_mov"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %229 = "neura.fused_op"(%228, %164, %206) <{frequency = 9 : i64, pattern_id = 10 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>, %arg5: !neura.data<i1, i1>):
      %232 = neura.grant_predicate %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %233 = neura.grant_predicate %232, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%233 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %230 = "neura.data_mov"(%229) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %214 -> %22 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %230 -> %18 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %227 -> %15 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %224 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %212 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %221 -> %8 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %219 -> %7 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %217 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %213 -> %5 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %215 -> %4 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %231 = neura.grant_predicate %175, %205 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %231 -> %3 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %201 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

