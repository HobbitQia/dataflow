module {
  func.func @conv2d_1(%arg0: memref<4096x576xi32>, %arg1: memref<576xi32>, %arg2: memref<4096xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg3: memref<4096xi32>, %arg4: memref<4096x576xi32>, %arg5: memref<576xi32>, %arg6: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 1 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 5 : i32, y_tiles = 5 : i32}} {
      ^bb0(%arg7: memref<4096xi32>, %arg8: memref<4096x576xi32>, %arg9: memref<576xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 11 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %10 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %11 = neura.load_indexed [%10 : !neura.data<index, i1>]  {dfg_id = 4 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%10, %11 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 10 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 12 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 2 : i32, y = 2 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 6 : i32, mapping_locs = [{id = 41 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 56 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}, {id = 54 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 2 : i32}, {id = 352 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) {dfg_id = 5 : i32, mapping_locs = [{id = 40 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#1) {dfg_id = 7 : i32, mapping_locs = [{id = 38 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 36 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}, {id = 192 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%4) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:counter->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %10 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %11 = neura.load_indexed [%arg10, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 9 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          %12 = neura.load_indexed [%10 : !neura.data<index, i1>]  {dfg_id = 8 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          %13 = "neura.mul"(%11, %12) {dfg_id = 12 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%13 : !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 11 : i32, latency = 2 : i32, mapping_locs = [{id = 7 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 1 : i32, x = 2 : i32, y = 1 : i32}, {id = 7 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 2 : i32, x = 2 : i32, y = 1 : i32}]} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) {dfg_id = 13 : i32, mapping_locs = [{id = 20 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.add"(%5, %7) {dfg_id = 15 : i32, latency = 1 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) {dfg_id = 16 : i32, mapping_locs = [{id = 19 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%3 : !neura.data<index, i1>]  {dfg_id = 17 : i32, latency = 1 : i32, mapping_locs = [{id = 11 : i32, index_per_ii = 0 : i32, invalid_iterations = 4 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 2 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 3 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg6 : memref<4096xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @relu(%arg0: memref<4096xi32>, %arg1: memref<4096xi32>) attributes {latency = 1 : i32} {
    %c0_i32 = arith.constant {latency = 1 : i32} 0 : i32
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<4096xi32>) dependency_write_in(%arg1 : memref<4096xi32>) value_inputs(%c0_i32 : i32) [original_read_memrefs(%arg0 : memref<4096xi32>), original_write_memrefs(%arg1 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096xi32>, i32) -> (memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg2: memref<4096xi32>, %arg3: memref<4096xi32>, %arg4: i32):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      neura.kernel inputs(%arg2, %arg4, %arg3 : memref<4096xi32>, i32, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 1 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 5 : i32, y_tiles = 5 : i32}} {
      ^bb0(%arg5: memref<4096xi32>, %arg6: i32, %arg7: memref<4096xi32>):
        %1 = "neura.constant"() <{value = "%input1"}> {dfg_id = 0 : i32, latency = 1 : i32, mapping_locs = [{id = 21 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 4 : i32}]} : () -> !neura.data<i32, i1>
        %2:2 = "neura.fused_op"() <{frequency = 11 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %11 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", dfg_id = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 5 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%11, %12 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 9 : i32}
        }) {dfg_id = 2 : i32, latency = 1 : i32, mapping_locs = [{id = 12 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 2 : i32, y = 2 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 6 : i32, mapping_locs = [{id = 39 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 45 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}, {id = 60 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) {dfg_id = 8 : i32, mapping_locs = [{id = 41 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 56 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.data_mov"(%2#1) {dfg_id = 7 : i32, mapping_locs = [{id = 38 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.icmp"(%5) <{cmpType = "sgt"}> {dfg_id = 10 : i32, latency = 1 : i32, mapping_locs = [{id = 11 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 2 : i32}], rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
        %7 = "neura.data_mov"(%6) {dfg_id = 11 : i32, mapping_locs = [{id = 37 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
        %8 = "neura.data_mov"(%1) {dfg_id = 4 : i32, mapping_locs = [{id = 71 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.sel"(%7, %4, %8) {dfg_id = 12 : i32, latency = 1 : i32, mapping_locs = [{id = 16 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 2 : i32, x = 1 : i32, y = 3 : i32}]} : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 13 : i32, mapping_locs = [{id = 53 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%3 : !neura.data<index, i1>]  {dfg_id = 14 : i32, latency = 1 : i32, mapping_locs = [{id = 17 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "tile", time_step = 3 : i32, x = 2 : i32, y = 3 : i32}], rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 3 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<4096xi32>) writes(%arg3 : memref<4096xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @conv2d_2(%arg0: memref<4096x576xi32>, %arg1: memref<576xi32>, %arg2: memref<4096xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>, memref<4096xi32>) {
    ^bb0(%arg3: memref<4096xi32>, %arg4: memref<4096x576xi32>, %arg5: memref<576xi32>, %arg6: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 576 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 1 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 5 : i32, y_tiles = 5 : i32}} {
      ^bb0(%arg7: memref<4096xi32>, %arg8: memref<4096x576xi32>, %arg9: memref<576xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 11 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %10 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %11 = neura.load_indexed [%10 : !neura.data<index, i1>]  {dfg_id = 4 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%10, %11 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 10 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 12 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 2 : i32, y = 2 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 6 : i32, mapping_locs = [{id = 41 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 56 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}, {id = 54 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 2 : i32}, {id = 352 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) {dfg_id = 5 : i32, mapping_locs = [{id = 40 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#1) {dfg_id = 7 : i32, mapping_locs = [{id = 38 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 36 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}, {id = 192 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%4) <{frequency = 4 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:counter->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %10 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 576 : index} : !neura.data<index, i1>
          %11 = neura.load_indexed [%arg10, %10 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 9 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          %12 = neura.load_indexed [%10 : !neura.data<index, i1>]  {dfg_id = 8 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          %13 = "neura.mul"(%11, %12) {dfg_id = 12 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%13 : !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 11 : i32, latency = 2 : i32, mapping_locs = [{id = 7 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 1 : i32, x = 2 : i32, y = 1 : i32}, {id = 7 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 2 : i32, x = 2 : i32, y = 1 : i32}]} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        %7 = "neura.data_mov"(%6) {dfg_id = 13 : i32, mapping_locs = [{id = 20 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.add"(%5, %7) {dfg_id = 15 : i32, latency = 1 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) {dfg_id = 16 : i32, mapping_locs = [{id = 19 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %9 to [%3 : !neura.data<index, i1>]  {dfg_id = 17 : i32, latency = 1 : i32, mapping_locs = [{id = 11 : i32, index_per_ii = 0 : i32, invalid_iterations = 4 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 2 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 3 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<4096xi32>, memref<4096x576xi32>, memref<576xi32>) writes(%arg6 : memref<4096xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @add_residual(%arg0: memref<4096xi32>, %arg1: memref<4096xi32>, %arg2: memref<4096xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<4096xi32>, memref<4096xi32>) dependency_write_in(%arg2 : memref<4096xi32>) [original_read_memrefs(%arg0, %arg1 : memref<4096xi32>, memref<4096xi32>), original_write_memrefs(%arg2 : memref<4096xi32>)] {latency = 1 : i32} : (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) -> (memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) {
    ^bb0(%arg3: memref<4096xi32>, %arg4: memref<4096xi32>, %arg5: memref<4096xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<4096xi32>, memref<4096xi32>, memref<4096xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 1 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 5 : i32, y_tiles = 5 : i32}} {
      ^bb0(%arg6: memref<4096xi32>, %arg7: memref<4096xi32>, %arg8: memref<4096xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 11 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %9 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 4096 : index} : !neura.data<index, i1>
          %10 = neura.load_indexed [%9 : !neura.data<index, i1>]  {dfg_id = 3 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%9, %10 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 7 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 12 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 2 : i32, y = 2 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %2 = "neura.data_mov"(%1#0) {dfg_id = 5 : i32, mapping_locs = [{id = 41 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 56 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}, {id = 54 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#0) {dfg_id = 4 : i32, mapping_locs = [{id = 40 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%1#1) {dfg_id = 6 : i32, mapping_locs = [{id = 38 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 36 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = neura.load_indexed [%3 : !neura.data<index, i1>]  {dfg_id = 8 : i32, latency = 1 : i32, lhs_value = "%input1", mapping_locs = [{id = 7 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 1 : i32, x = 2 : i32, y = 1 : i32}]} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%5) {dfg_id = 9 : i32, mapping_locs = [{id = 20 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.add"(%4, %6) {dfg_id = 10 : i32, latency = 1 : i32, mapping_locs = [{id = 6 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 2 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%7) {dfg_id = 11 : i32, mapping_locs = [{id = 19 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%2 : !neura.data<index, i1>]  {dfg_id = 12 : i32, latency = 1 : i32, mapping_locs = [{id = 11 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 2 : i32}], rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 2 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<4096xi32>, memref<4096xi32>) writes(%arg5 : memref<4096xi32>)
    }
    return {latency = 1 : i32}
  }
}

