#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3val(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3col(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE3row(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE7feature(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE6output(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.constant(7 : i16) {latency = 1 : i32} : i16
    %2 = llvm.mlir.constant(1 : i16) {latency = 1 : i32} : i16
    %3 = llvm.mlir.addressof @_ZZ4mainE3val {latency = 1 : i32} : !llvm.ptr
    %4 = llvm.mlir.addressof @_ZZ4mainE3col {latency = 1 : i32} : !llvm.ptr
    %5 = llvm.mlir.addressof @_ZZ4mainE3row {latency = 1 : i32} : !llvm.ptr
    %6 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %7 = llvm.mlir.constant(1024 : i64) {latency = 1 : i32} : i64
    %8 = llvm.mlir.constant(13 : i16) {latency = 1 : i32} : i16
    %9 = llvm.mlir.addressof @_ZZ4mainE7feature {latency = 1 : i32} : !llvm.ptr
    %10 = llvm.mlir.addressof @_ZZ4mainE6output {latency = 1 : i32} : !llvm.ptr
    %11 = llvm.mlir.constant(2 : i64) {latency = 1 : i32} : i64
    %12 = llvm.mlir.constant(1022 : i64) {latency = 1 : i32} : i64
    %13 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%14: i64):  // 2 preds: ^bb0, ^bb1
    %15 = llvm.trunc %14 {latency = 1 : i32} : i64 to i32
    %16 = llvm.trunc %14 {latency = 1 : i32} : i64 to i16
    %17 = llvm.urem %16, %1 {latency = 1 : i32} : i16
    %18 = llvm.add %17, %2 overflow<nsw, nuw> {latency = 1 : i32} : i16
    %19 = llvm.zext %18 {latency = 1 : i32} : i16 to i32
    %20 = llvm.getelementptr inbounds %3[0, %14] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %19, %20 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %21 = llvm.getelementptr inbounds %4[0, %14] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %15, %21 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %22 = llvm.getelementptr inbounds %5[0, %14] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %15, %22 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.add %14, %6 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %24 = llvm.icmp "eq" %23, %7 {latency = 1 : i32} : i64
    llvm.cond_br %24, ^bb2(%0 : i64), ^bb1(%23 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%25: i64):  // 2 preds: ^bb1, ^bb2
    %26 = llvm.trunc %25 {latency = 1 : i32} : i64 to i16
    %27 = llvm.urem %26, %8 {latency = 1 : i32} : i16
    %28 = llvm.zext %27 {latency = 1 : i32} : i16 to i32
    %29 = llvm.getelementptr inbounds %9[0, %25] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %28, %29 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %30 = llvm.add %25, %6 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %31 = llvm.icmp "eq" %30, %7 {latency = 1 : i32} : i64
    llvm.cond_br %31, ^bb3(%0 : i64), ^bb2(%30 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3(%32: i64):  // 2 preds: ^bb2, ^bb3
    %33 = llvm.getelementptr inbounds %3[0, %32] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %34 = llvm.load %33 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %35 = llvm.getelementptr inbounds %4[0, %32] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %36 = llvm.load %35 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.sext %36 {latency = 1 : i32} : i32 to i64
    %38 = llvm.getelementptr inbounds %9[0, %37] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %39 = llvm.load %38 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %40 = llvm.mul %39, %34 overflow<nsw> {latency = 1 : i32} : i32
    %41 = llvm.getelementptr inbounds %5[0, %32] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %42 = llvm.load %41 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %43 = llvm.sext %42 {latency = 1 : i32} : i32 to i64
    %44 = llvm.getelementptr inbounds %10[0, %43] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %45 = llvm.load %44 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %46 = llvm.add %45, %40 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %46, %44 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %47 = llvm.or %32, %6 {latency = 1 : i32} : i64
    %48 = llvm.getelementptr inbounds %3[0, %47] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %49 = llvm.load %48 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %50 = llvm.getelementptr inbounds %4[0, %47] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %51 = llvm.load %50 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.sext %51 {latency = 1 : i32} : i32 to i64
    %53 = llvm.getelementptr inbounds %9[0, %52] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %54 = llvm.load %53 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %55 = llvm.mul %54, %49 overflow<nsw> {latency = 1 : i32} : i32
    %56 = llvm.getelementptr inbounds %5[0, %47] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %57 = llvm.load %56 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %58 = llvm.sext %57 {latency = 1 : i32} : i32 to i64
    %59 = llvm.getelementptr inbounds %10[0, %58] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %60 = llvm.load %59 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %61 = llvm.add %60, %55 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %61, %59 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %62 = llvm.add %32, %11 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %63 = llvm.icmp "ult" %32, %12 {latency = 1 : i32} : i64
    llvm.cond_br %63, ^bb3(%62 : i64), ^bb4 {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return {latency = 1 : i32} %13 : i32
  }
  func.func @_Z6kernelPiS_S_S_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %1 = "neura.grant_once"() <{constant_value = 2 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %2 = "neura.grant_once"() <{constant_value = 1022 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %3 = neura.reserve : !neura.data<i64, i1>
    %4 = neura.phi_start %2, %3 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6 = neura.phi_start %1, %5 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = neura.phi_start %0, %7 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %10 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %11 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %12 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %13 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = "neura.fused_op"(%14) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %41 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %42 = neura.phi_start %41, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%42 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16:2 = "neura.fused_op"(%10, %15) <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "grant_once->fused_op:phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %41 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %42 = neura.phi_start %41, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %43 = "neura.gep"(%42, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %44 = "neura.load"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%42, %44 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %17:2 = "neura.fused_op"(%12, %15) <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "grant_once->fused_op:phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %41 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %42 = neura.phi_start %41, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %43 = "neura.gep"(%42, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %44 = "neura.load"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%42, %44 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %18:2 = "neura.fused_op"(%13, %15) <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "grant_once->fused_op:phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %41 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %42 = neura.phi_start %41, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %43 = "neura.gep"(%42, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %44 = "neura.load"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%42, %44 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %19 = neura.sext %17#1 {latency = 1 : i32} : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %20:2 = "neura.fused_op"(%11, %19) <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "grant_once->fused_op:phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %41 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
      %42 = neura.phi_start %41, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %43 = "neura.gep"(%42, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %44 = "neura.load"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%42, %44 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %21 = "neura.mul"(%20#1, %18#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %22 = neura.sext %16#1 {latency = 1 : i32} : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %23:3 = "neura.fused_op"(%9, %22) <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "grant_once->fused_op:phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %41 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %42 = neura.phi_start %41, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %43 = "neura.gep"(%42, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %44 = "neura.load"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%42, %43, %44 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %24 = "neura.add"(%23#2, %21) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%24, %23#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %25 = "neura.or"(%15, %8) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = "neura.fused_op"(%16#0, %25) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:gep->load->sext"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %41 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %42 = "neura.load"(%41) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %43 = neura.sext %42 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      neura.yield results(%43 : !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.fused_op"(%17#0, %25) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:gep->load->sext"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %41 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %42 = "neura.load"(%41) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %43 = neura.sext %42 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      neura.yield results(%43 : !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.fused_op"(%18#0, %25) <{frequency = 10 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %41 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %42 = "neura.load"(%41) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%42 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %29 = "neura.fused_op"(%20#0, %27, %28) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:gep->load->mul"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i32, i1>):
      %41 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %42 = "neura.load"(%41) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %43 = "neura.mul"(%42, %arg7) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%43 : !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %30:2 = "neura.fused_op"(%23#0, %26) <{frequency = 10 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %41 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %42 = "neura.load"(%41) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%41, %42 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %31 = "neura.add"(%30#1, %29) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%31, %30#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %32 = "neura.add"(%15, %6) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33:5 = "neura.fused_op"(%15, %4, %32, %6, %18#0) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<!llvm.ptr, i1>):
      %41 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %42 = neura.grant_predicate %arg7, %41 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %43 = neura.grant_predicate %arg8, %41 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %44 = neura.grant_predicate %arg6, %41 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %45 = neura.grant_predicate %arg9, %41 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%41, %42, %43, %44, %45 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %34 = "neura.not"(%33#0) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.ctrl_mov %33#1 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %33#4 -> %13 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %35 = neura.grant_predicate %17#0, %33#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %35 -> %12 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %36 = neura.grant_predicate %20#0, %33#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %36 -> %11 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %37 = neura.grant_predicate %16#0, %33#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %37 -> %10 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %38 = neura.grant_predicate %23#0, %33#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %38 -> %9 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %39 = neura.grant_predicate %8, %33#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %39 -> %7 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %33#2 -> %5 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %33#3 -> %3 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %40 = neura.grant_predicate %34, %34 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %40 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

