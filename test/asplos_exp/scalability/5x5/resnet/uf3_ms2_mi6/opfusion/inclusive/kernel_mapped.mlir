module {
  func.func @conv2d_1(%arg0: memref<4096x576xi32>, %arg1: memref<576xi32>, %arg2: memref<4096xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg3: memref<4096xi32>, %arg4: memref<4096x576xi32>, %arg5: memref<576xi32>, %arg6: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 3 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 5 : i32, y_tiles = 5 : i32}} {
      ^bb0(%arg7: memref<4096xi32>, %arg8: memref<4096x576xi32>, %arg9: memref<576xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:counter->fused_op:fused_op:counter->load_indexed->fused_op:load_indexed->mul->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add->fused_op:load_indexed->add"}> ({
          %9 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %10 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 1 : i32, lower_bound = 0 : index, step = 3 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %11 = neura.load_indexed [%10 : !neura.data<index, i1>]  {dfg_id = 10 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          %12 = neura.load_indexed [%9, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 9 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          %13 = "neura.mul"(%12, %11) {dfg_id = 21 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %14 = "neura.add"(%10) {dfg_id = 8 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %15 = neura.load_indexed [%9, %14 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 20 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          %16 = neura.load_indexed [%14 : !neura.data<index, i1>]  {dfg_id = 19 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          %17 = "neura.mul"(%15, %16) {dfg_id = 26 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %18 = neura.load_indexed [%9 : !neura.data<index, i1>]  {dfg_id = 6 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.add"(%18, %17) {dfg_id = 29 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%10) {dfg_id = 7 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = neura.load_indexed [%9, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 18 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = neura.load_indexed [%20 : !neura.data<index, i1>]  {dfg_id = 17 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%21, %22) {dfg_id = 25 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = neura.load_indexed [%9 : !neura.data<index, i1>]  {dfg_id = 5 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.add"(%24, %23) {dfg_id = 28 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = neura.load_indexed [%9 : !neura.data<index, i1>]  {dfg_id = 4 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.add"(%26, %13) {dfg_id = 27 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%9, %19, %25, %27 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 30 : i32}
        }) {dfg_id = 2 : i32, latency = 2 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 3 : i32, y = 2 : i32}, {id = 13 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 3 : i32, y = 2 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 13 : i32, mapping_locs = [{id = 417 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 42 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) {dfg_id = 12 : i32, mapping_locs = [{id = 416 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 44 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) {dfg_id = 11 : i32, mapping_locs = [{id = 418 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 1 : i32}, {id = 43 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#1) {dfg_id = 14 : i32, mapping_locs = [{id = 44 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 256 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%2#2) {dfg_id = 15 : i32, mapping_locs = [{id = 42 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 384 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2#3) {dfg_id = 16 : i32, mapping_locs = [{id = 43 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 448 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%5 : !neura.data<index, i1>]  {dfg_id = 24 : i32, latency = 1 : i32, mapping_locs = [{id = 14 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 4 : i32, y = 2 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %6 to [%4 : !neura.data<index, i1>]  {dfg_id = 22 : i32, latency = 1 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 3 : i32, y = 1 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %7 to [%3 : !neura.data<index, i1>]  {dfg_id = 23 : i32, latency = 1 : i32, mapping_locs = [{id = 12 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 2 : i32, y = 2 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 3 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg6 : memref<4096xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @relu(%arg0: memref<4096xi32>, %arg1: memref<4096xi32>) attributes {latency = 1 : i32} {
    %c4095 = arith.constant {latency = 1 : i32} 4095 : index
    %c0_i32 = arith.constant {latency = 1 : i32} 0 : i32
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<4096xi32>) dependency_write_in(%arg1 : memref<4096xi32>) value_inputs(%c0_i32 : i32) [original_read_memrefs(%arg0 : memref<4096xi32>), original_write_memrefs(%arg1 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096xi32>, i32) -> (memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg2: memref<4096xi32>, %arg3: memref<4096xi32>, %arg4: i32):
      %3 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 3 : index, upper_bound = 4095 : index} : index
      neura.kernel inputs(%arg2, %arg4, %arg3 : memref<4096xi32>, i32, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 5 : i32, y_tiles = 5 : i32}} {
      ^bb0(%arg5: memref<4096xi32>, %arg6: i32, %arg7: memref<4096xi32>):
        %4:4 = "neura.fused_op"() <{frequency = 6 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %19 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 3 : index, upper_bound = 4095 : index} : !neura.data<index, i1>
          %20 = neura.load_indexed [%19 : !neura.data<index, i1>]  {dfg_id = 8 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %21 = "neura.add"(%19) {dfg_id = 7 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21 : !neura.data<index, i1>]  {dfg_id = 17 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%19, %20, %21, %22 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 22 : i32}
        }) {dfg_id = 1 : i32, latency = 2 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 0 : i32, y = 3 : i32}, {id = 15 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 0 : i32, y = 3 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = "neura.data_mov"(%4#0) {dfg_id = 10 : i32, mapping_locs = [{id = 481 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 49 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}, {id = 54 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%4#0) {dfg_id = 9 : i32, mapping_locs = [{id = 480 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 50 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}, {id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%4#1) {dfg_id = 11 : i32, mapping_locs = [{id = 50 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%4#2) {dfg_id = 12 : i32, mapping_locs = [{id = 51 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 67 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}, {id = 71 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%4#3) {dfg_id = 13 : i32, mapping_locs = [{id = 49 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 54 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10:2 = "neura.fused_op"(%7) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "constant->fused_op:icmp->sel"}> ({
        ^bb0(%arg8: !neura.data<i32, i1>):
          %19 = "neura.constant"() <{value = "%input1"}> {dfg_id = 2 : i32} : () -> !neura.data<i32, i1>
          %20 = "neura.icmp"(%arg8) <{cmpType = "sgt"}> {dfg_id = 3 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %21 = "neura.sel"(%20, %arg8, %19) {dfg_id = 14 : i32} : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19, %21 : !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 19 : i32}
        }) {dfg_id = 18 : i32, latency = 1 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 2 : i32, x = 0 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>) -> (!neura.data<i32, i1>, !neura.data<i32, i1>)
        %11 = "neura.data_mov"(%10#0) {dfg_id = 24 : i32, mapping_locs = [{id = 31 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%10#0) {dfg_id = 23 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}, {id = 160 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.data_mov"(%10#1) {dfg_id = 25 : i32, mapping_locs = [{id = 320 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}, {id = 31 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14:2 = "neura.fused_op"(%6, %12) <{frequency = 2 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:icmp->sel"}> ({
        ^bb0(%arg8: !neura.data<index, i1>, %arg9: !neura.data<i32, i1>):
          %19 = "neura.add"(%arg8) {dfg_id = 4 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %20 = neura.load_indexed [%19 : !neura.data<index, i1>]  {dfg_id = 15 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %21 = "neura.icmp"(%20) <{cmpType = "sgt"}> {dfg_id = 20 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %22 = "neura.sel"(%21, %20, %arg9) {dfg_id = 26 : i32} : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19, %22 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 30 : i32}
        }) {dfg_id = 27 : i32, latency = 2 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 0 : i32, y = 1 : i32}, {id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 5 : i32, x = 0 : i32, y = 1 : i32}]} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15 = "neura.data_mov"(%14#0) {dfg_id = 31 : i32, mapping_locs = [{id = 161 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 5 : i32}, {id = 14 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "link", time_step = 6 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %16 = "neura.data_mov"(%14#1) {dfg_id = 32 : i32, mapping_locs = [{id = 14 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 5 : i32}, {id = 0 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 6 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %17 = "neura.fused_op"(%9, %11) <{frequency = 3 : i64, pattern_id = 4 : i64, pattern_name = "icmp->sel"}> ({
        ^bb0(%arg8: !neura.data<i32, i1>, %arg9: !neura.data<i32, i1>):
          %19 = "neura.icmp"(%arg8) <{cmpType = "sgt"}> {dfg_id = 5 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
          %20 = "neura.sel"(%19, %arg8, %arg9) {dfg_id = 16 : i32} : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%20 : !neura.data<i32, i1>) {dfg_id = 21 : i32}
        }) {dfg_id = 28 : i32, latency = 1 : i32, mapping_locs = [{id = 11 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %18 = "neura.data_mov"(%17) {dfg_id = 33 : i32, mapping_locs = [{id = 37 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %13 to [%5 : !neura.data<index, i1>]  {dfg_id = 29 : i32, latency = 1 : i32, mapping_locs = [{id = 11 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 2 : i32}], rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %16 to [%15 : !neura.data<index, i1>]  {dfg_id = 34 : i32, latency = 1 : i32, mapping_locs = [{id = 0 : i32, index_per_ii = 1 : i32, invalid_iterations = 3 : i32, resource = "tile", time_step = 7 : i32, x = 0 : i32, y = 0 : i32}], rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %18 to [%8 : !neura.data<index, i1>]  {dfg_id = 35 : i32, latency = 1 : i32, mapping_locs = [{id = 16 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 3 : i32}], rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 6 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<4096xi32>) writes(%arg3 : memref<4096xi32>)
    }
    %0 = memref.load %dependency_read_out[%c4095] {latency = 1 : i32} : memref<4096xi32>
    %1 = arith.cmpi sgt, %0, %c0_i32 {latency = 1 : i32} : i32
    %2 = arith.select %1, %0, %c0_i32 {latency = 1 : i32} : i32
    memref.store %2, %dependency_write_out[%c4095] {latency = 1 : i32} : memref<4096xi32>
    return {latency = 1 : i32}
  }
  func.func @conv2d_2(%arg0: memref<4096x576xi32>, %arg1: memref<576xi32>, %arg2: memref<4096xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg3: memref<4096xi32>, %arg4: memref<4096x576xi32>, %arg5: memref<576xi32>, %arg6: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 3 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 5 : i32, y_tiles = 5 : i32}} {
      ^bb0(%arg7: memref<4096xi32>, %arg8: memref<4096x576xi32>, %arg9: memref<576xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:counter->fused_op:fused_op:counter->load_indexed->fused_op:load_indexed->mul->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->fused_op:mul->fused_op:load_indexed->add->fused_op:load_indexed->add"}> ({
          %9 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %10 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 1 : i32, lower_bound = 0 : index, step = 3 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %11 = neura.load_indexed [%10 : !neura.data<index, i1>]  {dfg_id = 10 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          %12 = neura.load_indexed [%9, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 9 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          %13 = "neura.mul"(%12, %11) {dfg_id = 21 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %14 = "neura.add"(%10) {dfg_id = 8 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %15 = neura.load_indexed [%9, %14 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 20 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          %16 = neura.load_indexed [%14 : !neura.data<index, i1>]  {dfg_id = 19 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          %17 = "neura.mul"(%15, %16) {dfg_id = 26 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %18 = neura.load_indexed [%9 : !neura.data<index, i1>]  {dfg_id = 6 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.add"(%18, %17) {dfg_id = 29 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%10) {dfg_id = 7 : i32, rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = neura.load_indexed [%9, %20 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 18 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          %22 = neura.load_indexed [%20 : !neura.data<index, i1>]  {dfg_id = 17 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          %23 = "neura.mul"(%21, %22) {dfg_id = 25 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = neura.load_indexed [%9 : !neura.data<index, i1>]  {dfg_id = 5 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %25 = "neura.add"(%24, %23) {dfg_id = 28 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %26 = neura.load_indexed [%9 : !neura.data<index, i1>]  {dfg_id = 4 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %27 = "neura.add"(%26, %13) {dfg_id = 27 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%9, %19, %25, %27 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 30 : i32}
        }) {dfg_id = 2 : i32, latency = 2 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 3 : i32, y = 2 : i32}, {id = 13 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 3 : i32, y = 2 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 13 : i32, mapping_locs = [{id = 417 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 42 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) {dfg_id = 12 : i32, mapping_locs = [{id = 416 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 44 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#0) {dfg_id = 11 : i32, mapping_locs = [{id = 418 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 2 : i32, resource = "register", time_step = 1 : i32}, {id = 43 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%2#1) {dfg_id = 14 : i32, mapping_locs = [{id = 44 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 256 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%2#2) {dfg_id = 15 : i32, mapping_locs = [{id = 42 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 384 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%2#3) {dfg_id = 16 : i32, mapping_locs = [{id = 43 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 448 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%5 : !neura.data<index, i1>]  {dfg_id = 24 : i32, latency = 1 : i32, mapping_locs = [{id = 14 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 4 : i32, y = 2 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %6 to [%4 : !neura.data<index, i1>]  {dfg_id = 22 : i32, latency = 1 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 3 : i32, y = 1 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %7 to [%3 : !neura.data<index, i1>]  {dfg_id = 23 : i32, latency = 1 : i32, mapping_locs = [{id = 12 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 2 : i32, y = 2 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 3 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg6 : memref<4096xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @add_residual(%arg0: memref<4096xi32>, %arg1: memref<4096xi32>, %arg2: memref<4096xi32>) attributes {latency = 1 : i32} {
    %c4095 = arith.constant {latency = 1 : i32} 4095 : index
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<4096xi32>, memref<4096xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg0, %arg1 : memref<4096xi32>, memref<4096xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg3: memref<4096xi32>, %arg4: memref<4096xi32>, %arg5: memref<4096xi32>):
      %3 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 3 : index, upper_bound = 4095 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 5 : i32, y_tiles = 5 : i32}} {
      ^bb0(%arg6: memref<4096xi32>, %arg7: memref<4096xi32>, %arg8: memref<4096xi32>):
        %4:3 = "neura.fused_op"() <{frequency = 2 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:counter->add->fused_op:load_indexed->fused_op:load_indexed->add"}> ({
          %17 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 3 : index, upper_bound = 4095 : index} : !neura.data<index, i1>
          %18 = "neura.add"(%17) {dfg_id = 7 : i32, rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {dfg_id = 16 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = neura.load_indexed [%18 : !neura.data<index, i1>]  {dfg_id = 15 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %21 = "neura.add"(%20, %19) {dfg_id = 22 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %18, %21 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 26 : i32}
        }) {dfg_id = 1 : i32, latency = 2 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 0 : i32, y = 3 : i32}, {id = 15 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 0 : i32, y = 3 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %5 = "neura.data_mov"(%4#0) {dfg_id = 10 : i32, mapping_locs = [{id = 50 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%4#0) {dfg_id = 9 : i32, mapping_locs = [{id = 481 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 50 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}, {id = 31 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%4#0) {dfg_id = 8 : i32, mapping_locs = [{id = 49 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 512 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%4#1) {dfg_id = 11 : i32, mapping_locs = [{id = 51 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 67 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}, {id = 71 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %9 = "neura.data_mov"(%4#2) {dfg_id = 12 : i32, mapping_locs = [{id = 480 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 49 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}, {id = 512 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.fused_op"(%7) <{frequency = 3 : i64, pattern_id = 12 : i64, pattern_name = "load_indexed->fused_op:load_indexed->add"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {dfg_id = 2 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          %18 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {dfg_id = 3 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.add"(%18, %17) {dfg_id = 13 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>) {dfg_id = 20 : i32}
        }) {dfg_id = 17 : i32, latency = 1 : i32, mapping_locs = [{id = 16 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%10) {dfg_id = 23 : i32, mapping_locs = [{id = 54 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %11 to [%6 : !neura.data<index, i1>]  {dfg_id = 27 : i32, latency = 1 : i32, mapping_locs = [{id = 11 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 2 : i32}], rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %9 to [%8 : !neura.data<index, i1>]  {dfg_id = 19 : i32, latency = 1 : i32, mapping_locs = [{id = 16 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 3 : i32}], rhs_value = "%input2"} : !neura.data<i32, i1>
        %12 = "neura.add"(%5) {dfg_id = 18 : i32, latency = 1 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 2 : i32, x = 0 : i32, y = 2 : i32}], rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %13 = "neura.data_mov"(%12) {dfg_id = 25 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %14 = "neura.fused_op"(%13) <{frequency = 3 : i64, pattern_id = 12 : i64, pattern_name = "load_indexed->fused_op:load_indexed->add"}> ({
        ^bb0(%arg9: !neura.data<index, i1>):
          %17 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {dfg_id = 4 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          %18 = neura.load_indexed [%arg9 : !neura.data<index, i1>]  {dfg_id = 5 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.add"(%18, %17) {dfg_id = 14 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%19 : !neura.data<i32, i1>) {dfg_id = 21 : i32}
        }) {dfg_id = 28 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 0 : i32, y = 1 : i32}]} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %15 = "neura.data_mov"(%14) {dfg_id = 29 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %16 = "neura.data_mov"(%12) {dfg_id = 24 : i32, mapping_locs = [{id = 320 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}, {id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        neura.store_indexed %15 to [%16 : !neura.data<index, i1>]  {dfg_id = 30 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 0 : i32, y = 1 : i32}], rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 6 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<4096xi32>, memref<4096xi32>) writes(%arg5 : memref<4096xi32>)
    }
    %0 = memref.load %dependency_read_out#0[%c4095] {latency = 1 : i32} : memref<4096xi32>
    %1 = memref.load %dependency_read_out#1[%c4095] {latency = 1 : i32} : memref<4096xi32>
    %2 = arith.addi %0, %1 {latency = 1 : i32} : i32
    memref.store %2, %dependency_write_out[%c4095] {latency = 1 : i32} : memref<4096xi32>
    return {latency = 1 : i32}
  }
}

