#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1x(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.mlir.global internal unnamed_addr @_ZZ4mainE1y(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.addressof @_ZZ4mainE1x {latency = 1 : i32} : !llvm.ptr
    %2 = llvm.mlir.constant(7 : i16) {latency = 1 : i32} : i16
    %3 = llvm.mlir.addressof @_ZZ4mainE1y {latency = 1 : i32} : !llvm.ptr
    %4 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %5 = llvm.mlir.constant(1024 : i64) {latency = 1 : i32} : i64
    %6 = llvm.mlir.constant(3 : i32) {latency = 1 : i32} : i32
    %7 = llvm.mlir.constant(2 : i64) {latency = 1 : i32} : i64
    %8 = llvm.mlir.constant(1022 : i64) {latency = 1 : i32} : i64
    %9 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%10: i64):  // 2 preds: ^bb0, ^bb1
    %11 = llvm.trunc %10 {latency = 1 : i32} : i64 to i32
    %12 = llvm.getelementptr inbounds %1[0, %10] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %11, %12 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %13 = llvm.trunc %10 {latency = 1 : i32} : i64 to i16
    %14 = llvm.urem %13, %2 {latency = 1 : i32} : i16
    %15 = llvm.zext %14 {latency = 1 : i32} : i16 to i32
    %16 = llvm.getelementptr inbounds %3[0, %10] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %15, %16 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %17 = llvm.add %10, %4 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %18 = llvm.icmp "eq" %17, %5 {latency = 1 : i32} : i64
    llvm.cond_br %18, ^bb2(%0 : i64), ^bb1(%17 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%19: i64):  // 2 preds: ^bb1, ^bb2
    %20 = llvm.getelementptr inbounds %1[0, %19] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %21 = llvm.load %20 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %22 = llvm.mul %21, %6 overflow<nsw> {latency = 1 : i32} : i32
    %23 = llvm.getelementptr inbounds %3[0, %19] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %24 = llvm.load %23 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %25 = llvm.add %22, %24 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %25, %23 {alignment = 8 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %26 = llvm.or %19, %4 {latency = 1 : i32} : i64
    %27 = llvm.getelementptr inbounds %1[0, %26] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %28 = llvm.load %27 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %29 = llvm.mul %28, %6 overflow<nsw> {latency = 1 : i32} : i32
    %30 = llvm.getelementptr inbounds %3[0, %26] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %31 = llvm.load %30 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %32 = llvm.add %29, %31 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %32, %30 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %33 = llvm.add %19, %7 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %34 = llvm.icmp "ult" %19, %8 {latency = 1 : i32} : i64
    llvm.cond_br %34, ^bb2(%33 : i64), ^bb3 {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.return {latency = 1 : i32} %9 : i32
  }
  func.func @_Z6kernelPKiPi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 2 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = 0 : i64}> {dfg_id = 0 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 1 : i32}]} : () -> !neura.data<i64, i1>
    %1 = neura.reserve {dfg_id = 1 : i32} : !neura.data<i64, i1>
    %2 = neura.reserve {dfg_id = 2 : i32} : !neura.data<i64, i1>
    %3 = "neura.fused_op"(%2) <{frequency = 6 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %41 = "neura.grant_once"() <{constant_value = 2 : i64}> {dfg_id = 3 : i32} : () -> !neura.data<i64, i1>
      %42 = neura.phi_start %41, %arg2 {dfg_id = 19 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%42 : !neura.data<i64, i1>) {dfg_id = 30 : i32}
    }) {dfg_id = 18 : i32, latency = 1 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %4 = "neura.data_mov"(%3) {dfg_id = 29 : i32, mapping_locs = [{id = 28 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %5 = neura.reserve {dfg_id = 4 : i32} : !neura.data<i64, i1>
    %6 = neura.reserve {dfg_id = 5 : i32} : !neura.data<!llvm.ptr, i1>
    %7 = "neura.fused_op"(%6) <{frequency = 6 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>):
      %41 = "neura.grant_once"() <{constant_value = "%arg1"}> {dfg_id = 6 : i32} : () -> !neura.data<!llvm.ptr, i1>
      %42 = neura.phi_start %41, %arg2 {dfg_id = 21 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%42 : !neura.data<!llvm.ptr, i1>) {dfg_id = 33 : i32}
    }) {dfg_id = 20 : i32, latency = 1 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 2 : i32, y = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %8 = "neura.data_mov"(%7) {dfg_id = 32 : i32, mapping_locs = [{id = 31 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 27 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}, {id = 25 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}, {id = 11 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 4 : i32}, {id = 0 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 5 : i32}, {id = 34 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 6 : i32}, {id = 34 : i32, index_per_ii = 1 : i32, invalid_iterations = 3 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 7 : i32}, {id = 34 : i32, index_per_ii = 0 : i32, invalid_iterations = 4 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 8 : i32}, {id = 34 : i32, index_per_ii = 1 : i32, invalid_iterations = 4 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 9 : i32}, {id = 34 : i32, index_per_ii = 0 : i32, invalid_iterations = 5 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 10 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %9 = "neura.data_mov"(%7) {dfg_id = 31 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 193 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %10 = neura.reserve {dfg_id = 7 : i32} : !neura.data<i32, i1>
    %11 = neura.reserve {dfg_id = 8 : i32} : !neura.data<!llvm.ptr, i1>
    %12 = neura.reserve {dfg_id = 9 : i32} : !neura.data<i64, i1>
    %13 = "neura.data_mov"(%0) {dfg_id = 17 : i32, mapping_locs = [{id = 14 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 192 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14:8 = "neura.fused_op"(%1, %13, %12, %4, %9) <{frequency = 2 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:grant_once->phi_start->fused_op:fused_op:fused_op:fused_op:phi_start->add->fused_op:gep->load->fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %41 = "neura.grant_once"() <{constant_value = 1022 : i64}> {dfg_id = 10 : i32} : () -> !neura.data<i64, i1>
      %42 = neura.phi_start %41, %arg2 {dfg_id = 22 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %43 = neura.phi_start %arg3, %arg4 {dfg_id = 11 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %44 = "neura.add"(%43, %arg5) {dfg_id = 24 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %45 = "neura.gep"(%arg6, %43) <{operandSegmentSizes = array<i32: 1, 1>}> {dfg_id = 23 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %46 = "neura.load"(%45) {dfg_id = 35 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %47 = "neura.icmp"(%43, %42) <{cmpType = "ult"}> {dfg_id = 34 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %48 = neura.grant_predicate %44, %47 {dfg_id = 46 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %49 = neura.grant_predicate %arg5, %47 {dfg_id = 45 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %50 = neura.grant_predicate %arg6, %47 {dfg_id = 44 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %51 = neura.grant_predicate %42, %47 {dfg_id = 43 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%43, %45, %46, %47, %48, %49, %50, %51 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) {dfg_id = 63 : i32}
    }) {dfg_id = 42 : i32, latency = 2 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 2 : i32, y = 1 : i32}, {id = 6 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 2 : i32, y = 1 : i32}]} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>)
    %15 = "neura.data_mov"(%14#0) {dfg_id = 52 : i32, mapping_locs = [{id = 196 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 4 : i32, resource = "register", time_step = 4 : i32}, {id = 17 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 5 : i32}, {id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "link", time_step = 6 : i32}, {id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 3 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 7 : i32}, {id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 4 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 8 : i32}, {id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 4 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 9 : i32}, {id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 5 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 10 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = "neura.data_mov"(%14#0) {dfg_id = 51 : i32, mapping_locs = [{id = 194 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 4 : i32}, {id = 18 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 5 : i32}, {id = 22 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "link", time_step = 6 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = "neura.data_mov"(%14#1) {dfg_id = 53 : i32, mapping_locs = [{id = 197 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 5 : i32, resource = "register", time_step = 4 : i32}, {id = 20 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 5 : i32}, {id = 32 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "link", time_step = 6 : i32}, {id = 36 : i32, index_per_ii = 1 : i32, invalid_iterations = 3 : i32, resource = "link", time_step = 7 : i32}, {id = 224 : i32, index_per_ii = 0 : i32, invalid_iterations = 4 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 8 : i32}, {id = 224 : i32, index_per_ii = 1 : i32, invalid_iterations = 4 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 9 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %18 = "neura.data_mov"(%14#2) {dfg_id = 54 : i32, mapping_locs = [{id = 195 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 3 : i32, resource = "register", time_step = 4 : i32}, {id = 19 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 5 : i32}, {id = 6 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "link", time_step = 6 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %19 = "neura.data_mov"(%14#3) {dfg_id = 58 : i32, mapping_locs = [{id = 20 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 4 : i32}, {id = 320 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 5 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %20 = "neura.data_mov"(%14#3) {dfg_id = 57 : i32, mapping_locs = [{id = 17 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 4 : i32}, {id = 15 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 5 : i32}, {id = 32 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 6 : i32}, {id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 3 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 7 : i32}, {id = 32 : i32, index_per_ii = 0 : i32, invalid_iterations = 4 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 8 : i32}, {id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 4 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 9 : i32}, {id = 32 : i32, index_per_ii = 0 : i32, invalid_iterations = 5 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 10 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %21 = "neura.data_mov"(%14#3) {dfg_id = 56 : i32, mapping_locs = [{id = 18 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 4 : i32}, {id = 22 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 5 : i32}, {id = 96 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 6 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %22 = "neura.data_mov"(%14#3) {dfg_id = 55 : i32, mapping_locs = [{id = 19 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 4 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %23 = "neura.data_mov"(%14#4) {dfg_id = 59 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = "neura.data_mov"(%14#5) {dfg_id = 60 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = "neura.data_mov"(%14#6) {dfg_id = 61 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %26 = "neura.data_mov"(%14#7) {dfg_id = 62 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27:2 = "neura.fused_op"(%10, %22) <{frequency = 5 : i64, pattern_id = 7 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i1, i1>):
      %41 = "neura.grant_once"() <{constant_value = 3 : i32}> {dfg_id = 12 : i32} : () -> !neura.data<i32, i1>
      %42 = neura.phi_start %41, %arg2 {dfg_id = 25 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %43 = neura.grant_predicate %42, %arg3 {dfg_id = 36 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%42, %43 : !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 47 : i32}
    }) {dfg_id = 67 : i32, latency = 1 : i32, mapping_locs = [{id = 2 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 5 : i32, x = 2 : i32, y = 0 : i32}]} : (!neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %28 = "neura.data_mov"(%27#0) {dfg_id = 76 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 5 : i32}, {id = 35 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, per_tile_register_id = 3 : i32, resource = "register", time_step = 6 : i32}, {id = 35 : i32, index_per_ii = 1 : i32, invalid_iterations = 3 : i32, per_tile_register_id = 3 : i32, resource = "register", time_step = 7 : i32}, {id = 35 : i32, index_per_ii = 0 : i32, invalid_iterations = 4 : i32, per_tile_register_id = 3 : i32, resource = "register", time_step = 8 : i32}, {id = 35 : i32, index_per_ii = 1 : i32, invalid_iterations = 4 : i32, per_tile_register_id = 3 : i32, resource = "register", time_step = 9 : i32}, {id = 35 : i32, index_per_ii = 0 : i32, invalid_iterations = 5 : i32, per_tile_register_id = 3 : i32, resource = "register", time_step = 10 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %29 = "neura.data_mov"(%27#0) {dfg_id = 75 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 5 : i32}, {id = 97 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 6 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %30 = "neura.data_mov"(%27#1) {dfg_id = 77 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %31:3 = "neura.fused_op"(%11, %21, %16, %29, %18) <{frequency = 2 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:fused_op:grant_once->phi_start->grant_predicate->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i32, i1>, %arg6: !neura.data<i32, i1>):
      %41 = "neura.grant_once"() <{constant_value = "%arg0"}> {dfg_id = 13 : i32} : () -> !neura.data<!llvm.ptr, i1>
      %42 = neura.phi_start %41, %arg2 {dfg_id = 26 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %43 = neura.grant_predicate %42, %arg3 {dfg_id = 38 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %44 = "neura.gep"(%42, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> {dfg_id = 37 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %45 = "neura.load"(%44) {dfg_id = 48 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %46 = "neura.mul"(%45, %arg5) {dfg_id = 64 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %47 = "neura.add"(%46, %arg6) {dfg_id = 73 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%42, %43, %47 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) {dfg_id = 79 : i32}
    }) {dfg_id = 81 : i32, latency = 3 : i32, mapping_locs = [{id = 3 : i32, index_per_ii = 1 : i32, invalid_iterations = 3 : i32, resource = "tile", time_step = 7 : i32, x = 3 : i32, y = 0 : i32}, {id = 3 : i32, index_per_ii = 0 : i32, invalid_iterations = 4 : i32, resource = "tile", time_step = 8 : i32, x = 3 : i32, y = 0 : i32}, {id = 3 : i32, index_per_ii = 1 : i32, invalid_iterations = 4 : i32, resource = "tile", time_step = 9 : i32, x = 3 : i32, y = 0 : i32}]} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %32 = "neura.data_mov"(%31#0) {dfg_id = 85 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 1 : i32, invalid_iterations = 4 : i32, resource = "link", time_step = 9 : i32}, {id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 5 : i32, resource = "link", time_step = 10 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = "neura.data_mov"(%31#1) {dfg_id = 86 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = "neura.data_mov"(%31#2) {dfg_id = 87 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 1 : i32, invalid_iterations = 4 : i32, resource = "link", time_step = 9 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %35:3 = "neura.fused_op"(%5, %20, %15, %8, %32, %28) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:grant_once->phi_start->grant_predicate->fused_op:fused_op:or->fused_op:gep->load->fused_op:fused_op:gep->load->fused_op:mul->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>, %arg6: !neura.data<!llvm.ptr, i1>, %arg7: !neura.data<i32, i1>):
      %41 = "neura.grant_once"() <{constant_value = 1 : i64}> {dfg_id = 14 : i32} : () -> !neura.data<i64, i1>
      %42 = neura.phi_start %41, %arg2 {dfg_id = 27 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %43 = neura.grant_predicate %42, %arg3 {dfg_id = 40 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %44 = "neura.or"(%arg4, %42) {dfg_id = 39 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %45 = "neura.gep"(%arg5, %44) <{operandSegmentSizes = array<i32: 1, 1>}> {dfg_id = 50 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %46 = "neura.load"(%45) {dfg_id = 66 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %47 = "neura.gep"(%arg6, %44) <{operandSegmentSizes = array<i32: 1, 1>}> {dfg_id = 49 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %48 = "neura.load"(%47) {dfg_id = 65 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %49 = "neura.mul"(%48, %arg7) {dfg_id = 74 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      %50 = "neura.add"(%49, %46) {dfg_id = 80 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%43, %45, %50 : !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) {dfg_id = 84 : i32}
    }) {dfg_id = 88 : i32, latency = 3 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 5 : i32, resource = "tile", time_step = 11 : i32, x = 1 : i32, y = 0 : i32}, {id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 6 : i32, resource = "tile", time_step = 12 : i32, x = 1 : i32, y = 0 : i32}, {id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 6 : i32, resource = "tile", time_step = 13 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) -> (!neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %36 = "neura.data_mov"(%35#0) {dfg_id = 91 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %37 = "neura.data_mov"(%35#1) {dfg_id = 92 : i32, mapping_locs = [{id = 36 : i32, index_per_ii = 1 : i32, invalid_iterations = 6 : i32, per_tile_register_id = 4 : i32, resource = "register", time_step = 13 : i32}, {id = 2 : i32, index_per_ii = 0 : i32, invalid_iterations = 7 : i32, resource = "link", time_step = 14 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = "neura.data_mov"(%35#2) {dfg_id = 93 : i32, mapping_locs = [{id = 2 : i32, index_per_ii = 1 : i32, invalid_iterations = 6 : i32, resource = "link", time_step = 13 : i32}, {id = 0 : i32, index_per_ii = 0 : i32, invalid_iterations = 7 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 14 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%34, %17) {dfg_id = 90 : i32, latency = 1 : i32, mapping_locs = [{id = 7 : i32, index_per_ii = 0 : i32, invalid_iterations = 5 : i32, resource = "tile", time_step = 10 : i32, x = 3 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    "neura.store"(%38, %37) {dfg_id = 95 : i32, latency = 1 : i32, mapping_locs = [{id = 0 : i32, index_per_ii = 1 : i32, invalid_iterations = 7 : i32, resource = "tile", time_step = 15 : i32, x = 0 : i32, y = 0 : i32}]} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %39 = "neura.fused_op"(%19) <{frequency = 2 : i64, pattern_id = 6 : i64, pattern_name = "not->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>):
      %41 = "neura.not"(%arg2) {dfg_id = 15 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %42 = neura.grant_predicate %41, %41 {dfg_id = 28 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%42 : !neura.data<i1, i1>) {dfg_id = 41 : i32}
    }) {dfg_id = 68 : i32, latency = 1 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "tile", time_step = 6 : i32, x = 2 : i32, y = 2 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %40 = "neura.data_mov"(%39) {dfg_id = 78 : i32, mapping_locs = [{id = 34 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "link", time_step = 6 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.ctrl_mov %23 -> %12 {dfg_id = 69 : i32, latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %33 -> %11 {dfg_id = 89 : i32, latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %30 -> %10 {dfg_id = 82 : i32, latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %25 -> %6 {dfg_id = 71 : i32, latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %36 -> %5 {dfg_id = 94 : i32, latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %24 -> %2 {dfg_id = 70 : i32, latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %26 -> %1 {dfg_id = 72 : i32, latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %40 : !neura.data<i1, i1> {dfg_id = 83 : i32, latency = 1 : i32, mapping_locs = [{id = 14 : i32, index_per_ii = 1 : i32, invalid_iterations = 3 : i32, resource = "tile", time_step = 7 : i32, x = 2 : i32, y = 3 : i32}]}
    neura.yield {dfg_id = 16 : i32, latency = 1 : i32}
  }
}

