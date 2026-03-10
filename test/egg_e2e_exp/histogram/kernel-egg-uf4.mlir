module attributes {dlti.dl_spec = #dlti.dl_spec<i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  func.func @_Z6kernelPiS_(%arg0: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, mapping_info = {compiled_ii = 3 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 3 : i32, res_mii = 3 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, unsafe_fp_math = false, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = 0 : i64}> {dfg_id = 0 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 0 : i32, y = 1 : i32}]} : () -> !neura.data<i64, i1>
    %1 = neura.reserve {dfg_id = 1 : i32} : !neura.data<i64, i1>
    %2 = "neura.data_mov"(%0) {dfg_id = 19 : i32, mapping_locs = [{id = 128 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %3 = neura.phi_start %2, %1 {dfg_id = 36 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 0 : i32, y = 1 : i32}]} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %4 = "neura.data_mov"(%3) {dfg_id = 53 : i32, mapping_locs = [{id = 130 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 1 : i32}, {id = 12 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %5 = "neura.fused_op"(%4) <{frequency = 1 : i64, pattern_id = 7 : i64, pattern_name = "load_gep"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %71 = "neura.gep"(%arg2) <{operandSegmentSizes = array<i32: 0, 1>}> {dfg_id = 2 : i32, lhs_value = "%arg0"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %72 = "neura.load"(%71) {dfg_id = 20 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%72 : !neura.data<i32, i1>) {dfg_id = 37 : i32}
    }) {dfg_id = 59 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 0 : i32, y = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i32, i1>
    %6 = "neura.data_mov"(%5) {dfg_id = 65 : i32, mapping_locs = [{id = 256 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %7 = "neura.data_mov"(%3) {dfg_id = 54 : i32, mapping_locs = [{id = 11 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %8 = "neura.fused_op"(%7) <{frequency = 3 : i64, pattern_id = 7 : i64, pattern_name = "gep_or"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %71 = "neura.or"(%arg2) {dfg_id = 3 : i32, rhs_value = 3 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
      %72 = "neura.gep"(%71) <{operandSegmentSizes = array<i32: 0, 1>}> {dfg_id = 21 : i32, lhs_value = "%arg0"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>) {dfg_id = 38 : i32}
    }) {dfg_id = 60 : i32, mapping_locs = [{id = 0 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 2 : i32, x = 0 : i32, y = 0 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %9 = "neura.data_mov"(%8) {dfg_id = 66 : i32, mapping_locs = [{id = 0 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %10 = "neura.data_mov"(%3) {dfg_id = 55 : i32, mapping_locs = [{id = 12 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %11 = "neura.fused_op"(%10) <{frequency = 3 : i64, pattern_id = 7 : i64, pattern_name = "gep_or"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %71 = "neura.or"(%arg2) {dfg_id = 4 : i32, rhs_value = 2 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
      %72 = "neura.gep"(%71) <{operandSegmentSizes = array<i32: 0, 1>}> {dfg_id = 22 : i32, lhs_value = "%arg0"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>) {dfg_id = 39 : i32}
    }) {dfg_id = 61 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 2 : i32, x = 0 : i32, y = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %12 = "neura.data_mov"(%11) {dfg_id = 67 : i32, mapping_locs = [{id = 24 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %13 = "neura.data_mov"(%3) {dfg_id = 56 : i32, mapping_locs = [{id = 129 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 11 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = "neura.fused_op"(%13) <{frequency = 3 : i64, pattern_id = 7 : i64, pattern_name = "gep_or"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %71 = "neura.or"(%arg2) {dfg_id = 5 : i32, rhs_value = 1 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
      %72 = "neura.gep"(%71) <{operandSegmentSizes = array<i32: 0, 1>}> {dfg_id = 23 : i32, lhs_value = "%arg0"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>) {dfg_id = 40 : i32}
    }) {dfg_id = 62 : i32, mapping_locs = [{id = 0 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 0 : i32, y = 0 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %15 = "neura.data_mov"(%14) {dfg_id = 68 : i32, mapping_locs = [{id = 0 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %16 = "neura.fused_op"(%6) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "add_mul"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>):
      %71 = "neura.mul"(%arg2) {dfg_id = 6 : i32, rhs_value = 5 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      %72 = "neura.add"(%71) {dfg_id = 24 : i32, rhs_value = -5 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%72 : !neura.data<i32, i1>) {dfg_id = 41 : i32}
    }) {dfg_id = 72 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 4 : i32, x = 0 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %17 = "neura.data_mov"(%16) {dfg_id = 78 : i32, mapping_locs = [{id = 24 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 4 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %18 = "neura.div"(%17) {dfg_id = 85 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 5 : i32, x = 1 : i32, y = 2 : i32}], rhs_value = 18 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %19 = "neura.data_mov"(%18) {dfg_id = 90 : i32, mapping_locs = [{id = 28 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %20 = "neura.fused_op"(%19) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "gep_sext"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>):
      %71 = neura.sext %arg2 {dfg_id = 7 : i32} : !neura.data<i32, i1> -> !neura.data<i64, i1>
      %72 = "neura.gep"(%71) <{operandSegmentSizes = array<i32: 0, 1>}> {dfg_id = 25 : i32, lhs_value = "%arg1"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>) {dfg_id = 42 : i32}
    }) {dfg_id = 95 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 6 : i32, x = 2 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<!llvm.ptr, i1>
    %21 = "neura.data_mov"(%20) {dfg_id = 101 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 6 : i32}, {id = 192 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 7 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %22 = "neura.data_mov"(%20) {dfg_id = 100 : i32, mapping_locs = [{id = 320 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 6 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = "neura.fused_op"(%22) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "add_load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.load"(%arg2) {dfg_id = 8 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %72 = "neura.add"(%71) {dfg_id = 26 : i32, rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%72 : !neura.data<i32, i1>) {dfg_id = 43 : i32}
    }) {dfg_id = 105 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 7 : i32, x = 2 : i32, y = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %24 = "neura.data_mov"(%23) {dfg_id = 109 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 7 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%24, %21) {dfg_id = 116 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 2 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 8 : i32, x = 2 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %25 = "neura.load"(%15) {dfg_id = 75 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %26 = "neura.data_mov"(%25) {dfg_id = 81 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 4 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %27 = "neura.fused_op"(%26) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "add_mul"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>):
      %71 = "neura.mul"(%arg2) {dfg_id = 9 : i32, rhs_value = 5 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      %72 = "neura.add"(%71) {dfg_id = 27 : i32, rhs_value = -5 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%72 : !neura.data<i32, i1>) {dfg_id = 44 : i32}
    }) {dfg_id = 88 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 5 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %28 = "neura.data_mov"(%27) {dfg_id = 93 : i32, mapping_locs = [{id = 3 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %29 = "neura.div"(%28) {dfg_id = 98 : i32, mapping_locs = [{id = 2 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 6 : i32, x = 2 : i32, y = 0 : i32}], rhs_value = 18 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %30 = "neura.data_mov"(%29) {dfg_id = 104 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 6 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %31 = "neura.fused_op"(%30) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "gep_sext"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>):
      %71 = neura.sext %arg2 {dfg_id = 10 : i32} : !neura.data<i32, i1> -> !neura.data<i64, i1>
      %72 = "neura.gep"(%71) <{operandSegmentSizes = array<i32: 0, 1>}> {dfg_id = 28 : i32, lhs_value = "%arg1"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>) {dfg_id = 45 : i32}
    }) {dfg_id = 108 : i32, mapping_locs = [{id = 3 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 7 : i32, x = 3 : i32, y = 0 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<!llvm.ptr, i1>
    %32 = "neura.data_mov"(%31) {dfg_id = 115 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 7 : i32}, {id = 5 : i32, index_per_ii = 2 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 8 : i32}, {id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "link", time_step = 9 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = "neura.data_mov"(%31) {dfg_id = 114 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 7 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = "neura.fused_op"(%33) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "add_load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.load"(%arg2) {dfg_id = 11 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %72 = "neura.add"(%71) {dfg_id = 29 : i32, rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%72 : !neura.data<i32, i1>) {dfg_id = 46 : i32}
    }) {dfg_id = 119 : i32, mapping_locs = [{id = 7 : i32, index_per_ii = 2 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 8 : i32, x = 3 : i32, y = 1 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %35 = "neura.data_mov"(%34) {dfg_id = 122 : i32, mapping_locs = [{id = 21 : i32, index_per_ii = 2 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 8 : i32}, {id = 17 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "link", time_step = 9 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%35, %32) {dfg_id = 125 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 3 : i32, resource = "tile", time_step = 10 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %36 = "neura.load"(%12) {dfg_id = 74 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %37 = "neura.data_mov"(%36) {dfg_id = 80 : i32, mapping_locs = [{id = 288 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %38 = "neura.fused_op"(%37) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "add_mul"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>):
      %71 = "neura.mul"(%arg2) {dfg_id = 12 : i32, rhs_value = 5 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      %72 = "neura.add"(%71) {dfg_id = 30 : i32, rhs_value = -5 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%72 : !neura.data<i32, i1>) {dfg_id = 47 : i32}
    }) {dfg_id = 87 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %39 = "neura.data_mov"(%38) {dfg_id = 92 : i32, mapping_locs = [{id = 28 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 4 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %40 = "neura.div"(%39) {dfg_id = 97 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 5 : i32, x = 2 : i32, y = 2 : i32}], rhs_value = 18 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %41 = "neura.data_mov"(%40) {dfg_id = 103 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %42 = "neura.fused_op"(%41) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "gep_sext"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>):
      %71 = neura.sext %arg2 {dfg_id = 13 : i32} : !neura.data<i32, i1> -> !neura.data<i64, i1>
      %72 = "neura.gep"(%71) <{operandSegmentSizes = array<i32: 0, 1>}> {dfg_id = 31 : i32, lhs_value = "%arg1"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>) {dfg_id = 48 : i32}
    }) {dfg_id = 107 : i32, mapping_locs = [{id = 11 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 6 : i32, x = 3 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<!llvm.ptr, i1>
    %43 = "neura.data_mov"(%42) {dfg_id = 113 : i32, mapping_locs = [{id = 353 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 6 : i32}, {id = 353 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 7 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %44 = "neura.data_mov"(%42) {dfg_id = 112 : i32, mapping_locs = [{id = 352 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 6 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = "neura.fused_op"(%44) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "add_load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.load"(%arg2) {dfg_id = 14 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %72 = "neura.add"(%71) {dfg_id = 32 : i32, rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%72 : !neura.data<i32, i1>) {dfg_id = 49 : i32}
    }) {dfg_id = 118 : i32, mapping_locs = [{id = 11 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 7 : i32, x = 3 : i32, y = 2 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %46 = "neura.data_mov"(%45) {dfg_id = 121 : i32, mapping_locs = [{id = 352 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 7 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%46, %43) {dfg_id = 124 : i32, mapping_locs = [{id = 11 : i32, index_per_ii = 2 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 8 : i32, x = 3 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %47 = "neura.load"(%9) {dfg_id = 73 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %48 = "neura.data_mov"(%47) {dfg_id = 79 : i32, mapping_locs = [{id = 3 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %49 = "neura.fused_op"(%48) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "add_mul"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>):
      %71 = "neura.mul"(%arg2) {dfg_id = 15 : i32, rhs_value = 5 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      %72 = "neura.add"(%71) {dfg_id = 33 : i32, rhs_value = -5 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%72 : !neura.data<i32, i1>) {dfg_id = 50 : i32}
    }) {dfg_id = 86 : i32, mapping_locs = [{id = 2 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 4 : i32, x = 2 : i32, y = 0 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %50 = "neura.data_mov"(%49) {dfg_id = 91 : i32, mapping_locs = [{id = 64 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 4 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %51 = "neura.div"(%50) {dfg_id = 96 : i32, mapping_locs = [{id = 2 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 5 : i32, x = 2 : i32, y = 0 : i32}], rhs_value = 18 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %52 = "neura.data_mov"(%51) {dfg_id = 102 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 5 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %53 = "neura.fused_op"(%52) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "gep_sext"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>):
      %71 = neura.sext %arg2 {dfg_id = 16 : i32} : !neura.data<i32, i1> -> !neura.data<i64, i1>
      %72 = "neura.gep"(%71) <{operandSegmentSizes = array<i32: 0, 1>}> {dfg_id = 34 : i32, lhs_value = "%arg1"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%72 : !neura.data<!llvm.ptr, i1>) {dfg_id = 51 : i32}
    }) {dfg_id = 106 : i32, mapping_locs = [{id = 3 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 6 : i32, x = 3 : i32, y = 0 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<!llvm.ptr, i1>
    %54 = "neura.data_mov"(%53) {dfg_id = 111 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 6 : i32}, {id = 6 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 7 : i32}, {id = 9 : i32, index_per_ii = 2 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 8 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %55 = "neura.data_mov"(%53) {dfg_id = 110 : i32, mapping_locs = [{id = 9 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 6 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = "neura.fused_op"(%55) <{frequency = 4 : i64, pattern_id = 7 : i64, pattern_name = "add_load"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>):
      %71 = "neura.load"(%arg2) {dfg_id = 17 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      %72 = "neura.add"(%71) {dfg_id = 35 : i32, rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%72 : !neura.data<i32, i1>) {dfg_id = 52 : i32}
    }) {dfg_id = 117 : i32, mapping_locs = [{id = 7 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 7 : i32, x = 3 : i32, y = 1 : i32}]} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %57 = "neura.data_mov"(%56) {dfg_id = 120 : i32, mapping_locs = [{id = 224 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 7 : i32}, {id = 224 : i32, index_per_ii = 2 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 8 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%57, %54) {dfg_id = 123 : i32, mapping_locs = [{id = 7 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "tile", time_step = 9 : i32, x = 3 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %58 = "neura.data_mov"(%3) {dfg_id = 58 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = "neura.add"(%58) {dfg_id = 64 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 2 : i32, x = 1 : i32, y = 1 : i32}], rhs_value = 4 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = "neura.data_mov"(%3) {dfg_id = 57 : i32, mapping_locs = [{id = 128 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %61 = "neura.icmp"(%60) <{cmpType = "ult"}> {dfg_id = 63 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 2 : i32, x = 0 : i32, y = 1 : i32}], rhs_value = 16 : i64} : (!neura.data<i64, i1>) -> !neura.data<i1, i1>
    %62 = "neura.data_mov"(%61) {dfg_id = 70 : i32, mapping_locs = [{id = 128 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}, {id = 10 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}, {id = 14 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 4 : i32}, {id = 192 : i32, index_per_ii = 2 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 5 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %63 = "neura.not"(%62) {dfg_id = 76 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 6 : i32, x = 2 : i32, y = 1 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %64 = "neura.data_mov"(%59) {dfg_id = 71 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = "neura.data_mov"(%61) {dfg_id = 69 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 2 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %66 = neura.grant_predicate %64, %65 {dfg_id = 77 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 1 : i32}]} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %66 -> %1 {dfg_id = 84 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : !neura.data<i64, i1> !neura.data<i64, i1>
    %67 = "neura.data_mov"(%63) {dfg_id = 82 : i32, mapping_locs = [{id = 192 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 6 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %68 = "neura.data_mov"(%63) {dfg_id = 83 : i32, mapping_locs = [{id = 193 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 6 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %69 = neura.grant_predicate %67, %68 {dfg_id = 89 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 7 : i32, x = 2 : i32, y = 1 : i32}]} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %70 = "neura.data_mov"(%69) {dfg_id = 94 : i32, mapping_locs = [{id = 20 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 7 : i32}, {id = 34 : i32, index_per_ii = 2 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 8 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %70 : !neura.data<i1, i1> {dfg_id = 99 : i32, mapping_locs = [{id = 14 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "tile", time_step = 9 : i32, x = 2 : i32, y = 3 : i32}]}
    neura.yield {dfg_id = 18 : i32}
  }
}

