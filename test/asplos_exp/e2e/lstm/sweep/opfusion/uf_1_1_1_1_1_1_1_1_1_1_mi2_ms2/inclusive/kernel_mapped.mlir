module {
  func.func @i_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 38 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %11 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 5 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%11, %12 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 11 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 6 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) {dfg_id = 7 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}, {id = 160 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5:3 = "neura.fused_op"(%3) <{frequency = 18 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %11 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 9 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 8 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%11, %12, %13 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 13 : i32}
        }) {dfg_id = 12 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %6 = "neura.data_mov"(%5#0) {dfg_id = 15 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}, {id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%5#1) {dfg_id = 16 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%5#2) {dfg_id = 17 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 161 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%4, %8, %7) <{frequency = 10 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %11 = "neura.mul"(%arg10, %arg11) {dfg_id = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = "neura.add"(%arg12, %11) {dfg_id = 10 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12 : !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 18 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 19 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%6 : !neura.data<index, i1>]  {dfg_id = 20 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 0 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 4 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @f_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 38 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %11 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 5 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%11, %12 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 11 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 6 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) {dfg_id = 7 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}, {id = 160 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5:3 = "neura.fused_op"(%3) <{frequency = 18 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %11 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 9 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 8 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%11, %12, %13 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 13 : i32}
        }) {dfg_id = 12 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %6 = "neura.data_mov"(%5#0) {dfg_id = 15 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}, {id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%5#1) {dfg_id = 16 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%5#2) {dfg_id = 17 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 161 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%4, %8, %7) <{frequency = 10 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %11 = "neura.mul"(%arg10, %arg11) {dfg_id = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = "neura.add"(%arg12, %11) {dfg_id = 10 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12 : !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 18 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 19 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%6 : !neura.data<index, i1>]  {dfg_id = 20 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 0 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 4 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @o_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 38 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %11 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 5 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%11, %12 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 11 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 6 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) {dfg_id = 7 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}, {id = 160 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5:3 = "neura.fused_op"(%3) <{frequency = 18 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %11 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 9 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 8 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%11, %12, %13 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 13 : i32}
        }) {dfg_id = 12 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %6 = "neura.data_mov"(%5#0) {dfg_id = 15 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}, {id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%5#1) {dfg_id = 16 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%5#2) {dfg_id = 17 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 161 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%4, %8, %7) <{frequency = 10 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %11 = "neura.mul"(%arg10, %arg11) {dfg_id = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = "neura.add"(%arg12, %11) {dfg_id = 10 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12 : !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 18 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 19 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%6 : !neura.data<index, i1>]  {dfg_id = 20 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 0 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 4 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @g_gate_x(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 38 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %11 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 5 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%11, %12 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 11 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 6 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) {dfg_id = 7 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}, {id = 160 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5:3 = "neura.fused_op"(%3) <{frequency = 18 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %11 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 9 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 8 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%11, %12, %13 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 13 : i32}
        }) {dfg_id = 12 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %6 = "neura.data_mov"(%5#0) {dfg_id = 15 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}, {id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%5#1) {dfg_id = 16 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%5#2) {dfg_id = 17 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 161 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%4, %8, %7) <{frequency = 10 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %11 = "neura.mul"(%arg10, %arg11) {dfg_id = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = "neura.add"(%arg12, %11) {dfg_id = 10 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12 : !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 18 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 19 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%6 : !neura.data<index, i1>]  {dfg_id = 20 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 0 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 4 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @i_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 38 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %11 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 5 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%11, %12 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 11 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 6 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) {dfg_id = 7 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}, {id = 160 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5:3 = "neura.fused_op"(%3) <{frequency = 18 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %11 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 9 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 8 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%11, %12, %13 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 13 : i32}
        }) {dfg_id = 12 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %6 = "neura.data_mov"(%5#0) {dfg_id = 15 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}, {id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%5#1) {dfg_id = 16 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%5#2) {dfg_id = 17 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 161 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%4, %8, %7) <{frequency = 10 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %11 = "neura.mul"(%arg10, %arg11) {dfg_id = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = "neura.add"(%arg12, %11) {dfg_id = 10 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12 : !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 18 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 19 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%6 : !neura.data<index, i1>]  {dfg_id = 20 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 0 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 4 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @f_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 38 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %11 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 5 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%11, %12 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 11 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 6 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) {dfg_id = 7 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}, {id = 160 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5:3 = "neura.fused_op"(%3) <{frequency = 18 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %11 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 9 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 8 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%11, %12, %13 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 13 : i32}
        }) {dfg_id = 12 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %6 = "neura.data_mov"(%5#0) {dfg_id = 15 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}, {id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%5#1) {dfg_id = 16 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%5#2) {dfg_id = 17 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 161 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%4, %8, %7) <{frequency = 10 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %11 = "neura.mul"(%arg10, %arg11) {dfg_id = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = "neura.add"(%arg12, %11) {dfg_id = 10 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12 : !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 18 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 19 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%6 : !neura.data<index, i1>]  {dfg_id = 20 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 0 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 4 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @o_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 38 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %11 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 5 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%11, %12 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 11 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 6 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) {dfg_id = 7 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}, {id = 160 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5:3 = "neura.fused_op"(%3) <{frequency = 18 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %11 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 9 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 8 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%11, %12, %13 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 13 : i32}
        }) {dfg_id = 12 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %6 = "neura.data_mov"(%5#0) {dfg_id = 15 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}, {id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%5#1) {dfg_id = 16 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%5#2) {dfg_id = 17 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 161 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%4, %8, %7) <{frequency = 10 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %11 = "neura.mul"(%arg10, %arg11) {dfg_id = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = "neura.add"(%arg12, %11) {dfg_id = 10 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12 : !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 18 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 19 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%6 : !neura.data<index, i1>]  {dfg_id = 20 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 0 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 4 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @g_gate_h(%arg0: memref<16xi32>, %arg1: memref<16x16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16x16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16x16xi32>, %arg6: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      %1 = taskflow.counter parent(%0 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16x16xi32>):
        %2:2 = "neura.fused_op"() <{frequency = 38 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %11 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 5 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%11, %12 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 11 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %3 = "neura.data_mov"(%2#0) {dfg_id = 6 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%2#1) {dfg_id = 7 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}, {id = 160 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5:3 = "neura.fused_op"(%3) <{frequency = 18 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->load_indexed"}> ({
        ^bb0(%arg10: !neura.data<index, i1>):
          %11 = neura.counter {counter_id = 0 : i32, counter_type = "root", dfg_id = 2 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %12 = neura.load_indexed [%11 : !neura.data<index, i1>]  {dfg_id = 9 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %13 = neura.load_indexed [%11, %arg10 : !neura.data<index, i1>, !neura.data<index, i1>]  {dfg_id = 8 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          neura.yield results(%11, %12, %13 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 13 : i32}
        }) {dfg_id = 12 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %6 = "neura.data_mov"(%5#0) {dfg_id = 15 : i32, mapping_locs = [{id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 1 : i32}, {id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}, {id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %7 = "neura.data_mov"(%5#1) {dfg_id = 16 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %8 = "neura.data_mov"(%5#2) {dfg_id = 17 : i32, mapping_locs = [{id = 4 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 161 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %9 = "neura.fused_op"(%4, %8, %7) <{frequency = 10 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg10: !neura.data<i32, i1>, %arg11: !neura.data<i32, i1>, %arg12: !neura.data<i32, i1>):
          %11 = "neura.mul"(%arg10, %arg11) {dfg_id = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %12 = "neura.add"(%arg12, %11) {dfg_id = 10 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%12 : !neura.data<i32, i1>) {dfg_id = 14 : i32}
        }) {dfg_id = 18 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 1 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.data_mov"(%9) {dfg_id = 19 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%6 : !neura.data<index, i1>]  {dfg_id = 20 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 0 : i32}], rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 4 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg6, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16x16xi32>) writes(%arg6 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @cell_update(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>, %arg3: memref<16xi32>, %arg4: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:4, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1, %arg2, %arg3 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) dependency_write_in(%arg4 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1, %arg2, %arg3 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg4 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg5: memref<16xi32>, %arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>, %arg9: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg5, %arg6, %arg7, %arg8, %arg9 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg10: memref<16xi32>, %arg11: memref<16xi32>, %arg12: memref<16xi32>, %arg13: memref<16xi32>, %arg14: memref<16xi32>):
        %1:2 = "neura.fused_op"() <{frequency = 38 : i64, pattern_id = 0 : i64, pattern_name = "counter->load_indexed"}> ({
          %15 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %16 = neura.load_indexed [%15 : !neura.data<index, i1>]  {dfg_id = 5 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          neura.yield results(%15, %16 : !neura.data<index, i1>, !neura.data<i32, i1>) {dfg_id = 13 : i32}
        }) {dfg_id = 1 : i32, latency = 1 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %2 = "neura.data_mov"(%1#0) {dfg_id = 9 : i32, mapping_locs = [{id = 14 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 19 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}, {id = 33 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 3 : i32}, {id = 33 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 4 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#0) {dfg_id = 8 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %4 = "neura.data_mov"(%1#0) {dfg_id = 7 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 0 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %5 = "neura.data_mov"(%1#0) {dfg_id = 6 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 0 : i32}, {id = 128 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %6 = "neura.data_mov"(%1#1) {dfg_id = 10 : i32, mapping_locs = [{id = 161 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 0 : i32}, {id = 13 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 11 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}, {id = 0 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %7 = neura.load_indexed [%5 : !neura.data<index, i1>]  {dfg_id = 14 : i32, latency = 1 : i32, lhs_value = "%input1", mapping_locs = [{id = 4 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 2 : i32, x = 0 : i32, y = 1 : i32}]} : !neura.data<i32, i1>
        %8 = neura.load_indexed [%4 : !neura.data<index, i1>]  {dfg_id = 15 : i32, latency = 1 : i32, lhs_value = "%input3", mapping_locs = [{id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 1 : i32}]} : !neura.data<i32, i1>
        %9 = "neura.data_mov"(%8) {dfg_id = 19 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %10 = "neura.fused_op"(%3, %9) <{frequency = 23 : i64, pattern_id = 2 : i64, pattern_name = "load_indexed->mul"}> ({
        ^bb0(%arg15: !neura.data<index, i1>, %arg16: !neura.data<i32, i1>):
          %15 = neura.load_indexed [%arg15 : !neura.data<index, i1>]  {dfg_id = 2 : i32, lhs_value = "%input2"} : !neura.data<i32, i1>
          %16 = "neura.mul"(%15, %arg16) {dfg_id = 11 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16 : !neura.data<i32, i1>) {dfg_id = 16 : i32}
        }) {dfg_id = 20 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 2 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %11 = "neura.data_mov"(%10) {dfg_id = 21 : i32, mapping_locs = [{id = 2 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}, {id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 1 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %12 = "neura.data_mov"(%7) {dfg_id = 18 : i32, mapping_locs = [{id = 128 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}, {id = 11 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %13 = "neura.fused_op"(%6, %12, %11) <{frequency = 10 : i64, pattern_id = 3 : i64, pattern_name = "mul->add"}> ({
        ^bb0(%arg15: !neura.data<i32, i1>, %arg16: !neura.data<i32, i1>, %arg17: !neura.data<i32, i1>):
          %15 = "neura.mul"(%arg15, %arg16) {dfg_id = 3 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %16 = "neura.add"(%15, %arg17) {dfg_id = 12 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%16 : !neura.data<i32, i1>) {dfg_id = 17 : i32}
        }) {dfg_id = 22 : i32, latency = 1 : i32, mapping_locs = [{id = 0 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 0 : i32, y = 0 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %14 = "neura.data_mov"(%13) {dfg_id = 23 : i32, mapping_locs = [{id = 0 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "link", time_step = 4 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%2 : !neura.data<index, i1>]  {dfg_id = 24 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 5 : i32, x = 1 : i32, y = 0 : i32}], rhs_value = "%input4"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 4 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg5, %arg6, %arg7, %arg8 : memref<16xi32>, memref<16xi32>, memref<16xi32>, memref<16xi32>) writes(%arg9 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
  func.func @output_gate(%arg0: memref<16xi32>, %arg1: memref<16xi32>, %arg2: memref<16xi32>) attributes {latency = 1 : i32} {
    %dependency_read_out:2, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg0, %arg1 : memref<16xi32>, memref<16xi32>) dependency_write_in(%arg2 : memref<16xi32>) [original_read_memrefs(%arg0, %arg1 : memref<16xi32>, memref<16xi32>), original_write_memrefs(%arg2 : memref<16xi32>)] {latency = 1 : i32} : (memref<16xi32>, memref<16xi32>, memref<16xi32>) -> (memref<16xi32>, memref<16xi32>, memref<16xi32>) {
    ^bb0(%arg3: memref<16xi32>, %arg4: memref<16xi32>, %arg5: memref<16xi32>):
      %0 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : index
      neura.kernel inputs(%arg3, %arg4, %arg5 : memref<16xi32>, memref<16xi32>, memref<16xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32, mapping_info = {compiled_ii = 2 : i32, mapping_mode = "spatial-temporal", mapping_strategy = "heuristic", rec_mii = 1 : i32, res_mii = 1 : i32, x_tiles = 4 : i32, y_tiles = 4 : i32}} {
      ^bb0(%arg6: memref<16xi32>, %arg7: memref<16xi32>, %arg8: memref<16xi32>):
        %1:3 = "neura.fused_op"() <{frequency = 2 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:load_indexed->mul"}> ({
          %7 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", dfg_id = 0 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 16 : index} : !neura.data<index, i1>
          %8 = neura.load_indexed [%7 : !neura.data<index, i1>]  {dfg_id = 4 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
          %9 = neura.load_indexed [%7 : !neura.data<index, i1>]  {dfg_id = 3 : i32, lhs_value = "%input1"} : !neura.data<i32, i1>
          %10 = "neura.mul"(%9, %9) {dfg_id = 8 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%7, %8, %10 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) {dfg_id = 10 : i32}
        }) {dfg_id = 1 : i32, latency = 2 : i32, mapping_locs = [{id = 5 : i32, index_per_ii = 0 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 0 : i32, x = 1 : i32, y = 1 : i32}, {id = 5 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "tile", time_step = 1 : i32, x = 1 : i32, y = 1 : i32}]} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>)
        %2 = "neura.data_mov"(%1#0) {dfg_id = 5 : i32, mapping_locs = [{id = 13 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 11 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}, {id = 0 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 3 : i32}]} : (!neura.data<index, i1>) -> !neura.data<index, i1>
        %3 = "neura.data_mov"(%1#1) {dfg_id = 6 : i32, mapping_locs = [{id = 15 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, resource = "link", time_step = 1 : i32}, {id = 32 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %4 = "neura.data_mov"(%1#2) {dfg_id = 7 : i32, mapping_locs = [{id = 160 : i32, index_per_ii = 1 : i32, invalid_iterations = 0 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 1 : i32}, {id = 15 : i32, index_per_ii = 0 : i32, invalid_iterations = 1 : i32, resource = "link", time_step = 2 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.mul"(%3, %4) {dfg_id = 9 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, resource = "tile", time_step = 3 : i32, x = 1 : i32, y = 0 : i32}]} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.data_mov"(%5) {dfg_id = 11 : i32, mapping_locs = [{id = 32 : i32, index_per_ii = 1 : i32, invalid_iterations = 1 : i32, per_tile_register_id = 0 : i32, resource = "register", time_step = 3 : i32}]} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%2 : !neura.data<index, i1>]  {dfg_id = 12 : i32, latency = 1 : i32, mapping_locs = [{id = 1 : i32, index_per_ii = 0 : i32, invalid_iterations = 2 : i32, resource = "tile", time_step = 4 : i32, x = 1 : i32, y = 0 : i32}], rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {dfg_id = 2 : i32, latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg3, %arg4 : memref<16xi32>, memref<16xi32>) writes(%arg5 : memref<16xi32>)
    }
    return {latency = 1 : i32}
  }
}

