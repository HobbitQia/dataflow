module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.return {latency = 1 : i32} %0 : i32
  }
  func.func @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg2"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg2"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = 0 : i32}> {latency = 1 : i32} : () -> !neura.data<i32, i1>
    %3 = "neura.constant"() <{value = 0 : i32}> {latency = 1 : i32} : () -> !neura.data<i32, i1>
    %4 = "neura.grant_once"() <{constant_value = 0 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %5 = "neura.data_mov"(%3) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %6 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%5, %6) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = "neura.fused_op"(%7) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %68 = "neura.grant_once"() <{constant_value = 1020 : i64}> : () -> !neura.data<i64, i1>
      %69 = neura.phi_start %68, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%69 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %9 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %10 = "neura.data_mov"(%8) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = "neura.fused_op"(%11) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>):
      %68 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
      %69 = neura.phi_start %68, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%69 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = "neura.data_mov"(%12) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = "neura.data_mov"(%12) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %17 = "neura.fused_op"(%16) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>):
      %68 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %69 = neura.phi_start %68, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%69 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %18 = "neura.data_mov"(%17) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %19 = "neura.data_mov"(%17) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %20 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %21 = "neura.fused_op"(%20) <{frequency = 4 : i64, pattern_id = 1 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>):
      %68 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %69 = neura.phi_start %68, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%69 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %22 = "neura.data_mov"(%21) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = "neura.data_mov"(%21) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = "neura.data_mov"(%4) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26:2 = "neura.fused_op"(%25, %24, %14) <{frequency = 3 : i64, pattern_id = 2 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %68 = neura.phi_start %arg3, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %69 = "neura.add"(%68, %arg5) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%68, %69 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %27 = "neura.data_mov"(%26#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.data_mov"(%26#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = "neura.data_mov"(%26#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = "neura.data_mov"(%26#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<i32, i1>
    %32 = "neura.gep"(%23, %29) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = "neura.gep"(%19, %28) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = "neura.data_mov"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = "neura.load"(%34) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<vector<4xi32>, i1>
    %36 = "neura.data_mov"(%33) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = "neura.load"(%36) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<vector<4xi32>, i1>
    %38 = "neura.data_mov"(%37) : (!neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %39 = "neura.data_mov"(%35) : (!neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %40 = "neura.vmul"(%38, %39) {latency = 1 : i32} : (!neura.data<vector<4xi32>, i1>, !neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %41 = "neura.data_mov"(%40) : (!neura.data<vector<4xi32>, i1>) -> !neura.data<vector<4xi32>, i1>
    %42 = "neura.vector.reduce.add"(%41) {latency = 1 : i32} : (!neura.data<vector<4xi32>, i1>) -> !neura.data<i32, i1>
    %43 = "neura.data_mov"(%2) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %44 = "neura.data_mov"(%42) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %45 = "neura.fused_op"(%43, %31, %44) <{frequency = 3 : i64, pattern_id = 2 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg3: !neura.data<i32, i1>, %arg4: !neura.data<i32, i1>, %arg5: !neura.data<i32, i1>):
      %68 = neura.phi_start %arg3, %arg4 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %69 = "neura.add"(%arg5, %68) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
      neura.yield results(%69 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %46 = "neura.data_mov"(%45) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %47 = "neura.data_mov"(%45) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %48:5 = "neura.fused_op"(%27, %10, %47, %13, %30, %22) <{frequency = 3 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i32, i1>, %arg6: !neura.data<i64, i1>, %arg7: !neura.data<i64, i1>, %arg8: !neura.data<!llvm.ptr, i1>):
      %68 = "neura.icmp"(%arg3, %arg4) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %69 = neura.grant_predicate %arg5, %68 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      %70 = neura.grant_predicate %arg6, %68 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %71 = neura.grant_predicate %arg7, %68 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %72 = neura.grant_predicate %arg8, %68 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%68, %69, %70, %71, %72 : !neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %49 = "neura.data_mov"(%48#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %50 = "neura.data_mov"(%48#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %51 = "neura.data_mov"(%48#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %52 = "neura.data_mov"(%48#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %53 = "neura.data_mov"(%48#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %54 = "neura.data_mov"(%48#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55 = "neura.data_mov"(%48#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %56 = "neura.data_mov"(%48#4) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %57 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %58:2 = "neura.fused_op"(%57, %15, %52) <{frequency = 5 : i64, pattern_id = 4 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg3: !neura.data<!llvm.ptr, i1>, %arg4: !neura.data<!llvm.ptr, i1>, %arg5: !neura.data<i1, i1>):
      %68 = neura.phi_start %arg3, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %69 = neura.grant_predicate %68, %arg5 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%68, %69 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>) -> (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>)
    %59 = "neura.data_mov"(%58#0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %60 = "neura.data_mov"(%58#1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%46, %59) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %61 = "neura.not"(%51) {latency = 1 : i32} : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.ctrl_mov %53 -> %31 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %55 -> %24 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %56 -> %20 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %62 = neura.grant_predicate %18, %50 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %62 -> %16 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %60 -> %15 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %54 -> %11 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %63 = neura.grant_predicate %9, %49 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %63 -> %7 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %64 = "neura.data_mov"(%61) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %65 = "neura.data_mov"(%61) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %66 = neura.grant_predicate %64, %65 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %67 = "neura.data_mov"(%66) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %67 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

