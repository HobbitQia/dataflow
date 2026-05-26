module attributes {dlti.dl_spec = #dlti.dl_spec<i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) {latency = 1 : i32} : i32
    llvm.return {latency = 1 : i32} %0 : i32
  }
  func.func @_Z6kernelPiS_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.writeonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, latency = 1 : i32, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = neura.reserve : !neura.data<i64, i1>
    %1 = neura.reserve : !neura.data<i64, i1>
    %2 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %3 = neura.reserve : !neura.data<i32, i1>
    %4 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %5 = neura.reserve : !neura.data<i64, i1>
    %6 = neura.reserve : !neura.data<i64, i1>
    %7 = "neura.fused_op"(%6) <{frequency = 8 : i64, pattern_id = 0 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %133 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %134 = neura.phi_start %133, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%134 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %8 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %9 = "neura.data_mov"(%7) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11:2 = "neura.fused_op"(%5, %10) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %133 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %134 = neura.phi_start %133, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %135 = neura.phi_start %133, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%134, %135 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %12 = "neura.data_mov"(%11#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = "neura.data_mov"(%11#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = "neura.data_mov"(%11#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %15 = "neura.data_mov"(%11#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %16 = "neura.shl"(%15, %9) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = neura.phi_start %14, %19 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = "neura.fused_op"(%0, %21) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %133 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
      %134 = neura.phi_start %133, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %135 = neura.phi_start %134, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%135 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %23 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = "neura.fused_op"(%1, %26) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %133 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %134 = neura.phi_start %133, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %135 = neura.phi_start %134, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%135 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = "neura.data_mov"(%27) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = "neura.data_mov"(%27) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = "neura.data_mov"(%27) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %32 = "neura.fused_op"(%2, %31) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>):
      %133 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %134 = neura.phi_start %133, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %135 = neura.phi_start %134, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%135 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = "neura.data_mov"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = "neura.data_mov"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = "neura.data_mov"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %36 = neura.reserve : !neura.data<i32, i1>
    %37 = "neura.fused_op"(%3, %36) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>):
      %133 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
      %134 = neura.phi_start %133, %arg2 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %135 = neura.phi_start %134, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%135 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %38 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %39 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %40 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %41 = "neura.data_mov"(%37) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %42 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %43 = "neura.fused_op"(%4, %42) <{frequency = 7 : i64, pattern_id = 0 : i64, pattern_name = "fused_op:grant_once->phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>):
      %133 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %134 = neura.phi_start %133, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %135 = neura.phi_start %134, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%135 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %44 = "neura.data_mov"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = "neura.data_mov"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.data_mov"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %47 = neura.reserve : !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<i64, i1>
    %49:2 = "neura.fused_op"(%13, %48, %30) <{frequency = 3 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %133 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %134 = "neura.add"(%133, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%133, %134 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %50 = "neura.data_mov"(%49#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.data_mov"(%49#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %52 = "neura.data_mov"(%49#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %53 = "neura.data_mov"(%16) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54:2 = "neura.fused_op"(%53, %47, %50) <{frequency = 3 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %133 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %134 = "neura.add"(%arg4, %133) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%133, %134 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %55 = "neura.data_mov"(%54#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %56 = "neura.data_mov"(%54#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = "neura.data_mov"(%54#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %58 = "neura.data_mov"(%20) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59:3 = "neura.fused_op"(%52, %25, %58, %29) <{frequency = 3 : i64, pattern_id = 3 : i64, pattern_name = "fused_op:icmp->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %133 = "neura.icmp"(%arg2, %arg3) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %134 = neura.grant_predicate %arg4, %133 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %135 = neura.grant_predicate %arg5, %133 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%133, %134, %135 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %60 = "neura.data_mov"(%59#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %61 = "neura.data_mov"(%59#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %62 = "neura.data_mov"(%59#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %63 = "neura.data_mov"(%59#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %64 = "neura.data_mov"(%59#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %65 = "neura.data_mov"(%59#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %66 = "neura.data_mov"(%59#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %67 = "neura.data_mov"(%59#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68 = "neura.data_mov"(%59#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %69 = "neura.data_mov"(%59#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70:4 = "neura.fused_op"(%66, %51, %55, %46) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %133 = "neura.not"(%arg2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %134 = neura.grant_predicate %arg3, %133 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %135 = neura.grant_predicate %arg4, %133 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %136 = neura.grant_predicate %arg5, %133 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%133, %134, %135, %136 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %71 = "neura.data_mov"(%70#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %72 = "neura.data_mov"(%70#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %73 = "neura.data_mov"(%70#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %74 = "neura.data_mov"(%70#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %75 = "neura.data_mov"(%70#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %76 = "neura.data_mov"(%70#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %77 = "neura.data_mov"(%70#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %78 = "neura.data_mov"(%70#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %79 = "neura.data_mov"(%70#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %80 = "neura.data_mov"(%70#3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %81 = "neura.gep"(%45, %57) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %82 = "neura.data_mov"(%81) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.load"(%82) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %84 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %85 = "neura.icmp"(%84, %41) <{cmpType = "sgt"}> {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %86 = "neura.data_mov"(%85) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %87 = "neura.data_mov"(%83) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %88 = "neura.sel"(%86, %87, %40) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %89 = "neura.gep"(%35, %56) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %90 = "neura.data_mov"(%88) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %91 = "neura.data_mov"(%89) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%90, %91) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %92:2 = "neura.fused_op"(%12, %17, %77) <{frequency = 17 : i64, pattern_id = 5 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>):
      %133 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %134 = neura.grant_predicate %133, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%133, %134 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %93 = "neura.data_mov"(%92#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %94 = "neura.data_mov"(%92#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %95:2 = "neura.fused_op"(%8, %18, %76) <{frequency = 17 : i64, pattern_id = 5 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>):
      %133 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %134 = neura.grant_predicate %133, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%133, %134 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %96 = "neura.data_mov"(%95#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %97 = "neura.data_mov"(%95#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %78 -> %48 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %79 -> %47 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %80 -> %42 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %98 = neura.grant_predicate %39, %75 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %98 -> %36 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %99 = neura.grant_predicate %34, %74 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %99 -> %31 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %100 = neura.grant_predicate %28, %73 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %100 -> %26 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %101 = neura.grant_predicate %24, %72 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %101 -> %21 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %102 = "neura.data_mov"(%20) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %103 = neura.grant_predicate %102, %71 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %103 -> %19 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %97 -> %18 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %94 -> %17 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %104 = neura.grant_predicate %23, %65 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %105 = neura.grant_predicate %93, %64 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %106 = "neura.add"(%67, %69) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %107 = "neura.data_mov"(%106) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %108 = "neura.data_mov"(%104) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %109:2 = "neura.fused_op"(%107, %108) <{frequency = 10 : i64, pattern_id = 2 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %133 = "neura.icmp"(%arg2, %arg3) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %134 = neura.grant_predicate %133, %133 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%133, %134 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %110 = "neura.data_mov"(%109#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %111 = "neura.data_mov"(%109#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %112 = "neura.data_mov"(%105) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %113 = "neura.data_mov"(%106) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %114:4 = "neura.fused_op"(%110, %112, %113, %68) <{frequency = 8 : i64, pattern_id = 4 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %133 = "neura.not"(%arg2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %134 = neura.grant_predicate %arg3, %133 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %135 = neura.grant_predicate %arg4, %133 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %136 = neura.grant_predicate %arg5, %133 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%133, %134, %135, %136 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %115 = "neura.data_mov"(%114#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %116 = "neura.data_mov"(%114#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %117 = "neura.data_mov"(%114#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %118 = "neura.data_mov"(%114#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %119 = "neura.data_mov"(%114#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %120 = "neura.data_mov"(%114#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %121 = "neura.data_mov"(%114#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %122 = "neura.data_mov"(%114#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %123 = "neura.fused_op"(%33, %63, %119) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %133 = neura.grant_predicate %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %134 = neura.grant_predicate %133, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%134 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %124 = "neura.data_mov"(%123) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %125 = "neura.fused_op"(%38, %62, %118) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %133 = neura.grant_predicate %arg2, %arg3 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      %134 = neura.grant_predicate %133, %arg4 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%134 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i32, i1>
    %126 = "neura.data_mov"(%125) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %127 = "neura.fused_op"(%44, %61, %117) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %133 = neura.grant_predicate %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %134 = neura.grant_predicate %133, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%134 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %128 = "neura.data_mov"(%127) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %129 = "neura.fused_op"(%96, %60, %116) <{frequency = 6 : i64, pattern_id = 3 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %133 = neura.grant_predicate %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %134 = neura.grant_predicate %133, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%134 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %130 = "neura.data_mov"(%129) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %121 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %130 -> %6 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %120 -> %5 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %128 -> %4 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %126 -> %3 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %124 -> %2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %122 -> %1 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %131 = "neura.data_mov"(%104) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %132 = neura.grant_predicate %131, %115 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %132 -> %0 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %111 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

