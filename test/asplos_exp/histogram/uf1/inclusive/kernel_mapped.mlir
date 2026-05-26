#loop_unroll = #llvm.loop_unroll<disable = true>
#tbaa_root = #llvm.tbaa_root<id = "Simple C++ TBAA">
#loop_annotation = #llvm.loop_annotation<unroll = #loop_unroll, mustProgress = true>
#tbaa_type_desc = #llvm.tbaa_type_desc<id = "omnipotent char", members = {<#tbaa_root, 0>}>
#tbaa_type_desc1 = #llvm.tbaa_type_desc<id = "int", members = {<#tbaa_type_desc, 0>}>
#tbaa_tag = #llvm.tbaa_tag<base_type = #tbaa_type_desc1, access_type = #tbaa_type_desc1, offset = 0>
module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.mlir.global external local_unnamed_addr @input_data(dense<0> : tensor<1024xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<1024 x i32>
  llvm.mlir.global external local_unnamed_addr @hist(dense<0> : tensor<16xi32>) {addr_space = 0 : i32, alignment = 16 : i64, dso_local, latency = 1 : i32} : !llvm.array<16 x i32>
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i64) {latency = 1 : i32} : i64
    %1 = llvm.mlir.addressof @input_data {latency = 1 : i32} : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i64) {latency = 1 : i32} : i64
    %3 = llvm.mlir.constant(1024 : i64) {latency = 1 : i32} : i64
    %4 = llvm.mlir.addressof @hist {latency = 1 : i32} : !llvm.ptr
    %5 = llvm.mlir.constant(0 : i8) {latency = 1 : i32} : i8
    %6 = llvm.mlir.constant(64 : i64) {latency = 1 : i32} : i64
    %7 = llvm.mlir.constant(4 : i32) {latency = 1 : i32} : i32
    %8 = llvm.mlir.constant(1023 : i32) {latency = 1 : i32} : i32
    %9 = llvm.mlir.constant(1 : i32) {latency = 1 : i32} : i32
    %10 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.br ^bb1(%0 : i64) {latency = 1 : i32}
  ^bb1(%11: i64):  // 2 preds: ^bb0, ^bb1
    %12 = llvm.getelementptr inbounds %1[0, %11] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %13 = llvm.trunc %11 {latency = 1 : i32} : i64 to i32
    llvm.store %13, %12 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %14 = llvm.add %11, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %15 = llvm.icmp "eq" %14, %3 {latency = 1 : i32} : i64
    llvm.cond_br %15, ^bb2, ^bb1(%14 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb2:  // pred: ^bb1
    "llvm.intr.memset"(%4, %5, %6) <{isVolatile = false, tbaa = [#tbaa_tag]}> {latency = 1 : i32} : (!llvm.ptr, i8, i64) -> ()
    llvm.br ^bb3(%0 : i64) {latency = 1 : i32}
  ^bb3(%16: i64):  // 2 preds: ^bb2, ^bb3
    %17 = llvm.getelementptr inbounds %1[0, %16] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<1024 x i32>
    %18 = llvm.load %17 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %19 = llvm.shl %18, %7 overflow<nsw> {latency = 1 : i32} : i32
    %20 = llvm.sdiv %19, %8 {latency = 1 : i32} : i32
    %21 = llvm.sext %20 {latency = 1 : i32} : i32 to i64
    %22 = llvm.getelementptr inbounds %4[0, %21] {latency = 1 : i32} : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16 x i32>
    %23 = llvm.load %22 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : !llvm.ptr -> i32
    %24 = llvm.add %23, %9 overflow<nsw> {latency = 1 : i32} : i32
    llvm.store %24, %22 {alignment = 4 : i64, latency = 1 : i32, tbaa = [#tbaa_tag]} : i32, !llvm.ptr
    %25 = llvm.add %16, %2 overflow<nsw, nuw> {latency = 1 : i32} : i64
    %26 = llvm.icmp "eq" %25, %3 {latency = 1 : i32} : i64
    llvm.cond_br %26, ^bb4, ^bb3(%25 : i64) {latency = 1 : i32, loop_annotation = #loop_annotation}
  ^bb4:  // pred: ^bb3
    llvm.return {latency = 1 : i32} %10 : i32
  }
  func.func @_Z6kernelPiS_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, mapping_info = {compiled_ii = 5 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 4 : i32, res_mii = 2 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = 0 : i64}> {dfg_id = 0 : i32, latency = 1 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 2 : i32}]} : () -> !neura.data<i64, i1>
    %1 = neura.reserve {dfg_id = 1 : i32} : !neura.data<i64, i1>
    %2 = "neura.fused_op"(%1) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %61 = "neura.grant_once"() <{constant_value = 1024 : i64}> {dfg_id = 2 : i32} : () -> !neura.data<i64, i1>
      %62 = neura.phi_start %61, %arg2 {dfg_id = 24 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%62 : !neura.data<i64, i1>) {dfg_id = 40 : i32}
    }) {dfg_id = 23 : i32, latency = 1 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 2 : i32, x = 2 : i32, y = 1 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %3 = "neura.data_mov"(%2) {dfg_id = 39 : i32, mapping_locs = [{id = 192 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}, {id = 192 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}, {id = 192 : i32, index_per_ii = 4 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 4 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %4 = "neura.data_mov"(%2) {dfg_id = 38 : i32, mapping_locs = [{id = 20 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %5 = neura.reserve {dfg_id = 3 : i32} : !neura.data<i64, i1>
    %6 = "neura.fused_op"(%5) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %61 = "neura.grant_once"() <{constant_value = 1 : i64}> {dfg_id = 4 : i32} : () -> !neura.data<i64, i1>
      %62 = neura.phi_start %61, %arg2 {dfg_id = 26 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%62 : !neura.data<i64, i1>) {dfg_id = 43 : i32}
    }) {dfg_id = 25 : i32, latency = 1 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 2 : i32, y = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %7 = "neura.data_mov"(%6) {dfg_id = 42 : i32, mapping_locs = [{id = 321 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 321 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}, {id = 321 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %8 = "neura.data_mov"(%6) {dfg_id = 41 : i32, mapping_locs = [{id = 31 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %9 = neura.reserve {dfg_id = 5 : i32} : !neura.data<i32, i1>
    %10 = neura.reserve {dfg_id = 6 : i32} : !neura.data<!llvm.ptr, i1>
    %11 = neura.reserve {dfg_id = 7 : i32} : !neura.data<i32, i1>
    %12 = neura.reserve {dfg_id = 8 : i32} : !neura.data<i32, i1>
    %13 = neura.reserve {dfg_id = 9 : i32} : !neura.data<!llvm.ptr, i1>
    %14 = neura.reserve {dfg_id = 10 : i32} : !neura.data<i64, i1>
    %15 = "neura.data_mov"(%0) {dfg_id = 22 : i32, mapping_locs = [{id = 288 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16:2 = "neura.fused_op"(%15, %14, %8) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %61 = neura.phi_start %arg2, %arg3 {dfg_id = 11 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %62 = "neura.add"(%61, %arg4) {dfg_id = 27 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%61, %62 : !neura.data<i64, i1>, !neura.data<i64, i1>) {dfg_id = 44 : i32}
    }) {dfg_id = 54 : i32, latency = 1 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 2 : i32, x = 1 : i32, y = 2 : i32}]} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %17 = "neura.data_mov"(%16#0) {dfg_id = 60 : i32, mapping_locs = [{id = 29 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 2 : i32}, {id = 14 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 3 : i32}, {id = 18 : i32, index_per_ii = 4 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 4 : i32}, {id = 23 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %18 = "neura.data_mov"(%16#1) {dfg_id = 62 : i32, mapping_locs = [{id = 288 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}, {id = 28 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %19 = "neura.data_mov"(%16#1) {dfg_id = 61 : i32, mapping_locs = [{id = 28 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %20:2 = "neura.fused_op"(%19, %4) <{frequency = 2 : i64, pattern_id = 2 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %61 = "neura.icmp"(%arg2, %arg3) <{cmpType = "eq"}> {dfg_id = 12 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %62 = neura.grant_predicate %61, %61 {dfg_id = 28 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%61, %62 : !neura.data<i1, i1>, !neura.data<i1, i1>) {dfg_id = 45 : i32}
    }) {dfg_id = 63 : i32, latency = 1 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 3 : i32, x = 2 : i32, y = 2 : i32}]} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %21 = "neura.data_mov"(%20#0) {dfg_id = 64 : i32, mapping_locs = [{id = 320 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %22 = "neura.data_mov"(%20#1) {dfg_id = 65 : i32, mapping_locs = [{id = 34 : i32, index_per_ii = 3 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 3 : i32}, {id = 448 : i32, index_per_ii = 4 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 4 : i32}, {id = 448 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 5 : i32}, {id = 448 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 6 : i32}, {id = 448 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 7 : i32}, {id = 448 : i32, index_per_ii = 3 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 8 : i32}, {id = 448 : i32, index_per_ii = 4 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 9 : i32}, {id = 448 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 10 : i32}, {id = 448 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 11 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %23:3 = "neura.fused_op"(%21, %18, %7) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:not->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %61 = "neura.not"(%arg2) {dfg_id = 13 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %62 = neura.grant_predicate %arg3, %61 {dfg_id = 30 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %63 = neura.grant_predicate %arg4, %61 {dfg_id = 29 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%61, %62, %63 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) {dfg_id = 46 : i32}
    }) {dfg_id = 66 : i32, latency = 1 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 4 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 4 : i32, x = 2 : i32, y = 2 : i32}]} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %24 = "neura.data_mov"(%23#0) {dfg_id = 73 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 4 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 4 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %25 = "neura.data_mov"(%23#0) {dfg_id = 72 : i32, mapping_locs = [{id = 320 : i32, index_per_ii = 4 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 4 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %26 = "neura.data_mov"(%23#0) {dfg_id = 71 : i32, mapping_locs = [{id = 321 : i32, index_per_ii = 4 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 4 : i32}, {id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %27 = "neura.data_mov"(%23#0) {dfg_id = 70 : i32, mapping_locs = [{id = 31 : i32, index_per_ii = 4 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 4 : i32}, {id = 29 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}, {id = 160 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 6 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %28 = "neura.data_mov"(%23#0) {dfg_id = 69 : i32, mapping_locs = [{id = 322 : i32, index_per_ii = 4 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 4 : i32}, {id = 31 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}, {id = 289 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 6 : i32}, {id = 289 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 7 : i32}, {id = 289 : i32, index_per_ii = 3 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 8 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %29 = "neura.data_mov"(%23#0) {dfg_id = 68 : i32, mapping_locs = [{id = 34 : i32, index_per_ii = 4 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 4 : i32}, {id = 43 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}, {id = 42 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 6 : i32}, {id = 290 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 7 : i32}, {id = 290 : i32, index_per_ii = 3 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 8 : i32}, {id = 290 : i32, index_per_ii = 4 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 9 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %30 = "neura.data_mov"(%23#1) {dfg_id = 74 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31 = "neura.data_mov"(%23#2) {dfg_id = 75 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32:2 = "neura.fused_op"(%9, %29) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i1, i1>):
      %61 = "neura.grant_once"() <{constant_value = 1 : i32}> {dfg_id = 14 : i32} : () -> !neura.data<i32, i1>
      %62 = neura.phi_start %61, %arg2 {dfg_id = 31 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %63 = neura.grant_predicate %62, %arg3 {dfg_id = 47 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%62, %63 : !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 55 : i32}
    }) {dfg_id = 76 : i32, latency = 1 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 10 : i32, x = 1 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %33 = "neura.data_mov"(%32#0) {dfg_id = 84 : i32, mapping_locs = [{id = 288 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 10 : i32}, {id = 29 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 11 : i32}, {id = 160 : i32, index_per_ii = 2 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 12 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %34 = "neura.data_mov"(%32#1) {dfg_id = 85 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %35:2 = "neura.fused_op"(%10, %28) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>):
      %61 = "neura.grant_once"() <{constant_value = "%arg1"}> {dfg_id = 15 : i32} : () -> !neura.data<!llvm.ptr, i1>
      %62 = neura.phi_start %61, %arg2 {dfg_id = 32 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %63 = neura.grant_predicate %62, %arg3 {dfg_id = 48 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%62, %63 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) {dfg_id = 56 : i32}
    }) {dfg_id = 77 : i32, latency = 1 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 4 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 9 : i32, x = 1 : i32, y = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %36 = "neura.data_mov"(%35#0) {dfg_id = 86 : i32, mapping_locs = [{id = 29 : i32, index_per_ii = 4 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 9 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = "neura.data_mov"(%35#1) {dfg_id = 87 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %38:2 = "neura.fused_op"(%11, %27) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i1, i1>):
      %61 = "neura.grant_once"() <{constant_value = 1023 : i32}> {dfg_id = 16 : i32} : () -> !neura.data<i32, i1>
      %62 = neura.phi_start %61, %arg2 {dfg_id = 33 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %63 = neura.grant_predicate %62, %arg3 {dfg_id = 49 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%62, %63 : !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 57 : i32}
    }) {dfg_id = 78 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 7 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %39 = "neura.data_mov"(%38#0) {dfg_id = 88 : i32, mapping_locs = [{id = 14 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 7 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %40 = "neura.data_mov"(%38#1) {dfg_id = 89 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %41:2 = "neura.fused_op"(%12, %26) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i1, i1>):
      %61 = "neura.grant_once"() <{constant_value = 4 : i32}> {dfg_id = 17 : i32} : () -> !neura.data<i32, i1>
      %62 = neura.phi_start %61, %arg2 {dfg_id = 34 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %63 = neura.grant_predicate %62, %arg3 {dfg_id = 50 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%62, %63 : !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 58 : i32}
    }) {dfg_id = 79 : i32, latency = 1 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 6 : i32, x = 2 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i1, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
    %42 = "neura.data_mov"(%41#0) {dfg_id = 90 : i32, mapping_locs = [{id = 18 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 6 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %43 = "neura.data_mov"(%41#1) {dfg_id = 91 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %44:2 = "neura.fused_op"(%13, %25) <{frequency = 6 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:grant_once->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>):
      %61 = "neura.grant_once"() <{constant_value = "%arg0"}> {dfg_id = 18 : i32} : () -> !neura.data<!llvm.ptr, i1>
      %62 = neura.phi_start %61, %arg2 {dfg_id = 35 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %63 = neura.grant_predicate %62, %arg3 {dfg_id = 51 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%62, %63 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) {dfg_id = 59 : i32}
    }) {dfg_id = 80 : i32, latency = 1 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 5 : i32, x = 2 : i32, y = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %45 = "neura.data_mov"(%44#0) {dfg_id = 92 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.data_mov"(%44#1) {dfg_id = 93 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %47 = "neura.fused_op"(%45, %17) <{frequency = 2 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %61 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> {dfg_id = 19 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %62 = "neura.load"(%61) {dfg_id = 36 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%62 : !neura.data<i32, i1>) {dfg_id = 52 : i32}
    }) {dfg_id = 99 : i32, latency = 1 : i32, mapping_locs = [{id = 11 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 6 : i32, x = 3 : i32, y = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<i32, i1>
    %48 = "neura.data_mov"(%47) {dfg_id = 101 : i32, mapping_locs = [{id = 36 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 6 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %49 = "neura.shl"(%48, %42) {dfg_id = 102 : i32, latency = 1 : i32, mapping_locs = [{id = 7 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 7 : i32, x = 3 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %50 = "neura.data_mov"(%49) {dfg_id = 103 : i32, mapping_locs = [{id = 21 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 7 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %51 = "neura.div"(%50, %39) {dfg_id = 104 : i32, latency = 1 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 3 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 8 : i32, x = 2 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %52 = "neura.data_mov"(%51) {dfg_id = 105 : i32, mapping_locs = [{id = 193 : i32, index_per_ii = 3 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 8 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %53 = neura.sext %52 {dfg_id = 106 : i32, latency = 1 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 4 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 9 : i32, x = 2 : i32, y = 1 : i32}]} : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %54 = "neura.data_mov"(%53) {dfg_id = 107 : i32, mapping_locs = [{id = 17 : i32, index_per_ii = 4 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 9 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55:2 = "neura.fused_op"(%36, %54) <{frequency = 2 : i64, pattern_id = 0 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i64, i1>):
      %61 = "neura.gep"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> {dfg_id = 20 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %62 = "neura.load"(%61) {dfg_id = 37 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%61, %62 : !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>) {dfg_id = 53 : i32}
    }) {dfg_id = 108 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 10 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>)
    %56 = "neura.data_mov"(%55#0) {dfg_id = 109 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 10 : i32}, {id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 11 : i32}, {id = 32 : i32, index_per_ii = 2 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 12 : i32}, {id = 32 : i32, index_per_ii = 3 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 13 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %57 = "neura.data_mov"(%55#1) {dfg_id = 110 : i32, mapping_locs = [{id = 161 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 10 : i32}, {id = 161 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 11 : i32}, {id = 161 : i32, index_per_ii = 2 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 12 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %58 = "neura.add"(%57, %33) {dfg_id = 111 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 3 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 13 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %59 = "neura.data_mov"(%58) {dfg_id = 112 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 3 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 13 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%59, %56) {dfg_id = 113 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 4 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 14 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    neura.ctrl_mov %30 -> %14 {dfg_id = 82 : i32, latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %46 -> %13 {dfg_id = 100 : i32, latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %43 -> %12 {dfg_id = 98 : i32, latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %40 -> %11 {dfg_id = 97 : i32, latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %37 -> %10 {dfg_id = 96 : i32, latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %34 -> %9 {dfg_id = 95 : i32, latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %31 -> %5 {dfg_id = 83 : i32, latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %60 = neura.grant_predicate %3, %24 {dfg_id = 81 : i32, latency = 1 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 5 : i32, x = 2 : i32, y = 1 : i32}]} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %60 -> %1 {dfg_id = 94 : i32, latency = 1 : i32, mapping_locs = [{id = 192 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 5 : i32}, {id = 192 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 6 : i32}]} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %22 : !neura.data<i1, i1> {dfg_id = 67 : i32, latency = 1 : i32, mapping_locs = [{id = 14 : i32, index_per_ii = 2 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 12 : i32, x = 2 : i32, y = 3 : i32}]}
    neura.yield {dfg_id = 21 : i32, latency = 1 : i32}
  }
}

