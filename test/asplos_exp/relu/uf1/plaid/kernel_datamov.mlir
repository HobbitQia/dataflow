module attributes {dlti.dl_spec = #dlti.dl_spec<i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.return {latency = 1 : i32} %0 : i32
  }
  func.func @_Z6kernelPiS_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.writeonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> {latency = 1 : i32} : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = 0 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %3 = "neura.grant_once"() <{constant_value = 6 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 0 : i32}> {latency = 1 : i32} : () -> !neura.data<i32, i1>
    %5 = "neura.grant_once"() <{constant_value = 1 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 64 : i64}> {latency = 1 : i32} : () -> !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = "neura.data_mov"(%6) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %9 = neura.phi_start %8, %7 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = "neura.data_mov"(%5) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %12 = neura.phi_start %11, %10 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %14 = "neura.data_mov"(%1) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %15 = neura.phi_start %14, %13 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<i32, i1>
    %17 = "neura.data_mov"(%4) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %18 = neura.phi_start %17, %16 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %19 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %20 = "neura.data_mov"(%0) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %21 = neura.phi_start %20, %19 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = "neura.data_mov"(%2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = neura.phi_start %23, %22 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = "neura.data_mov"(%3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = neura.phi_start %26, %25 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %28 = neura.reserve : !neura.data<i64, i1>
    %29 = "neura.data_mov"(%2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = neura.phi_start %29, %28 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %31 = "neura.data_mov"(%30) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = "neura.data_mov"(%27) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = "neura.shl"(%31, %32) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = "neura.data_mov"(%24) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = neura.phi_start %35, %34 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %37 = neura.reserve : !neura.data<i64, i1>
    %38 = "neura.data_mov"(%27) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = neura.phi_start %38, %37 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = "neura.data_mov"(%30) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %42 = neura.phi_start %41, %40 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %43 = neura.reserve : !neura.data<i64, i1>
    %44 = "neura.data_mov"(%9) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = neura.phi_start %44, %43 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %46 = neura.reserve : !neura.data<i64, i1>
    %47 = "neura.data_mov"(%12) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %48 = neura.phi_start %47, %46 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %49 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %50 = "neura.data_mov"(%15) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %51 = neura.phi_start %50, %49 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %52 = neura.reserve : !neura.data<i32, i1>
    %53 = "neura.data_mov"(%18) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %54 = neura.phi_start %53, %52 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %55 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %56 = "neura.data_mov"(%21) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %57 = neura.phi_start %56, %55 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %58 = neura.reserve : !neura.data<i64, i1>
    %59 = "neura.data_mov"(%33) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60 = neura.phi_start %59, %58 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %61 = neura.reserve : !neura.data<i64, i1>
    %62 = "neura.data_mov"(%24) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %63 = neura.phi_start %62, %61 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %64 = "neura.data_mov"(%63) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = "neura.data_mov"(%60) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66 = "neura.data_mov"(%57) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %67:2 = "neura.fused_op"(%64, %65, %66) <{frequency = 1 : i64, pattern_id = 0 : i64, pattern_name = "plaid.unicast:add->gep->load"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<!llvm.ptr, i1>):
      %170 = "neura.add"(%arg2, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %171 = "neura.gep"(%arg4, %170) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
      %172 = "neura.load"(%171) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
      neura.yield results(%170, %172 : !neura.data<i64, i1>, !neura.data<i32, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i64, i1>, !neura.data<i32, i1>)
    %68 = "neura.data_mov"(%67#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.data_mov"(%67#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %70 = "neura.data_mov"(%67#1) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %71 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %72 = "neura.icmp"(%70, %71) <{cmpType = "sgt"}> {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %73 = "neura.data_mov"(%72) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %74 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %75 = "neura.sel"(%73, %69, %74) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %76 = "neura.data_mov"(%51) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %77 = "neura.gep"(%76, %68) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %78 = "neura.data_mov"(%75) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %79 = "neura.data_mov"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%78, %79) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %80 = "neura.data_mov"(%63) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %81 = "neura.data_mov"(%48) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82 = "neura.data_mov"(%45) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83:3 = "neura.fused_op"(%80, %81, %82) <{frequency = 1 : i64, pattern_id = 1 : i64, pattern_name = "plaid.unicast:add->icmp->not"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %170 = "neura.add"(%arg2, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %171 = "neura.icmp"(%170, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %172 = "neura.not"(%171) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      neura.yield results(%170, %171, %172 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    %84 = "neura.data_mov"(%83#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %85 = "neura.data_mov"(%83#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %86 = "neura.data_mov"(%83#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %87 = "neura.data_mov"(%83#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %88 = "neura.data_mov"(%83#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %89 = "neura.data_mov"(%83#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %90 = "neura.data_mov"(%83#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %91 = "neura.data_mov"(%83#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %92 = "neura.data_mov"(%83#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %93 = "neura.data_mov"(%83#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %94 = "neura.data_mov"(%83#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %95 = "neura.data_mov"(%83#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %96 = "neura.data_mov"(%83#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %97 = "neura.data_mov"(%83#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %98 = "neura.data_mov"(%83#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %99 = "neura.data_mov"(%83#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %100 = "neura.data_mov"(%83#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %101 = "neura.data_mov"(%83#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %102 = "neura.data_mov"(%83#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %103 = neura.grant_predicate %84, %102 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %103 -> %61 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %104 = "neura.data_mov"(%60) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %105 = neura.grant_predicate %104, %101 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %105 -> %58 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %106 = "neura.data_mov"(%57) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %107 = neura.grant_predicate %106, %100 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %107 -> %55 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %108 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %109 = neura.grant_predicate %108, %99 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %109 -> %52 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %110 = "neura.data_mov"(%51) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %111 = neura.grant_predicate %110, %98 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %111 -> %49 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %112 = "neura.data_mov"(%48) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %113 = neura.grant_predicate %112, %97 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %113 -> %46 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %114 = "neura.data_mov"(%45) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %115 = neura.grant_predicate %114, %96 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %115 -> %43 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %116 = "neura.data_mov"(%42) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %117 = neura.grant_predicate %116, %95 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %117 -> %40 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %118 = "neura.data_mov"(%39) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %119 = neura.grant_predicate %118, %94 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %119 -> %37 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %120 = "neura.data_mov"(%36) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %121 = neura.grant_predicate %120, %93 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %121 -> %34 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %122 = "neura.data_mov"(%42) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %123 = neura.grant_predicate %122, %92 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %124 = "neura.data_mov"(%48) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %125 = neura.grant_predicate %124, %91 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %126 = "neura.data_mov"(%45) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %127 = neura.grant_predicate %126, %90 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %128 = "neura.data_mov"(%39) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %129 = neura.grant_predicate %128, %89 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %130 = "neura.data_mov"(%36) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %131 = neura.grant_predicate %130, %88 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %132 = "neura.data_mov"(%57) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %133 = neura.grant_predicate %132, %87 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %134 = "neura.data_mov"(%54) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %135 = neura.grant_predicate %134, %86 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    %136 = "neura.data_mov"(%51) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %137 = neura.grant_predicate %136, %85 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %138 = "neura.data_mov"(%123) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %139 = "neura.data_mov"(%125) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %140 = "neura.data_mov"(%127) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %141:3 = "neura.fused_op"(%138, %139, %140) <{frequency = 1 : i64, pattern_id = 2 : i64, pattern_name = "plaid.unicast:add->icmp->not"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %170 = "neura.add"(%arg2, %arg3) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      %171 = "neura.icmp"(%170, %arg4) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %172 = "neura.not"(%171) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      neura.yield results(%170, %171, %172 : !neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 3 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>)
    %142 = "neura.data_mov"(%141#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %143 = "neura.data_mov"(%141#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %144 = "neura.data_mov"(%141#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %145 = "neura.data_mov"(%141#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %146 = "neura.data_mov"(%141#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %147 = "neura.data_mov"(%141#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %148 = "neura.data_mov"(%141#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %149 = "neura.data_mov"(%141#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %150 = "neura.data_mov"(%141#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %151 = "neura.data_mov"(%141#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %152 = "neura.data_mov"(%141#2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %153 = neura.grant_predicate %142, %152 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %153 -> %28 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %154 = "neura.data_mov"(%129) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %155 = neura.grant_predicate %154, %151 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %155 -> %25 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %156 = "neura.data_mov"(%131) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %157 = neura.grant_predicate %156, %150 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %157 -> %22 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %158 = "neura.data_mov"(%133) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %159 = neura.grant_predicate %158, %149 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %159 -> %19 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %160 = "neura.data_mov"(%135) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %161 = neura.grant_predicate %160, %148 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %161 -> %16 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %162 = "neura.data_mov"(%137) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %163 = neura.grant_predicate %162, %147 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %163 -> %13 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %164 = "neura.data_mov"(%125) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %165 = neura.grant_predicate %164, %146 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %165 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %166 = "neura.data_mov"(%127) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %167 = neura.grant_predicate %166, %145 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %167 -> %7 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %168 = neura.grant_predicate %144, %143 {latency = 1 : i32} : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    %169 = "neura.data_mov"(%168) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.return_void %169 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

