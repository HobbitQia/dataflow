#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %7 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%8: i64):  // 2 preds: ^bb0, ^bb1
    %9 = llvm.trunc %8 {latency = 1 : i32} : i64 to i32
    %10 = llvm.getelementptr inbounds %1[0, %8] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %9, %10 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %11 = llvm.trunc %8 {latency = 1 : i32} : i64 to i16
    %12 = llvm.urem %11, %2 {latency = 1 : i32} : i16
    %13 = llvm.zext %12 {latency = 1 : i32} : i16 to i32
    %14 = llvm.getelementptr inbounds %3[0, %8] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    llvm.store %13, %14 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %15 = llvm.add %8, %4 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %16 = llvm.icmp "eq" %15, %5 {latency = 1 : i32} : i64
    llvm.cond_br %16, ^bb2(%0 : i64), ^bb1(%15 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2(%17: i64):  // 2 preds: ^bb1, ^bb2
    %18 = llvm.getelementptr inbounds %1[0, %17] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %19 = llvm.load %18 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %20 = llvm.mul %19, %6 overflow<nsw> {latency = 1 : i32} : i32
    %21 = llvm.getelementptr inbounds %3[0, %17] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %22 = llvm.load %21 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %23 = llvm.add %20, %22 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %23, %21 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %24 = llvm.add %17, %4 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %25 = llvm.icmp "eq" %24, %5 {latency = 1 : i32} : i64
    llvm.cond_br %25, ^bb3, ^bb2(%24 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb3:  // pred: ^bb2
    llvm.return {latency = 1 : i32} %7 : i32
  }
  func.func @_Z6kernelPKiPi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, mapping_info = {compiled_ii = 4 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 4 : i32, res_mii = 2 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = 1 : i64}> {dfg_id = 0 : i32, latency = 1 : i32, mapping_locs = [{id = 3 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 3 : i32, y = 0 : i32}]} : () -> !neura.data<i64, i1>
    %1 = neura.reserve {dfg_id = 1 : i32} : !neura.data<i64, i1>
    %2 = "neura.fused_op"(%1) <{frequency = 5 : i64, pattern_id = 0 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %54 = "neura.grant_once"() <{constant_value = 1024 : i64}> {dfg_id = 2 : i32} : () -> !neura.data<i64, i1>
      %55 = neura.phi_start %54, %arg2 {dfg_id = 16 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%55 : !neura.data<i64, i1>) {dfg_id = 30 : i32}
    }) {dfg_id = 15 : i32, latency = 1 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 3 : i32, x = 2 : i32, y = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %3 = "neura.data_mov"(%2) {dfg_id = 29 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 3 : i32}, {id = 194 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 4 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %4 = "neura.data_mov"(%2) {dfg_id = 28 : i32, mapping_locs = [{id = 320 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %5 = neura.reserve {dfg_id = 3 : i32} : !neura.data<i64, i1>
    %6 = "neura.data_mov"(%0) {dfg_id = 14 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %7 = neura.phi_start %6, %5 {dfg_id = 27 : i32, latency = 1 : i32, mapping_locs = [{id = 2 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 2 : i32, x = 2 : i32, y = 0 : i32}]} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %8 = neura.reserve {dfg_id = 4 : i32} : !neura.data<!llvm.ptr, i1>
    %9 = neura.reserve {dfg_id = 5 : i32} : !neura.data<i32, i1>
    %10 = "neura.fused_op"(%9) <{frequency = 5 : i64, pattern_id = 0 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>):
      %54 = "neura.grant_once"() <{constant_value = 3 : i32}> {dfg_id = 6 : i32} : () -> !neura.data<i32, i1>
      %55 = neura.phi_start %54, %arg2 {dfg_id = 18 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%55 : !neura.data<i32, i1>) {dfg_id = 33 : i32}
    }) {dfg_id = 17 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %11 = "neura.data_mov"(%10) {dfg_id = 32 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}, {id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 4 : i32}, {id = 160 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 5 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %12 = "neura.data_mov"(%10) {dfg_id = 31 : i32, mapping_locs = [{id = 16 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %13 = neura.reserve {dfg_id = 7 : i32} : !neura.data<!llvm.ptr, i1>
    %14 = neura.reserve {dfg_id = 8 : i32} : !neura.data<i64, i1>
    %15 = "neura.fused_op"(%14) <{frequency = 6 : i64, pattern_id = 0 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %54 = "neura.grant_once"() <{constant_value = 0 : i64}> {dfg_id = 9 : i32} : () -> !neura.data<i64, i1>
      %55 = neura.phi_start %54, %arg2 {dfg_id = 20 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%55 : !neura.data<i64, i1>) {dfg_id = 37 : i32}
    }) {dfg_id = 19 : i32, latency = 1 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = "neura.data_mov"(%15) {dfg_id = 36 : i32, mapping_locs = [{id = 28 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 33 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = "neura.data_mov"(%15) {dfg_id = 35 : i32, mapping_locs = [{id = 288 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %18 = "neura.data_mov"(%15) {dfg_id = 34 : i32, mapping_locs = [{id = 289 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 289 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19:2 = "neura.fused_op"(%8, %18) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:grant_once->phi_start->gep"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %54 = "neura.grant_once"() <{constant_value = "%arg1"}> {dfg_id = 10 : i32} : () -> !neura.data<!llvm.ptr, i1>
      %55 = neura.phi_start %54, %arg2 {dfg_id = 21 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %56 = "neura.gep"(%55, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> {dfg_id = 38 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%55, %56 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) {dfg_id = 45 : i32}
    }) {dfg_id = 43 : i32, latency = 1 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %20 = "neura.data_mov"(%19#0) {dfg_id = 48 : i32, mapping_locs = [{id = 28 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 3 : i32}, {id = 322 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 4 : i32}, {id = 322 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 5 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %21 = "neura.data_mov"(%19#1) {dfg_id = 50 : i32, mapping_locs = [{id = 29 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 3 : i32}, {id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 4 : i32}, {id = 12 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %22 = "neura.data_mov"(%19#1) {dfg_id = 49 : i32, mapping_locs = [{id = 27 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %23:2 = "neura.fused_op"(%13, %17) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:grant_once->phi_start->gep"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %54 = "neura.grant_once"() <{constant_value = "%arg0"}> {dfg_id = 11 : i32} : () -> !neura.data<!llvm.ptr, i1>
      %55 = neura.phi_start %54, %arg2 {dfg_id = 22 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %56 = "neura.gep"(%55, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> {dfg_id = 39 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%55, %56 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) {dfg_id = 46 : i32}
    }) {dfg_id = 44 : i32, latency = 1 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 2 : i32, x = 1 : i32, y = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %24 = "neura.data_mov"(%23#0) {dfg_id = 51 : i32, mapping_locs = [{id = 29 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 2 : i32}, {id = 14 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 3 : i32}, {id = 195 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 3 : i32, resource = "register", time_step = 4 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %25 = "neura.data_mov"(%23#1) {dfg_id = 52 : i32, mapping_locs = [{id = 30 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %26 = "neura.load"(%25) {dfg_id = 56 : i32, latency = 1 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 3 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %27 = "neura.data_mov"(%26) {dfg_id = 59 : i32, mapping_locs = [{id = 42 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %28 = "neura.mul"(%27, %12) {dfg_id = 63 : i32, latency = 1 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %29 = "neura.load"(%22) {dfg_id = 55 : i32, latency = 1 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 4 : i32, x = 0 : i32, y = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %30 = "neura.data_mov"(%28) {dfg_id = 66 : i32, mapping_locs = [{id = 27 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 4 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %31 = "neura.data_mov"(%29) {dfg_id = 58 : i32, mapping_locs = [{id = 256 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 4 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %32 = "neura.add"(%30, %31) {dfg_id = 74 : i32, latency = 1 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 5 : i32, x = 0 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %33 = "neura.data_mov"(%32) {dfg_id = 82 : i32, mapping_locs = [{id = 256 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 5 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%33, %21) {dfg_id = 85 : i32, latency = 1 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 6 : i32, x = 0 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %34 = "neura.data_mov"(%7) {dfg_id = 42 : i32, mapping_locs = [{id = 7 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %35 = "neura.add"(%16, %34) {dfg_id = 47 : i32, latency = 1 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 3 : i32, x = 2 : i32, y = 1 : i32}]} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = "neura.data_mov"(%35) {dfg_id = 54 : i32, mapping_locs = [{id = 20 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %37 = "neura.icmp"(%36, %4) <{cmpType = "eq"}> {dfg_id = 57 : i32, latency = 1 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 4 : i32, x = 2 : i32, y = 2 : i32}]} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %38 = "neura.data_mov"(%37) {dfg_id = 62 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 4 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %39 = "neura.data_mov"(%35) {dfg_id = 53 : i32, mapping_locs = [{id = 192 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}, {id = 192 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 4 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %40 = "neura.data_mov"(%7) {dfg_id = 41 : i32, mapping_locs = [{id = 64 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}, {id = 7 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 3 : i32}, {id = 193 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 4 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %41:5 = "neura.fused_op"(%38, %39, %40, %3, %24) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %54 = "neura.not"(%arg2) {dfg_id = 12 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %55 = neura.grant_predicate %arg3, %54 {dfg_id = 26 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %56 = neura.grant_predicate %arg4, %54 {dfg_id = 25 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %57 = neura.grant_predicate %arg5, %54 {dfg_id = 24 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %58 = neura.grant_predicate %arg6, %54 {dfg_id = 23 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%54, %55, %56, %57, %58 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) {dfg_id = 40 : i32}
    }) {dfg_id = 65 : i32, latency = 1 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 5 : i32, x = 2 : i32, y = 1 : i32}]} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %42 = "neura.data_mov"(%41#0) {dfg_id = 69 : i32, mapping_locs = [{id = 20 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %43 = "neura.data_mov"(%41#0) {dfg_id = 68 : i32, mapping_locs = [{id = 17 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %44 = "neura.data_mov"(%41#1) {dfg_id = 70 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.data_mov"(%41#2) {dfg_id = 71 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %46 = "neura.data_mov"(%41#3) {dfg_id = 72 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %47 = "neura.data_mov"(%41#4) {dfg_id = 73 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %44 -> %14 {dfg_id = 78 : i32, latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %47 -> %13 {dfg_id = 81 : i32, latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %48 = neura.grant_predicate %11, %43 {dfg_id = 76 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 6 : i32, x = 1 : i32, y = 1 : i32}]} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %48 -> %9 {dfg_id = 83 : i32, latency = 1 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 6 : i32}]} : !neura.data<i32, i1> !neura.data<i32, i1>
    %49 = neura.grant_predicate %20, %42 {dfg_id = 77 : i32, latency = 1 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 6 : i32, x = 2 : i32, y = 2 : i32}]} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %49 -> %8 {dfg_id = 84 : i32, latency = 1 : i32, mapping_locs = [{id = 31 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 6 : i32}]} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %45 -> %5 {dfg_id = 79 : i32, latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %46 -> %1 {dfg_id = 80 : i32, latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %50 = "neura.data_mov"(%37) {dfg_id = 61 : i32, mapping_locs = [{id = 320 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 4 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %51 = "neura.data_mov"(%37) {dfg_id = 60 : i32, mapping_locs = [{id = 321 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 4 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %52 = neura.grant_predicate %50, %51 {dfg_id = 64 : i32, latency = 1 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 5 : i32, x = 2 : i32, y = 2 : i32}]} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %53 = "neura.data_mov"(%52) {dfg_id = 67 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %53 : !neura.data<i1, i1> {dfg_id = 75 : i32, latency = 1 : i32, mapping_locs = [{id = 11 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 6 : i32, x = 3 : i32, y = 2 : i32}]}
    neura.yield {dfg_id = 13 : i32, latency = 1 : i32}
  }
}

