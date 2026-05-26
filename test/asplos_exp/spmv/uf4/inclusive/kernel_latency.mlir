#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %12 = llvm.mlir.constant(3 : i64) {latency = 1 : i32} : i64
    %13 = llvm.mlir.constant(4 : i64) {latency = 1 : i32} : i64
    %14 = llvm.mlir.constant(1020 : i64) {latency = 1 : i32} : i64
    %15 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%16: i64):  // 2 preds: ^bb0, ^bb1
    %17 = llvm.trunc %16 {latency = 1 : i32} : i64 to i32
    %18 = llvm.trunc %16 {latency = 1 : i32} : i64 to i16
    %19 = llvm.urem %18, %1 {latency = 1 : i32} : i16
    %20 = llvm.add %19, %2 overflow<nsw, nuw> {latency = 1 : i32} : i16
    %21 = llvm.zext %20 {latency = 1 : i32} : i16 to i32
    %22 = llvm.getelementptr inbounds %3[0, %16] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %21, %22 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %23 = llvm.getelementptr inbounds %4[0, %16] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %17, %23 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %24 = llvm.getelementptr inbounds %5[0, %16] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %17, %24 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %16, %6 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %26 = llvm.icmp "eq" %25, %7 {latency = 1 : i32} : i64
    llvm.cond_br %26, ^bb2(%0 : i64), ^bb1(%25 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%27: i64):  // 2 preds: ^bb1, ^bb2
    %28 = llvm.trunc %27 {latency = 1 : i32} : i64 to i16
    %29 = llvm.urem %28, %8 {latency = 1 : i32} : i16
    %30 = llvm.zext %29 {latency = 1 : i32} : i16 to i32
    %31 = llvm.getelementptr inbounds %9[0, %27] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %30, %31 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %32 = llvm.add %27, %6 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %33 = llvm.icmp "eq" %32, %7 {latency = 1 : i32} : i64
    llvm.cond_br %33, ^bb3(%0 : i64), ^bb2(%32 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3(%34: i64):  // 2 preds: ^bb2, ^bb3
    %35 = llvm.getelementptr inbounds %3[0, %34] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %36 = llvm.load %35 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %37 = llvm.getelementptr inbounds %4[0, %34] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %38 = llvm.load %37 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %39 = llvm.sext %38 {latency = 1 : i32} : i32 to i64
    %40 = llvm.getelementptr inbounds %9[0, %39] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %41 = llvm.load %40 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %42 = llvm.mul %41, %36 overflow<nsw> {latency = 1 : i32} : i32
    %43 = llvm.getelementptr inbounds %5[0, %34] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %44 = llvm.load %43 {alignment = 16 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %45 = llvm.sext %44 {latency = 1 : i32} : i32 to i64
    %46 = llvm.getelementptr inbounds %10[0, %45] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %47 = llvm.load %46 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %48 = llvm.add %47, %42 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %48, %46 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %49 = llvm.or %34, %6 {latency = 1 : i32} : i64
    %50 = llvm.getelementptr inbounds %3[0, %49] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %51 = llvm.load %50 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %52 = llvm.getelementptr inbounds %4[0, %49] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %53 = llvm.load %52 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %54 = llvm.sext %53 {latency = 1 : i32} : i32 to i64
    %55 = llvm.getelementptr inbounds %9[0, %54] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %56 = llvm.load %55 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %57 = llvm.mul %56, %51 overflow<nsw> {latency = 1 : i32} : i32
    %58 = llvm.getelementptr inbounds %5[0, %49] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %59 = llvm.load %58 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %60 = llvm.sext %59 {latency = 1 : i32} : i32 to i64
    %61 = llvm.getelementptr inbounds %10[0, %60] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %62 = llvm.load %61 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %63 = llvm.add %62, %57 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %63, %61 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %64 = llvm.or %34, %11 {latency = 1 : i32} : i64
    %65 = llvm.getelementptr inbounds %3[0, %64] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %66 = llvm.load %65 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %67 = llvm.getelementptr inbounds %4[0, %64] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %68 = llvm.load %67 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %69 = llvm.sext %68 {latency = 1 : i32} : i32 to i64
    %70 = llvm.getelementptr inbounds %9[0, %69] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %71 = llvm.load %70 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %72 = llvm.mul %71, %66 overflow<nsw> {latency = 1 : i32} : i32
    %73 = llvm.getelementptr inbounds %5[0, %64] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %74 = llvm.load %73 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %75 = llvm.sext %74 {latency = 1 : i32} : i32 to i64
    %76 = llvm.getelementptr inbounds %10[0, %75] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %77 = llvm.load %76 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %78 = llvm.add %77, %72 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %78, %76 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %79 = llvm.or %34, %12 {latency = 1 : i32} : i64
    %80 = llvm.getelementptr inbounds %3[0, %79] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %81 = llvm.load %80 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %82 = llvm.getelementptr inbounds %4[0, %79] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %83 = llvm.load %82 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %84 = llvm.sext %83 {latency = 1 : i32} : i32 to i64
    %85 = llvm.getelementptr inbounds %9[0, %84] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %86 = llvm.load %85 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %87 = llvm.mul %86, %81 overflow<nsw> {latency = 1 : i32} : i32
    %88 = llvm.getelementptr inbounds %5[0, %79] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %89 = llvm.load %88 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %90 = llvm.sext %89 {latency = 1 : i32} : i32 to i64
    %91 = llvm.getelementptr inbounds %10[0, %90] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %92 = llvm.load %91 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %93 = llvm.add %92, %87 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %93, %91 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %94 = llvm.add %34, %13 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %95 = llvm.icmp "ult" %34, %14 {latency = 1 : i32} : i64
    llvm.cond_br %95, ^bb3(%94 : i64), ^bb4 {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return {latency = 1 : i32} %15 : i32
  }
  func.func @_Z6kernelPiS_S_S_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg2"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %3 = "neura.grant_once"() <{constant_value = 2 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 3 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %5 = "neura.grant_once"() <{constant_value = 4 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 1020 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = neura.phi_start %6, %7 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.phi_start %5, %9 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %17 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %18 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = "neura.fused_op"(%19) <{frequency = 11 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>):
      %44 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %45 = neura.phi_start %44, %arg5 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%45 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %21:2 = "neura.fused_op"(%18, %20) <{frequency = 3 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %44 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %45 = neura.phi_start %44, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %46 = "neura.gep"(%45, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%45, %47 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %22:2 = "neura.fused_op"(%0, %17, %20) <{frequency = 8 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->fused_op:fused_op:gep->load->sext"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i64, i1>):
      %44 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %45 = "neura.gep"(%44, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %46 = "neura.load"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %47 = neura.sext %46 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      neura.yield results(%44, %47 : !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>)
    %23:2 = "neura.fused_op"(%16, %22#1) <{frequency = 3 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %44 = "neura.grant_once"() <{constant_value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
      %45 = neura.phi_start %44, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %46 = "neura.gep"(%45, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%45, %47 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %24:2 = "neura.fused_op"(%1, %15, %20) <{frequency = 8 : i64, pattern_id = 14 : i64, pattern_name = "phi_start->fused_op:fused_op:gep->load->sext"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i64, i1>):
      %44 = neura.phi_start %arg5, %arg6 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %45 = "neura.gep"(%44, %arg7) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %46 = "neura.load"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %47 = neura.sext %46 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      neura.yield results(%44, %47 : !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>)
    %25:3 = "neura.fused_op"(%14, %24#1) <{frequency = 3 : i64, pattern_id = 13 : i64, pattern_name = "grant_once->fused_op:phi_start->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>):
      %44 = "neura.grant_once"() <{constant_value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
      %45 = neura.phi_start %44, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %46 = "neura.gep"(%45, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%45, %46, %47 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %26:3 = "neura.fused_op"(%4, %11, %20, %21#0) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:phi_start->or->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>):
      %44 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %45 = "neura.or"(%arg7, %44) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %46 = "neura.gep"(%arg8, %45) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%44, %45, %47 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>)
    %27:3 = "neura.fused_op"(%3, %12, %20, %21#0) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:phi_start->or->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>):
      %44 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %45 = "neura.or"(%arg7, %44) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %46 = "neura.gep"(%arg8, %45) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%44, %45, %47 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>)
    %28:3 = "neura.fused_op"(%2, %13, %20, %21#0) <{frequency = 3 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:phi_start->or->fused_op:gep->load"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>):
      %44 = neura.phi_start %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %45 = "neura.or"(%arg7, %44) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %46 = "neura.gep"(%arg8, %45) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%44, %45, %47 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>)
    %29:2 = "neura.fused_op"(%24#0, %26#1, %25#0, %22#0, %23#0, %26#2) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:gep->load->sext->fused_op:gep->load->fused_op:fused_op:fused_op:gep->load->sext->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<i32, i1>):
      %44 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %45 = "neura.load"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %46 = neura.sext %45 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      %47 = "neura.gep"(%arg7, %46) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %48 = "neura.load"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %49 = "neura.gep"(%arg8, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %50 = "neura.load"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %51 = neura.sext %50 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      %52 = "neura.gep"(%arg9, %51) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %53 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %54 = "neura.mul"(%53, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %55 = "neura.add"(%48, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%47, %55 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %30:2 = "neura.fused_op"(%24#0, %27#1, %25#0, %22#0, %23#0, %27#2) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:gep->load->sext->fused_op:gep->load->fused_op:fused_op:fused_op:gep->load->sext->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<i32, i1>):
      %44 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %45 = "neura.load"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %46 = neura.sext %45 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      %47 = "neura.gep"(%arg7, %46) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %48 = "neura.load"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %49 = "neura.gep"(%arg8, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %50 = "neura.load"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %51 = neura.sext %50 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      %52 = "neura.gep"(%arg9, %51) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %53 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %54 = "neura.mul"(%53, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %55 = "neura.add"(%48, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%47, %55 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %31:2 = "neura.fused_op"(%24#0, %28#1, %25#0, %22#0, %23#0, %28#2) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:gep->load->sext->fused_op:gep->load->fused_op:fused_op:fused_op:gep->load->sext->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<!llvm.ptr, i1>, %arg8: !neura.data<!llvm.ptr, i1>, %arg9: !neura.data<!llvm.ptr, i1>, %arg10: !neura.data<i32, i1>):
      %44 = "neura.gep"(%arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %45 = "neura.load"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %46 = neura.sext %45 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      %47 = "neura.gep"(%arg7, %46) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %48 = "neura.load"(%47) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %49 = "neura.gep"(%arg8, %arg6) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %50 = "neura.load"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %51 = neura.sext %50 : !neura.data<i32, i1> -> !neura.data<i64, i1>
      %52 = "neura.gep"(%arg9, %51) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %53 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %54 = "neura.mul"(%53, %arg10) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %55 = "neura.add"(%48, %54) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%47, %55 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %32 = "neura.fused_op"(%23#1, %21#1, %25#2) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "mul->add"}> ({
    ^bb0(%arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>, %arg7: !neura.data<i32, i1>):
      %44 = "neura.mul"(%arg5, %arg6) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %45 = "neura.add"(%arg7, %44) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%45 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%32, %25#1) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%31#1, %31#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%30#1, %30#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%29#1, %29#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %33 = "neura.add"(%20, %10) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %34:5 = "neura.fused_op"(%20, %8, %33, %10, %21#0) <{frequency = 8 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<i64, i1>, %arg9: !neura.data<!llvm.ptr, i1>):
      %44 = "neura.icmp"(%arg5, %arg6) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %45 = neura.grant_predicate %arg7, %44 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %46 = neura.grant_predicate %arg8, %44 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %47 = neura.grant_predicate %arg6, %44 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %48 = neura.grant_predicate %arg9, %44 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%44, %45, %46, %47, %48 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %35 = "neura.not"(%34#0) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.ctrl_mov %34#1 -> %19 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %34#4 -> %18 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %36 = neura.grant_predicate %22#0, %34#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %36 -> %17 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %37 = neura.grant_predicate %23#0, %34#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %37 -> %16 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %38 = neura.grant_predicate %24#0, %34#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %38 -> %15 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %39 = neura.grant_predicate %25#0, %34#0 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %39 -> %14 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %40 = neura.grant_predicate %28#0, %34#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %40 -> %13 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %41 = neura.grant_predicate %27#0, %34#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %41 -> %12 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %42 = neura.grant_predicate %26#0, %34#0 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %42 -> %11 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %34#2 -> %9 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %34#3 -> %7 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %43 = neura.grant_predicate %35, %35 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %43 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

