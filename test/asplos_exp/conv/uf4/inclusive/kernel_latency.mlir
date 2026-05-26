module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.return {latency = 1 : i32} %0 : i32
  }
  func.func @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg2"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = 0 : i32}> {latency = 1 : i32} : () -> !neura.data<i32, i1>
    %2 = "neura.grant_once"() <{constant_value = 0 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %3 = "neura.grant_once"() <{constant_value = 1020 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    "neura.store"(%1, %0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %4 = neura.reserve : !neura.data<i64, i1>
    %5 = neura.phi_start %3, %4 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %8 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %9 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11:4 = "neura.fused_op"(%2, %10, %5, %6) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:phi_start->icmp->fused_op:grant_once->fused_op:phi_start->grant_predicate->fused_op:add->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i64, i1>):
      %24 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %25 = "neura.icmp"(%24, %arg5) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %26 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
      %27 = neura.phi_start %26, %arg6 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %28 = neura.grant_predicate %27, %25 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %29 = "neura.add"(%24, %27) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %30 = neura.grant_predicate %29, %25 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%24, %25, %28, %30 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %12:2 = "neura.fused_op"(%9, %11#1) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>):
      %24 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %25 = neura.phi_start %24, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %26 = neura.grant_predicate %25, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%25, %26 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %13:2 = "neura.fused_op"(%8, %11#1) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>):
      %24 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %25 = neura.phi_start %24, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %26 = neura.grant_predicate %25, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%25, %26 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %14:2 = "neura.fused_op"(%7, %11#1) <{frequency = 4 : i64, pattern_id = 6 : i64, pattern_name = "grant_once->fused_op:phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i1, i1>):
      %24 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
      %25 = neura.phi_start %24, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %26 = neura.grant_predicate %25, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%25, %26 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %15 = "neura.fused_op"(%11#1) <{frequency = 2 : i64, pattern_id = 5 : i64, pattern_name = "not->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i1, i1>):
      %24 = "neura.not"(%arg3) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %25 = neura.grant_predicate %24, %24 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%25 : !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %16 = "neura.fused_op"(%12#0, %11#0) <{frequency = 2 : i64, pattern_id = 1 : i64, pattern_name = "gep->load"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>):
      %24 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %25 = "neura.load"(%24) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<vector<4xi32>, i1>
      neura.yield results(%25 : !neura.data<vector<4xi32>, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<vector<4xi32>, i1>
    %17 = "neura.fused_op"(%13#0, %11#0, %16) <{frequency = 2 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:gep->load->vmul"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<vector<4xi32>, i1>):
      %24 = "neura.gep"(%arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %25 = "neura.load"(%24) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<vector<4xi32>, i1>
      %26 = "neura.vmul"(%25, %arg5) : (!neura.data<vector<4xi32>, i1>, !neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
      neura.yield results(%26 : !neura.data<vector<4xi32>, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %18 = neura.reserve : !neura.data<i32, i1>
    %19 = "neura.fused_op"(%18) <{frequency = 7 : i64, pattern_id = 2 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>):
      %24 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
      %25 = neura.phi_start %24, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%25 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %20 = "neura.vector.reduce.add"(%17) {latency = 1 : i32} : (!neura.data<vector<4xi32>, i1>) -> !neura.data<i32, i1>
    %21 = "neura.add"(%20, %19) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%21, %14#0) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %22 = neura.grant_predicate %21, %11#1 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %22 -> %18 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %11#3 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %12#1 -> %9 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %13#1 -> %8 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %14#1 -> %7 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %11#2 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %23 = neura.grant_predicate %5, %11#1 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %23 -> %4 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %15 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

