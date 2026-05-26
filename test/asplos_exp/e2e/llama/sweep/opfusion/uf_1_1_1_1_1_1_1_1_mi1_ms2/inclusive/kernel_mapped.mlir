module {
  func.func @qk_attention(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %13 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {dfg_id = 6 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%13, %14 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 8 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}, {id = 13 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 128 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) {dfg_id = 7 : i32, mapping_locs = [{id = 16 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#1) {dfg_id = 9 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 12 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6:2 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %13 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {dfg_id = 10 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%13, %14 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 15 : i32}
        }) {dfg_id = 3 : i32, latency = 1 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 3 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7 = "neura.data_mov"(%6#0) {dfg_id = 11 : i32, mapping_locs = [{id = 42 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%6#1) {dfg_id = 12 : i32, mapping_locs = [{id = 40 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 39 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = neura.load_indexed [%4, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 16 : i32, latency = 1 : i32, lhs_value = "%input2", mapping_locs = [{id = 9 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 2 : i32}]} : !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 18 : i32, mapping_locs = [{id = 27 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%8, %10, %5) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %13 = "neura.mul"(%arg10, %arg11) {dfg_id = 4 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %14 = "neura.add"(%arg12, %13) {dfg_id = 13 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>) {dfg_id = 17 : i32}
        }) {dfg_id = 19 : i32, latency = 1 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 2 : i32, x = 0 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) {dfg_id = 20 : i32, mapping_locs = [{id = 25 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%3 : !neura.data<index, i1>]  {dfg_id = 21 : i32, latency = 1 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 0 : i32, y = 1 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 5 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @softmax_exp(%arg0: memref<16xi32>, %arg1: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<16xi32>) dependency_write_in(%arg1 : memref<16xi32>) [original_read_memrefs(%arg0 : memref<16xi32>), original_write_memrefs(%arg1 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg2: memref<16xi32>, %arg3: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg2, %arg3 : memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 1 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg4: memref<16xi32>, %arg5: memref<16xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %6 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %7 = neura.load_indexed [%6 : !neura.data<index, i1>]  {dfg_id = 4 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%6, %7 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 8 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 0 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 0 : i32, y = 0 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %2 = "neura.data_mov"(%1#0) {dfg_id = 5 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 10 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#1) {dfg_id = 6 : i32, mapping_locs = [{id = 0 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %4 = "neura.fused_op"(%3) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg6: !neura.data<i32, i1>):
          %6 = "neura.mul"(%arg6, %arg6) {dfg_id = 2 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %7 = "neura.add"(%6) {dfg_id = 7 : i32, rhs_value = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%7 : !neura.data<i32, i1>) {dfg_id = 10 : i32}
        }) {dfg_id = 9 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.data_mov"(%4) {dfg_id = 11 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %5 to [%2 : !neura.data<index, i1>]  {dfg_id = 12 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 2 : i32, x = 1 : i32, y = 1 : i32}], rhs_value = "%input1"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 3 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg2 : memref<16xi32>) writes(%arg3 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @softmax_norm(%arg0: memref<16xi32>, %arg1: memref<1xi32>) attributes {latency = 1 : i32} {
    %c0 = arith.constant {latency = 1 : i32} 0 : index
    %0 = memref.load %arg1[%c0] {latency = 1 : i32} : memref<1xi32>
    %dependency_read_out, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0 : memref<16xi32>) dependency_write_in(%arg0 : memref<16xi32>) value_inputs(%0 : i32) [original_read_memrefs(%arg0 : memref<16xi32>), original_write_memrefs(%arg0 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, i32) -> (memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg2: memref<16xi32>, %arg3: memref<16xi32>, %arg4: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4 : memref<16xi32>, i32) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 1 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg5: memref<16xi32>, %arg6: i32):
        %2:2 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %7 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %8 = neura.load_indexed [%7 : !neura.data<index, i1>]  {dfg_id = 3 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%7, %8 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 6 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 0 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 0 : i32, y = 0 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 4 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 10 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) {dfg_id = 5 : i32, mapping_locs = [{id = 0 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.div"(%4) {dfg_id = 7 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 0 : i32}], rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.data_mov"(%5) {dfg_id = 8 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%3 : !neura.data<index, i1>]  {dfg_id = 9 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 2 : i32, x = 1 : i32, y = 1 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 2 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3 : memref<16xi32>) writes(%arg3 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @sv_attention(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %13 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {dfg_id = 6 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%13, %14 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 8 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}, {id = 13 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 128 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) {dfg_id = 7 : i32, mapping_locs = [{id = 16 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#1) {dfg_id = 9 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 12 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6:2 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %13 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {dfg_id = 10 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%13, %14 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 15 : i32}
        }) {dfg_id = 3 : i32, latency = 1 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 3 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7 = "neura.data_mov"(%6#0) {dfg_id = 11 : i32, mapping_locs = [{id = 42 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%6#1) {dfg_id = 12 : i32, mapping_locs = [{id = 40 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 39 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = neura.load_indexed [%7, %4 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 16 : i32, latency = 1 : i32, lhs_value = "%input2", mapping_locs = [{id = 9 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 2 : i32}]} : !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 18 : i32, mapping_locs = [{id = 27 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%8, %10, %5) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %13 = "neura.mul"(%arg10, %arg11) {dfg_id = 4 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %14 = "neura.add"(%arg12, %13) {dfg_id = 13 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>) {dfg_id = 17 : i32}
        }) {dfg_id = 19 : i32, latency = 1 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 2 : i32, x = 0 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) {dfg_id = 20 : i32, mapping_locs = [{id = 25 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%3 : !neura.data<index, i1>]  {dfg_id = 21 : i32, latency = 1 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 0 : i32, y = 1 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 5 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_gate(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %13 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {dfg_id = 6 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%13, %14 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 8 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}, {id = 13 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 128 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) {dfg_id = 7 : i32, mapping_locs = [{id = 16 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#1) {dfg_id = 9 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 12 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6:2 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %13 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {dfg_id = 10 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%13, %14 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 15 : i32}
        }) {dfg_id = 3 : i32, latency = 1 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 3 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7 = "neura.data_mov"(%6#0) {dfg_id = 11 : i32, mapping_locs = [{id = 42 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%6#1) {dfg_id = 12 : i32, mapping_locs = [{id = 40 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 39 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = neura.load_indexed [%4, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 16 : i32, latency = 1 : i32, lhs_value = "%input2", mapping_locs = [{id = 9 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 2 : i32}]} : !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 18 : i32, mapping_locs = [{id = 27 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%8, %10, %5) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %13 = "neura.mul"(%arg10, %arg11) {dfg_id = 4 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %14 = "neura.add"(%arg12, %13) {dfg_id = 13 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>) {dfg_id = 17 : i32}
        }) {dfg_id = 19 : i32, latency = 1 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 2 : i32, x = 0 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) {dfg_id = 20 : i32, mapping_locs = [{id = 25 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%3 : !neura.data<index, i1>]  {dfg_id = 21 : i32, latency = 1 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 0 : i32, y = 1 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 5 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_up(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %13 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {dfg_id = 6 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%13, %14 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 8 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}, {id = 13 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 128 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) {dfg_id = 7 : i32, mapping_locs = [{id = 16 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#1) {dfg_id = 9 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 12 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6:2 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %13 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {dfg_id = 10 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%13, %14 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 15 : i32}
        }) {dfg_id = 3 : i32, latency = 1 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 3 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7 = "neura.data_mov"(%6#0) {dfg_id = 11 : i32, mapping_locs = [{id = 42 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%6#1) {dfg_id = 12 : i32, mapping_locs = [{id = 40 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 39 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = neura.load_indexed [%4, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 16 : i32, latency = 1 : i32, lhs_value = "%input2", mapping_locs = [{id = 9 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 2 : i32}]} : !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 18 : i32, mapping_locs = [{id = 27 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%8, %10, %5) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %13 = "neura.mul"(%arg10, %arg11) {dfg_id = 4 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %14 = "neura.add"(%arg12, %13) {dfg_id = 13 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>) {dfg_id = 17 : i32}
        }) {dfg_id = 19 : i32, latency = 1 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 2 : i32, x = 0 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) {dfg_id = 20 : i32, mapping_locs = [{id = 25 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%3 : !neura.data<index, i1>]  {dfg_id = 21 : i32, latency = 1 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 0 : i32, y = 1 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 5 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_act(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<16xi32>, memref<16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1 : memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 1 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %9 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %10 = neura.load_indexed [%9 : !neura.data<index, i1>]  {dfg_id = 3 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%9, %10 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 7 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 0 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %2 = "neura.data_mov"(%1#0) {dfg_id = 5 : i32, mapping_locs = [{id = 3 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 7 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}, {id = 17 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#0) {dfg_id = 4 : i32, mapping_locs = [{id = 2 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%1#1) {dfg_id = 6 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = neura.load_indexed [%3 : !neura.data<index, i1>]  {dfg_id = 8 : i32, latency = 1 : i32, lhs_value = "%input1", mapping_locs = [{id = 0 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 1 : i32, x = 0 : i32, y = 0 : i32}]} : !neura.data<i32, i1>
        %6 = "neura.data_mov"(%5) {dfg_id = 9 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = "neura.mul"(%4, %6) {dfg_id = 10 : i32, latency = 1 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 2 : i32, x = 0 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%7) {dfg_id = 11 : i32, mapping_locs = [{id = 10 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%2 : !neura.data<index, i1>]  {dfg_id = 12 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 3 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 1 : i32}], rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 2 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<16xi32>, memref<16xi32>) writes(%arg5 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @ffn_down(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %13 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {dfg_id = 6 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%13, %14 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 8 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}, {id = 13 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 128 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#0) {dfg_id = 7 : i32, mapping_locs = [{id = 16 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%2#1) {dfg_id = 9 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 12 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6:2 = "neura.fused_op"() <{frequency = 24 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %13 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %14 = neura.load_indexed [%13 : !neura.data<index, i1>]  {dfg_id = 10 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%13, %14 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 15 : i32}
        }) {dfg_id = 3 : i32, latency = 1 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 3 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7 = "neura.data_mov"(%6#0) {dfg_id = 11 : i32, mapping_locs = [{id = 42 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %8 = "neura.data_mov"(%6#1) {dfg_id = 12 : i32, mapping_locs = [{id = 40 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 39 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = neura.load_indexed [%4, %7 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 16 : i32, latency = 1 : i32, lhs_value = "%input2", mapping_locs = [{id = 9 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 2 : i32}]} : !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 18 : i32, mapping_locs = [{id = 27 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.fused_op"(%8, %10, %5) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %13 = "neura.mul"(%arg10, %arg11) {dfg_id = 4 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %14 = "neura.add"(%arg12, %13) {dfg_id = 13 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%14 : !neura.data<i32, i1>) {dfg_id = 17 : i32}
        }) {dfg_id = 19 : i32, latency = 1 : i32, mapping_locs = [{id = 8 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 2 : i32, x = 0 : i32, y = 2 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%11) {dfg_id = 20 : i32, mapping_locs = [{id = 25 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%3 : !neura.data<index, i1>]  {dfg_id = 21 : i32, latency = 1 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 0 : i32, y = 1 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 5 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

