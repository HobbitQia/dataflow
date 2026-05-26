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
    %6:2 = "neura.fused_op"(%5) <{frequency = 3 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %135 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %136 = neura.phi_start %135, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%135, %136 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %7 = "neura.data_mov"(%6#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %8 = "neura.data_mov"(%6#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %9 = "neura.data_mov"(%6#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = "neura.fused_op"(%10) <{frequency = 3 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %135 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %136 = neura.phi_start %135, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%136 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %12 = "neura.data_mov"(%11) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %13 = "neura.data_mov"(%11) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<i64, i1>
    %15 = neura.phi_start %7, %14 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %16 = "neura.data_mov"(%15) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %17 = "neura.shl"(%16, %13) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = neura.reserve : !neura.data<i64, i1>
    %21 = "neura.data_mov"(%15) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %22 = neura.phi_start %21, %20 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24 = "neura.fused_op"(%0, %23) <{frequency = 5 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %135 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
      %136 = neura.phi_start %135, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %137 = neura.phi_start %136, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%137 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = "neura.data_mov"(%24) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %26 = "neura.data_mov"(%24) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %27 = "neura.data_mov"(%24) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %28 = neura.reserve : !neura.data<i64, i1>
    %29 = "neura.fused_op"(%1, %28) <{frequency = 5 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %135 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %136 = neura.phi_start %135, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %137 = neura.phi_start %136, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%137 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = "neura.data_mov"(%29) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %31 = "neura.data_mov"(%29) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = "neura.data_mov"(%29) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %34 = "neura.fused_op"(%2, %33) <{frequency = 5 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>):
      %135 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %136 = neura.phi_start %135, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %137 = neura.phi_start %136, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%137 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %36 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %37 = "neura.data_mov"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = neura.reserve : !neura.data<i32, i1>
    %39 = "neura.fused_op"(%3, %38) <{frequency = 5 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>):
      %135 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
      %136 = neura.phi_start %135, %arg2 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %137 = neura.phi_start %136, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%137 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %40 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %41 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %42 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %43 = "neura.data_mov"(%39) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %44 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %45 = "neura.fused_op"(%4, %44) <{frequency = 5 : i64, pattern_id = 4 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>):
      %135 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %136 = neura.phi_start %135, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %137 = neura.phi_start %136, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%137 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.data_mov"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %47 = "neura.data_mov"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %48 = "neura.data_mov"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %49 = neura.reserve : !neura.data<i64, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51:2 = "neura.fused_op"(%9, %50, %32) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %135 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %136 = "neura.add"(%135, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%135, %136 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %52 = "neura.data_mov"(%51#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %53 = "neura.data_mov"(%51#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %54 = "neura.data_mov"(%51#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %56:3 = "neura.fused_op"(%54, %27, %55, %31) <{frequency = 3 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:icmp->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %135 = "neura.icmp"(%arg2, %arg3) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %136 = neura.grant_predicate %arg4, %135 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %137 = neura.grant_predicate %arg5, %135 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%135, %136, %137 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %57 = "neura.data_mov"(%56#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %58 = "neura.data_mov"(%56#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %59 = "neura.data_mov"(%56#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %60 = "neura.data_mov"(%56#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %61 = "neura.data_mov"(%56#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %62 = "neura.data_mov"(%56#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %63 = "neura.data_mov"(%56#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %64 = "neura.data_mov"(%56#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = "neura.data_mov"(%56#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %66 = "neura.data_mov"(%56#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67 = "neura.data_mov"(%17) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %68:2 = "neura.fused_op"(%67, %49, %52) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %135 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %136 = "neura.add"(%arg4, %135) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%135, %136 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %69 = "neura.data_mov"(%68#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %70 = "neura.data_mov"(%68#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %71 = "neura.data_mov"(%68#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %72:4 = "neura.fused_op"(%63, %53, %69, %48) <{frequency = 8 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<!llvm.ptr, i1>):
      %135 = "neura.not"(%arg2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %136 = neura.grant_predicate %arg3, %135 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %137 = neura.grant_predicate %arg4, %135 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %138 = neura.grant_predicate %arg5, %135 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%135, %136, %137, %138 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %73 = "neura.data_mov"(%72#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %74 = "neura.data_mov"(%72#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %75 = "neura.data_mov"(%72#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %76 = "neura.data_mov"(%72#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %77 = "neura.data_mov"(%72#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %78 = "neura.data_mov"(%72#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %79 = "neura.data_mov"(%72#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %80 = "neura.data_mov"(%72#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %81 = "neura.data_mov"(%72#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %82 = "neura.data_mov"(%72#3) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.gep"(%47, %71) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = "neura.data_mov"(%83) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %85 = "neura.load"(%84) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %86 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %87 = "neura.icmp"(%86, %43) <{cmpType = "sgt"}> {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %88 = "neura.data_mov"(%87) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %89 = "neura.data_mov"(%85) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %90 = "neura.sel"(%88, %89, %42) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %91 = "neura.gep"(%37, %70) <{operandSegmentSizes = array<i32: 1, 1>}> {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %92 = "neura.data_mov"(%90) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %93 = "neura.data_mov"(%91) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%92, %93) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %94:2 = "neura.fused_op"(%8, %18, %79) <{frequency = 5 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>):
      %135 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %136 = neura.grant_predicate %135, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%135, %136 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %95 = "neura.data_mov"(%94#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %96 = "neura.data_mov"(%94#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %97:2 = "neura.fused_op"(%12, %19, %78) <{frequency = 5 : i64, pattern_id = 9 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>):
      %135 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %136 = neura.grant_predicate %135, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%135, %136 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %98 = "neura.data_mov"(%97#0) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %99 = "neura.data_mov"(%97#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %80 -> %50 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %81 -> %49 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %82 -> %44 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %100 = neura.grant_predicate %41, %77 {latency = 1 : i32} : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %100 -> %38 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    %101 = neura.grant_predicate %36, %76 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %101 -> %33 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %102 = neura.grant_predicate %30, %75 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %102 -> %28 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %103 = neura.grant_predicate %26, %74 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %103 -> %23 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %104 = "neura.data_mov"(%22) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %105 = neura.grant_predicate %104, %73 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %105 -> %20 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %99 -> %19 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %96 -> %18 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %106 = neura.grant_predicate %25, %62 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %107 = neura.grant_predicate %95, %61 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %108 = "neura.add"(%64, %66) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %109 = "neura.data_mov"(%108) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %110 = "neura.data_mov"(%106) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %111:2 = "neura.fused_op"(%109, %110) <{frequency = 10 : i64, pattern_id = 2 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %135 = "neura.icmp"(%arg2, %arg3) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %136 = neura.grant_predicate %135, %135 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%135, %136 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %112 = "neura.data_mov"(%111#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %113 = "neura.data_mov"(%111#1) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %114 = "neura.data_mov"(%107) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %115 = "neura.data_mov"(%108) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %116:4 = "neura.fused_op"(%112, %114, %115, %65) <{frequency = 8 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %135 = "neura.not"(%arg2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %136 = neura.grant_predicate %arg3, %135 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %137 = neura.grant_predicate %arg4, %135 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %138 = neura.grant_predicate %arg5, %135 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%135, %136, %137, %138 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %117 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %118 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %119 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %120 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %121 = "neura.data_mov"(%116#0) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %122 = "neura.data_mov"(%116#1) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %123 = "neura.data_mov"(%116#2) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %124 = "neura.data_mov"(%116#3) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %125 = "neura.fused_op"(%35, %60, %121) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %135 = neura.grant_predicate %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %136 = neura.grant_predicate %135, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%136 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %126 = "neura.data_mov"(%125) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %127 = "neura.fused_op"(%40, %59, %120) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %135 = neura.grant_predicate %arg2, %arg3 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      %136 = neura.grant_predicate %135, %arg4 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%136 : !neura.data<i32, i1>)
    }) {latency = 1 : i32} : (!neura.data<i32, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i32, i1>
    %128 = "neura.data_mov"(%127) : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %129 = "neura.fused_op"(%46, %58, %119) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %135 = neura.grant_predicate %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %136 = neura.grant_predicate %135, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%136 : !neura.data<!llvm.ptr, i1>)
    }) {latency = 1 : i32} : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %130 = "neura.data_mov"(%129) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %131 = "neura.fused_op"(%98, %57, %118) <{frequency = 7 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %135 = neura.grant_predicate %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %136 = neura.grant_predicate %135, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%136 : !neura.data<i64, i1>)
    }) {latency = 1 : i32} : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %132 = "neura.data_mov"(%131) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.ctrl_mov %123 -> %14 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %132 -> %10 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %122 -> %5 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %130 -> %4 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %128 -> %3 {latency = 1 : i32} : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %126 -> %2 {latency = 1 : i32} : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %124 -> %1 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    %133 = "neura.data_mov"(%106) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %134 = neura.grant_predicate %133, %117 {latency = 1 : i32} : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %134 -> %0 {latency = 1 : i32} : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %113 : !neura.data<i1, i1> {latency = 1 : i32}
    neura.yield {latency = 1 : i32}
  }
}

