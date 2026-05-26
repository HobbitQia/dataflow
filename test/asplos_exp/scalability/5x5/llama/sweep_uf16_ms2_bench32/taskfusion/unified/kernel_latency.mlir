module {
  func.func @llama_attention_ffn(%arg0: memref<32xi32>, %arg1: memref<32x32xi32>, %arg2: memref<32xi32>, %arg3: memref<32xi32>, %arg4: memref<1xi32>, %arg5: memref<32x32xi32>, %arg6: memref<32xi32>, %arg7: memref<32x32xi32>, %arg8: memref<32xi32>, %arg9: memref<32x32xi32>, %arg10: memref<32xi32>, %arg11: memref<32xi32>, %arg12: memref<32x32xi32>, %arg13: memref<32xi32>) attributes {latency = 1 : i32} {
    %c0 = arith.constant {latency = 1 : i32} 0 : index
    %c1_i32 = arith.constant {latency = 1 : i32} 1 : i32
    %dependency_read_out:3, %dependency_write_out = taskflow.task @Task_0 dependency_read_in(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg2 : memref<32xi32>) [original_read_memrefs(%arg2, %arg0, %arg1 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg2 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %33 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %36 = neura.load_indexed [%33, %35 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %37 = "neura.add"(%35) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%33, %34, %35, %36, %37, %38 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.fused_op"(%3#0, %3#4, %3#5) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%arg23, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%33, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%3#2, %3#0, %3#1) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%3#2, %3#3, %3#0) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<index, i1>):
          %33 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %36 = "neura.add"(%35, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %5 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%3#2, %3#0, %7) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.fused_op"(%3#2, %3#0, %9) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = "neura.fused_op"(%3#2, %3#0, %11) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.fused_op"(%3#2, %3#0, %13) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.fused_op"(%3#2, %3#0, %15) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.fused_op"(%3#2, %3#0, %17) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.fused_op"(%3#2, %3#0, %19) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.fused_op"(%3#2, %3#0, %21) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = "neura.fused_op"(%3#2, %3#0, %23) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.fused_op"(%3#2, %3#0, %25) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.fused_op"(%3#2, %3#0, %27) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %28 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.fused_op"(%3#2, %3#0, %29) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %30 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.fused_op"(%3#2, %3#0, %31) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %4 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    %dependency_read_out_0, %dependency_write_out_1 = taskflow.task @Task_1 dependency_read_in(%dependency_write_out : memref<32xi32>) dependency_write_in(%arg3 : memref<32xi32>) value_inputs(%c1_i32 : i32) [original_read_memrefs(%arg2 : memref<32xi32>), original_write_memrefs(%arg3 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, i32) -> (memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg14, %arg16, %arg15 : memref<32xi32>, i32, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg17: memref<32xi32>, %arg18: i32, %arg19: memref<32xi32>):
        %2:6 = "neura.fused_op"() <{frequency = 14 : i64, pattern_id = 6 : i64, pattern_name = "fused_op:fused_op:counter->fused_op:load_indexed->mul->fused_op:fused_op:add->load_indexed->fused_op:mul->add->fused_op:fused_op:add->load_indexed->fused_op:mul->add"}> ({
          %17 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%17) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %21 = neura.load_indexed [%20 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %22 = "neura.mul"(%21, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %23 = "neura.add"(%22) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %24 = "neura.add"(%17) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %25 = neura.load_indexed [%24 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %26 = "neura.mul"(%25, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %27 = "neura.add"(%26) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19, %20, %23, %24, %27 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3:2 = "neura.fused_op"(%2#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%2#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5:2 = "neura.fused_op"(%2#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %6:2 = "neura.fused_op"(%2#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7:2 = "neura.fused_op"(%2#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8:2 = "neura.fused_op"(%2#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9:2 = "neura.fused_op"(%2#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10:2 = "neura.fused_op"(%2#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %11:2 = "neura.fused_op"(%2#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12:2 = "neura.fused_op"(%2#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %13:2 = "neura.fused_op"(%2#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %14:2 = "neura.fused_op"(%2#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15:2 = "neura.fused_op"(%2#0) <{frequency = 90 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.mul"(%18, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %20 = "neura.add"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %16 = "neura.add"(%2#1) {latency = 1 : i32, rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%2#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %2#3 to [%2#2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %2#5 to [%2#4 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %3#1 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %4#1 to [%4#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %5#1 to [%5#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %6#1 to [%6#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %7#1 to [%7#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %8#1 to [%8#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %9#1 to [%9#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %10#1 to [%10#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %11#1 to [%11#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %12#1 to [%12#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %13#1 to [%13#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %14#1 to [%14#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %15#1 to [%15#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg14 : memref<32xi32>) writes(%arg15 : memref<32xi32>)
    }
    %0 = memref.load %arg4[%c0] {latency = 1 : i32} : memref<1xi32>
    %dependency_read_out_2, %dependency_write_out_3 = taskflow.task @Task_2 dependency_read_in(%dependency_write_out_1 : memref<32xi32>) dependency_write_in(%dependency_write_out_1 : memref<32xi32>) value_inputs(%0 : i32) [original_read_memrefs(%arg3 : memref<32xi32>), original_write_memrefs(%arg3 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, i32) -> (memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: i32):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg15, %arg16 : memref<32xi32>, i32) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg17: memref<32xi32>, %arg18: i32):
        %2:5 = "neura.fused_op"() <{frequency = 14 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:counter->fused_op:fused_op:add->load_indexed->div->fused_op:fused_op:add->load_indexed->div"}> ({
          %17 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %18 = "neura.add"(%17) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %19 = neura.load_indexed [%18 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %20 = "neura.div"(%19) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.add"(%17) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = "neura.div"(%22) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %18, %20, %21, %23 : !neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %6:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %11:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %13:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %14:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15:2 = "neura.fused_op"(%2#0) <{frequency = 15 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:add->load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = "neura.add"(%arg19) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = "neura.div"(%18) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %19 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %16 = "neura.fused_op"(%2#0) <{frequency = 16 : i64, pattern_id = 4 : i64, pattern_name = "load_indexed->div"}> ({
        ^bb0(%arg19: !neura.data<index, i1>):
          %17 = neura.load_indexed [%arg19 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %18 = "neura.div"(%17) {rhs_value = "%input1"} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%18 : !neura.data<i32, i1>)
        }) {latency = 1 : i32} : (!neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%2#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %15#1 to [%15#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %14#1 to [%14#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %13#1 to [%13#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %12#1 to [%12#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %11#1 to [%11#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %10#1 to [%10#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %9#1 to [%9#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %8#1 to [%8#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %7#1 to [%7#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %6#1 to [%6#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %5#1 to [%5#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %4#1 to [%4#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %3#1 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %2#4 to [%2#3 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %2#2 to [%2#1 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg15 : memref<32xi32>) writes(%arg15 : memref<32xi32>)
    }
    %dependency_read_out_4:3, %dependency_write_out_5 = taskflow.task @Task_3 dependency_read_in(%arg6, %dependency_write_out_3, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg6 : memref<32xi32>) [original_read_memrefs(%arg6, %arg3, %arg5 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg6 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %33 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %36 = neura.load_indexed [%35, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %37 = "neura.add"(%35) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%33, %34, %35, %36, %37, %38 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.fused_op"(%3#0, %3#4, %3#5) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg22, %arg21 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%arg23, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%33, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%3#2, %3#0, %3#1) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%3#2, %3#3, %3#0) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<index, i1>):
          %33 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %36 = "neura.add"(%35, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %5 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%3#2, %3#0, %7) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.fused_op"(%3#2, %3#0, %9) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = "neura.fused_op"(%3#2, %3#0, %11) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.fused_op"(%3#2, %3#0, %13) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.fused_op"(%3#2, %3#0, %15) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.fused_op"(%3#2, %3#0, %17) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.fused_op"(%3#2, %3#0, %19) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.fused_op"(%3#2, %3#0, %21) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = "neura.fused_op"(%3#2, %3#0, %23) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.fused_op"(%3#2, %3#0, %25) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.fused_op"(%3#2, %3#0, %27) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %28 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.fused_op"(%3#2, %3#0, %29) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %30 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.fused_op"(%3#2, %3#0, %31) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%33, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %4 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    %dependency_read_out_6:3, %dependency_write_out_7 = taskflow.task @Task_4 dependency_read_in(%arg8, %dependency_write_out_5, %arg7 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg8 : memref<32xi32>) [original_read_memrefs(%arg8, %arg6, %arg7 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg8 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %33 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %36 = neura.load_indexed [%33, %35 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %37 = "neura.add"(%35) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%33, %34, %35, %36, %37, %38 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.fused_op"(%3#0, %3#4, %3#5) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%arg23, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%33, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%3#2, %3#0, %3#1) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%3#2, %3#3, %3#0) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<index, i1>):
          %33 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %36 = "neura.add"(%35, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %5 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%3#2, %3#0, %7) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.fused_op"(%3#2, %3#0, %9) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = "neura.fused_op"(%3#2, %3#0, %11) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.fused_op"(%3#2, %3#0, %13) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.fused_op"(%3#2, %3#0, %15) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.fused_op"(%3#2, %3#0, %17) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.fused_op"(%3#2, %3#0, %19) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.fused_op"(%3#2, %3#0, %21) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = "neura.fused_op"(%3#2, %3#0, %23) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.fused_op"(%3#2, %3#0, %25) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.fused_op"(%3#2, %3#0, %27) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %28 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.fused_op"(%3#2, %3#0, %29) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %30 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.fused_op"(%3#2, %3#0, %31) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %4 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    %dependency_read_out_8:3, %dependency_write_out_9 = taskflow.task @Task_5 dependency_read_in(%arg10, %dependency_write_out_5, %arg9 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg10 : memref<32xi32>) [original_read_memrefs(%arg10, %arg6, %arg9 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg10 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %33 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %36 = neura.load_indexed [%33, %35 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %37 = "neura.add"(%35) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%33, %34, %35, %36, %37, %38 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.fused_op"(%3#0, %3#4, %3#5) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%arg23, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%33, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%3#2, %3#0, %3#1) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%3#2, %3#3, %3#0) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<index, i1>):
          %33 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %36 = "neura.add"(%35, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %5 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%3#2, %3#0, %7) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.fused_op"(%3#2, %3#0, %9) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = "neura.fused_op"(%3#2, %3#0, %11) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.fused_op"(%3#2, %3#0, %13) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.fused_op"(%3#2, %3#0, %15) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.fused_op"(%3#2, %3#0, %17) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.fused_op"(%3#2, %3#0, %19) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.fused_op"(%3#2, %3#0, %21) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = "neura.fused_op"(%3#2, %3#0, %23) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.fused_op"(%3#2, %3#0, %25) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.fused_op"(%3#2, %3#0, %27) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %28 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.fused_op"(%3#2, %3#0, %29) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %30 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.fused_op"(%3#2, %3#0, %31) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %4 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    %dependency_read_out_10:2, %dependency_write_out_11 = taskflow.task @Task_6 dependency_read_in(%dependency_write_out_7, %dependency_write_out_9 : memref<32xi32>, memref<32xi32>) dependency_write_in(%arg11 : memref<32xi32>) [original_read_memrefs(%arg8, %arg10 : memref<32xi32>, memref<32xi32>), original_write_memrefs(%arg11 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg14, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg17: memref<32xi32>, %arg18: memref<32xi32>, %arg19: memref<32xi32>):
        %2:4 = "neura.fused_op"() <{frequency = 15 : i64, pattern_id = 10 : i64, pattern_name = "fused_op:fused_op:counter->load_indexed->fused_op:load_indexed->mul->fused_op:fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
          %17 = neura.counter {counter_id = 0 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%19, %18) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %21 = "neura.add"(%17) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %22 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %23 = neura.load_indexed [%21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %24 = "neura.mul"(%22, %23) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20, %21, %24 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %3:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %4:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %5:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %6:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %7:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %8:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %9:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %10:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %11:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %12:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %13:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %14:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %15:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        %16:2 = "neura.fused_op"(%2#0) <{frequency = 30 : i64, pattern_id = 9 : i64, pattern_name = "fused_op:fused_op:add->load_indexed->load_indexed->mul"}> ({
        ^bb0(%arg20: !neura.data<index, i1>):
          %17 = "neura.add"(%arg20) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %18 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %19 = neura.load_indexed [%17 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %20 = "neura.mul"(%18, %19) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%17, %20 : !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>) -> (!neura.data<index, i1>, !neura.data<i32, i1>)
        neura.store_indexed %2#1 to [%2#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %16#1 to [%16#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %15#1 to [%15#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %14#1 to [%14#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %13#1 to [%13#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %12#1 to [%12#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %11#1 to [%11#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %10#1 to [%10#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %9#1 to [%9#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %8#1 to [%8#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %7#1 to [%7#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %6#1 to [%6#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %5#1 to [%5#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %4#1 to [%4#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %3#1 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.store_indexed %2#3 to [%2#2 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input2"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg14, %arg15 : memref<32xi32>, memref<32xi32>) writes(%arg16 : memref<32xi32>)
    }
    %dependency_read_out_12:3, %dependency_write_out_13 = taskflow.task @Task_7 dependency_read_in(%arg13, %dependency_write_out_11, %arg12 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) dependency_write_in(%arg13 : memref<32xi32>) [original_read_memrefs(%arg13, %arg11, %arg12 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>), original_write_memrefs(%arg13 : memref<32xi32>)] {latency = 1 : i32} : (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) -> (memref<32xi32>, memref<32xi32>, memref<32x32xi32>, memref<32xi32>) {
    ^bb0(%arg14: memref<32xi32>, %arg15: memref<32xi32>, %arg16: memref<32x32xi32>, %arg17: memref<32xi32>):
      %1 = taskflow.counter attributes {counter_id = 0 : i32, counter_type = "root", latency = 1 : i32, lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : index
      %2 = taskflow.counter parent(%1 : index) attributes {counter_id = 1 : i32, counter_type = "leaf", latency = 1 : i32, lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : index
      neura.kernel inputs(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) attributes {accelerator = "neura", dataflow_mode = "predicate", latency = 1 : i32} {
      ^bb0(%arg18: memref<32xi32>, %arg19: memref<32xi32>, %arg20: memref<32x32xi32>):
        %3:6 = "neura.fused_op"() <{frequency = 5 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:counter->load_indexed->fused_op:fused_op:counter->load_indexed->fused_op:add->load_indexed"}> ({
          %33 = neura.counter {counter_id = 0 : i32, counter_type = "root", lower_bound = 0 : index, step = 1 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %35 = neura.counter {counter_id = 1 : i32, counter_type = "leaf", lower_bound = 0 : index, step = 16 : index, upper_bound = 32 : index} : !neura.data<index, i1>
          %36 = neura.load_indexed [%33, %35 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %37 = "neura.add"(%35) {rhs_value = 15 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %38 = neura.load_indexed [%37 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          neura.yield results(%33, %34, %35, %36, %37, %38 : !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        }) {latency = 2 : i32} : () -> (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>, !neura.data<i32, i1>)
        %4 = "neura.fused_op"(%3#0, %3#4, %3#5) <{frequency = 70 : i64, pattern_id = 11 : i64, pattern_name = "load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %34 = neura.load_indexed [%arg21, %arg22 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %35 = "neura.mul"(%arg23, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %36 = "neura.add"(%33, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %5 = "neura.fused_op"(%3#2, %3#0, %3#1) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 1 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        %6 = "neura.fused_op"(%3#2, %3#3, %3#0) <{frequency = 5 : i64, pattern_id = 8 : i64, pattern_name = "fused_op:load_indexed->mul->fused_op:load_indexed->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<i32, i1>, %arg23: !neura.data<index, i1>):
          %33 = neura.load_indexed [%arg21 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %34 = "neura.mul"(%33, %arg22) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg23 : !neura.data<index, i1>]  {lhs_value = "%input0"} : !neura.data<i32, i1>
          %36 = "neura.add"(%35, %34) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%36 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<i32, i1>, !neura.data<index, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %6 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %5 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %7 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %8 = "neura.fused_op"(%3#2, %3#0, %7) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 2 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %8 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %9 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %10 = "neura.fused_op"(%3#2, %3#0, %9) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 3 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %10 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %11 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %12 = "neura.fused_op"(%3#2, %3#0, %11) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 4 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %12 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %13 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %14 = "neura.fused_op"(%3#2, %3#0, %13) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 5 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %14 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %15 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %16 = "neura.fused_op"(%3#2, %3#0, %15) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 6 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %16 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %17 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %18 = "neura.fused_op"(%3#2, %3#0, %17) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 7 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %18 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %19 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %20 = "neura.fused_op"(%3#2, %3#0, %19) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 8 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %20 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %21 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %22 = "neura.fused_op"(%3#2, %3#0, %21) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 9 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %22 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %23 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %24 = "neura.fused_op"(%3#2, %3#0, %23) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 10 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %24 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %25 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %26 = "neura.fused_op"(%3#2, %3#0, %25) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 11 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %26 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %27 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %28 = "neura.fused_op"(%3#2, %3#0, %27) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 12 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %28 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %29 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %30 = "neura.fused_op"(%3#2, %3#0, %29) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 13 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %30 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        %31 = neura.load_indexed [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, lhs_value = "%input0"} : !neura.data<i32, i1>
        %32 = "neura.fused_op"(%3#2, %3#0, %31) <{frequency = 140 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:add->load_indexed->fused_op:load_indexed->fused_op:mul->add"}> ({
        ^bb0(%arg21: !neura.data<index, i1>, %arg22: !neura.data<index, i1>, %arg23: !neura.data<i32, i1>):
          %33 = "neura.add"(%arg21) {rhs_value = 14 : index} : (!neura.data<index, i1>) -> !neura.data<index, i1>
          %34 = neura.load_indexed [%33 : !neura.data<index, i1>]  {lhs_value = "%input1"} : !neura.data<i32, i1>
          %35 = neura.load_indexed [%arg22, %33 : !neura.data<index, i1>, !neura.data<index, i1>]  {lhs_value = "%input2"} : !neura.data<i32, i1>
          %36 = "neura.mul"(%34, %35) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          %37 = "neura.add"(%arg23, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
          neura.yield results(%37 : !neura.data<i32, i1>)
        }) {latency = 2 : i32} : (!neura.data<index, i1>, !neura.data<index, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
        neura.store_indexed %32 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.store_indexed %4 to [%3#0 : !neura.data<index, i1>]  {latency = 1 : i32, rhs_value = "%input0"} : !neura.data<i32, i1>
        neura.yield {latency = 1 : i32, yield_type = "void"}
      }
      taskflow.yield reads(%arg17, %arg15, %arg16 : memref<32xi32>, memref<32xi32>, memref<32x32xi32>) writes(%arg17 : memref<32xi32>)
    }
    return {latency = 1 : i32}
  }
}

