module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.return {latency = 1 : i32} %0 : i32
  }
  func.func @_Z6kernelPiS_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.writeonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = 64 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %1 = neura.reserve : !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<i64, i1>
    %3 = neura.reserve : !neura.data<i64, i1>
    %4 = neura.reserve : !neura.data<i64, i1>
    %5 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %6 = neura.reserve : !neura.data<i32, i1>
    %7 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %8 = neura.reserve : !neura.data<i64, i1>
    %9:2 = "neura.fused_op"(%8) <{frequency = 3 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %175 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %176 = neura.phi_start %175, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%175, %176 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %10 = "neura.data_mov"(%9#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %11 = "neura.data_mov"(%9#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %12 = "neura.data_mov"(%9#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = "neura.fused_op"(%13) <{frequency = 3 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %175 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %176 = neura.phi_start %175, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%176 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %15 = "neura.data_mov"(%14) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = "neura.data_mov"(%14) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.phi_start %10, %17 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %19 = "neura.data_mov"(%18) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %20 = "neura.shl"(%19, %16) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.phi_start %15, %22 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = "neura.data_mov"(%18) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = neura.phi_start %26, %25 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %28 = neura.reserve : !neura.data<i64, i1>
    %29 = "neura.fused_op"(%2, %28) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %175 = "neura.grant_once"() <{constant_value = 62 : i64}> : () -> !neura.data<i64, i1>
      %176 = neura.phi_start %175, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %177 = neura.phi_start %176, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%177 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = "neura.data_mov"(%29) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31 = "neura.data_mov"(%29) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = "neura.data_mov"(%29) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = "neura.fused_op"(%3, %33) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %175 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %176 = neura.phi_start %175, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %177 = neura.phi_start %176, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%177 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %35 = "neura.data_mov"(%34) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = "neura.data_mov"(%34) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %37 = "neura.data_mov"(%34) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %40 = "neura.fused_op"(%5, %39) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>):
      %175 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %176 = neura.phi_start %175, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %177 = neura.phi_start %176, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%177 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %41 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %42 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %43 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %44 = "neura.data_mov"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = neura.reserve : !neura.data<i32, i1>
    %46 = "neura.fused_op"(%6, %45) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>):
      %175 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
      %176 = neura.phi_start %175, %arg2 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %177 = neura.phi_start %176, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%177 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %47 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %48 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %49 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %50 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %51 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %52 = "neura.data_mov"(%46) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %53 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %54 = "neura.fused_op"(%7, %53) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>):
      %175 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %176 = neura.phi_start %175, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %177 = neura.phi_start %176, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%177 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %55 = "neura.data_mov"(%54) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = "neura.data_mov"(%54) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %57 = "neura.data_mov"(%54) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %58 = "neura.data_mov"(%54) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %59 = neura.reserve : !neura.data<i64, i1>
    %60 = neura.reserve : !neura.data<i64, i1>
    %61:2 = "neura.fused_op"(%12, %60, %37) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %175 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %176 = "neura.add"(%175, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%175, %176 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %62 = "neura.data_mov"(%61#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %63 = "neura.data_mov"(%61#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %64 = "neura.data_mov"(%61#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = "neura.data_mov"(%20) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66:2 = "neura.fused_op"(%65, %59, %63) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %175 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %176 = "neura.add"(%arg4, %175) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%175, %176 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %67 = "neura.data_mov"(%66#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = "neura.data_mov"(%66#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.data_mov"(%66#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70 = "neura.data_mov"(%66#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %71:4 = "neura.fused_op"(%62, %32, %64, %67, %58) <{frequency = 8 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %175 = "neura.icmp"(%arg2, %arg3) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %176 = neura.grant_predicate %arg4, %175 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %177 = neura.grant_predicate %arg5, %175 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %178 = neura.grant_predicate %arg6, %175 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%175, %176, %177, %178 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %72 = "neura.data_mov"(%71#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %73 = "neura.data_mov"(%71#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %74 = "neura.data_mov"(%71#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %75 = "neura.data_mov"(%71#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %76 = "neura.data_mov"(%71#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %77 = "neura.data_mov"(%71#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %78 = "neura.data_mov"(%71#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %79 = "neura.data_mov"(%71#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %80 = "neura.data_mov"(%71#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %81 = "neura.data_mov"(%71#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %82 = "neura.data_mov"(%71#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83 = "neura.data_mov"(%71#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %84 = "neura.data_mov"(%71#3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %85:2 = "neura.fused_op"(%4, %38, %81) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>):
      %175 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %176 = neura.phi_start %175, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %177 = neura.phi_start %176, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %178 = neura.grant_predicate %177, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%177, %178 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 2 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %86 = "neura.data_mov"(%85#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %87 = "neura.data_mov"(%85#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %88 = "neura.data_mov"(%85#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %89 = "neura.gep"(%57, %70) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %90 = "neura.data_mov"(%89) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %91 = "neura.load"(%90) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %92 = "neura.data_mov"(%91) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %93 = "neura.icmp"(%92, %52) <{cmpType = "sgt"}> {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %94 = "neura.data_mov"(%93) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %95 = "neura.data_mov"(%91) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %96 = "neura.sel"(%94, %95, %51) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %97 = "neura.gep"(%44, %69) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %98 = "neura.data_mov"(%96) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %99 = "neura.data_mov"(%97) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%98, %99) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %100 = "neura.or"(%68, %87) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %101 = "neura.data_mov"(%100) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %102 = "neura.gep"(%56, %101) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %103 = "neura.data_mov"(%102) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %104 = "neura.load"(%103) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %105 = "neura.data_mov"(%104) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %106 = "neura.icmp"(%105, %50) <{cmpType = "sgt"}> {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %107 = "neura.data_mov"(%106) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %108 = "neura.data_mov"(%104) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %109 = "neura.sel"(%107, %108, %49) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %110 = "neura.data_mov"(%100) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %111 = "neura.gep"(%43, %110) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %112 = "neura.data_mov"(%109) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %113 = "neura.data_mov"(%111) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%112, %113) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %114 = "neura.data_mov"(%0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %115:2 = "neura.fused_op"(%114, %1, %24, %80) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %175 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %176 = neura.phi_start %175, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %177 = neura.grant_predicate %176, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%176, %177 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %116 = "neura.data_mov"(%115#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %117 = "neura.data_mov"(%115#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %118 = "neura.data_mov"(%27) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %119:4 = "neura.fused_op"(%79, %118, %86, %116) <{frequency = 3 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %175 = "neura.not"(%arg2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %176 = neura.grant_predicate %arg3, %175 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %177 = neura.grant_predicate %arg4, %175 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %178 = neura.grant_predicate %arg5, %175 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%175, %176, %177, %178 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %120 = "neura.data_mov"(%119#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %121 = "neura.data_mov"(%119#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %122 = "neura.data_mov"(%119#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %123 = "neura.data_mov"(%119#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %124 = "neura.data_mov"(%119#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %125 = "neura.data_mov"(%119#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %126 = "neura.data_mov"(%119#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %127 = "neura.data_mov"(%119#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %128 = "neura.data_mov"(%119#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %129 = "neura.data_mov"(%119#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %130 = "neura.data_mov"(%119#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %131 = "neura.data_mov"(%119#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %132:2 = "neura.fused_op"(%11, %21, %78) <{frequency = 21 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>):
      %175 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %176 = neura.grant_predicate %175, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%175, %176 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %133 = "neura.data_mov"(%132#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %134 = "neura.data_mov"(%132#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %82 -> %60 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %83 -> %59 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %84 -> %53 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %135 = neura.grant_predicate %48, %77 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %135 -> %45 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %136 = neura.grant_predicate %42, %76 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %136 -> %39 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %88 -> %38 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %137 = neura.grant_predicate %36, %75 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %137 -> %33 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %138 = neura.grant_predicate %31, %74 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %138 -> %28 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %139 = "neura.data_mov"(%27) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %140 = neura.grant_predicate %139, %73 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %140 -> %25 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %117 -> %24 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %141 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %142 = neura.grant_predicate %141, %72 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %142 -> %22 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %134 -> %21 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %143 = neura.grant_predicate %133, %126 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %144 = "neura.add"(%127, %129) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %145 = "neura.data_mov"(%144) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %146:2 = "neura.fused_op"(%145, %131) <{frequency = 14 : i64, pattern_id = 2 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %175 = "neura.icmp"(%arg2, %arg3) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %176 = neura.grant_predicate %175, %175 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%175, %176 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %147 = "neura.data_mov"(%146#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %148 = "neura.data_mov"(%146#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %149 = "neura.data_mov"(%143) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %150 = "neura.data_mov"(%144) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %151 = "neura.data_mov"(%23) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %152:4 = "neura.fused_op"(%147, %149, %150, %151, %125) <{frequency = 12 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %175 = "neura.not"(%arg2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %176 = neura.grant_predicate %arg3, %175 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %177 = neura.grant_predicate %arg4, %175 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %178 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %179 = neura.grant_predicate %178, %175 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%175, %176, %177, %179 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %153 = "neura.data_mov"(%152#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %154 = "neura.data_mov"(%152#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %155 = "neura.data_mov"(%152#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %156 = "neura.data_mov"(%152#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %157 = "neura.data_mov"(%152#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %158 = "neura.data_mov"(%152#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %159 = "neura.data_mov"(%152#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %160 = "neura.data_mov"(%152#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %161 = "neura.data_mov"(%152#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %162 = "neura.data_mov"(%152#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %163 = "neura.fused_op"(%30, %124, %159) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %175 = neura.grant_predicate %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %176 = neura.grant_predicate %175, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%176 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %164 = "neura.data_mov"(%163) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %165 = "neura.fused_op"(%35, %123, %158) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %175 = neura.grant_predicate %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %176 = neura.grant_predicate %175, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%176 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %166 = "neura.data_mov"(%165) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %167 = "neura.fused_op"(%41, %122, %157) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %175 = neura.grant_predicate %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %176 = neura.grant_predicate %175, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%176 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %168 = "neura.data_mov"(%167) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %169 = "neura.fused_op"(%47, %121, %156) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %175 = neura.grant_predicate %arg2, %arg3 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      %176 = neura.grant_predicate %175, %arg4 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%176 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i32, i1>
    %170 = "neura.data_mov"(%169) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %171 = "neura.fused_op"(%55, %120, %155) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %175 = neura.grant_predicate %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %176 = neura.grant_predicate %175, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%176 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %172 = "neura.data_mov"(%171) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %161 -> %17 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %162 -> %13 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %160 -> %8 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %172 -> %7 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %170 -> %6 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %168 -> %5 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %173 = neura.grant_predicate %128, %154 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %173 -> %4 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %166 -> %3 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %164 -> %2 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %174 = neura.grant_predicate %130, %153 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %174 -> %1 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %148 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

