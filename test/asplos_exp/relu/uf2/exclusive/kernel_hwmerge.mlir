module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.return %0 : i32
  }
  func.func @_Z6kernelPiS_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.writeonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
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
      %69 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
      %70 = neura.phi_start %69, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%69, %70 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = "neura.fused_op"(%10) <{frequency = 3 : i64, pattern_id = 7 : i64, pattern_name = "grant_once->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>):
      %69 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
      %70 = neura.phi_start %69, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%70 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = neura.phi_start %9#0, %12 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %14 = "neura.shl"(%13, %11) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = neura.phi_start %11, %16 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = neura.phi_start %13, %19 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = "neura.fused_op"(%2, %21) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %69 = "neura.grant_once"() <{constant_value = 62 : i64}> : () -> !neura.data<i64, i1>
      %70 = neura.phi_start %69, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %71 = neura.phi_start %70, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%71 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24 = "neura.fused_op"(%3, %23) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %69 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
      %70 = neura.phi_start %69, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %71 = neura.phi_start %70, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      neura.yield results(%71 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %27 = "neura.fused_op"(%5, %26) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>):
      %69 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
      %70 = neura.phi_start %69, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %71 = neura.phi_start %70, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%71 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %28 = neura.reserve : !neura.data<i32, i1>
    %29 = "neura.fused_op"(%6, %28) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i32, i1>):
      %69 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
      %70 = neura.phi_start %69, %arg2 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      %71 = neura.phi_start %70, %arg3 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
      neura.yield results(%71 : !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %30 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %31 = "neura.fused_op"(%7, %30) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "grant_once->fused_op:phi_start->phi_start"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<!llvm.ptr, i1>):
      %69 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
      %70 = neura.phi_start %69, %arg2 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      %71 = neura.phi_start %70, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%71 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1>) -> !neura.data<!llvm.ptr, i1>
    %32 = neura.reserve : !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34:2 = "neura.fused_op"(%9#1, %33, %24) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %69 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %70 = "neura.add"(%69, %arg4) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%69, %70 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %35:2 = "neura.fused_op"(%14, %32, %34#0) <{frequency = 3 : i64, pattern_id = 8 : i64, pattern_name = "phi_start->add"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>):
      %69 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %70 = "neura.add"(%arg4, %69) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
      neura.yield results(%69, %70 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %36:4 = "neura.fused_op"(%34#0, %22, %34#1, %35#0, %31) <{frequency = 8 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:icmp->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<!llvm.ptr, i1>):
      %69 = "neura.icmp"(%arg2, %arg3) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %70 = neura.grant_predicate %arg4, %69 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %71 = neura.grant_predicate %arg5, %69 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %72 = neura.grant_predicate %arg6, %69 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%69, %70, %71, %72 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>)
    %37:2 = "neura.fused_op"(%4, %25, %36#0) <{frequency = 6 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:grant_once->fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>):
      %69 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
      %70 = neura.phi_start %69, %arg2 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %71 = neura.phi_start %70, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %72 = neura.grant_predicate %71, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%71, %72 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %38 = "neura.gep"(%31, %35#1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %39 = "neura.load"(%38) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %40 = "neura.icmp"(%39, %29) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %41 = "neura.sel"(%40, %39, %29) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %42 = "neura.gep"(%27, %35#1) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%41, %42) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %43 = "neura.or"(%35#1, %37#0) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %44 = "neura.gep"(%31, %43) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = "neura.load"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %46 = "neura.icmp"(%45, %29) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %47 = "neura.sel"(%46, %45, %29) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %48 = "neura.gep"(%27, %43) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%47, %48) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %49:2 = "neura.fused_op"(%0, %1, %18, %36#0) <{frequency = 9 : i64, pattern_id = 5 : i64, pattern_name = "fused_op:phi_start->phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i1, i1>):
      %69 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %70 = neura.phi_start %69, %arg4 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %71 = neura.grant_predicate %70, %arg5 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%70, %71 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    %50:4 = "neura.fused_op"(%36#0, %20, %37#0, %49#0) <{frequency = 3 : i64, pattern_id = 2 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>):
      %69 = "neura.not"(%arg2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %70 = neura.grant_predicate %arg3, %69 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %71 = neura.grant_predicate %arg4, %69 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %72 = neura.grant_predicate %arg5, %69 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%69, %70, %71, %72 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %51:2 = "neura.fused_op"(%9#1, %15, %36#0) <{frequency = 21 : i64, pattern_id = 6 : i64, pattern_name = "phi_start->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i1, i1>):
      %69 = neura.phi_start %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
      %70 = neura.grant_predicate %69, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%69, %70 : !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i64, i1>, !neura.data<i64, i1>)
    neura.ctrl_mov %36#1 -> %33 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %36#2 -> %32 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %36#3 -> %30 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %52 = neura.grant_predicate %29, %36#0 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %52 -> %28 : !neura.data<i32, i1> !neura.data<i32, i1>
    %53 = neura.grant_predicate %27, %36#0 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %53 -> %26 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %37#1 -> %25 : !neura.data<i64, i1> !neura.data<i64, i1>
    %54 = neura.grant_predicate %24, %36#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %54 -> %23 : !neura.data<i64, i1> !neura.data<i64, i1>
    %55 = neura.grant_predicate %22, %36#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %55 -> %21 : !neura.data<i64, i1> !neura.data<i64, i1>
    %56 = neura.grant_predicate %20, %36#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %56 -> %19 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %49#1 -> %18 : !neura.data<i64, i1> !neura.data<i64, i1>
    %57 = neura.grant_predicate %17, %36#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %57 -> %16 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %51#1 -> %15 : !neura.data<i64, i1> !neura.data<i64, i1>
    %58 = neura.grant_predicate %51#0, %50#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %59 = "neura.add"(%50#1, %50#2) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %60:2 = "neura.fused_op"(%59, %50#3) <{frequency = 14 : i64, pattern_id = 2 : i64, pattern_name = "icmp->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i64, i1>):
      %69 = "neura.icmp"(%arg2, %arg3) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
      %70 = neura.grant_predicate %69, %69 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
      neura.yield results(%69, %70 : !neura.data<i1, i1>, !neura.data<i1, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> (!neura.data<i1, i1>, !neura.data<i1, i1>)
    %61:4 = "neura.fused_op"(%60#0, %58, %59, %17, %50#0) <{frequency = 12 : i64, pattern_id = 1 : i64, pattern_name = "fused_op:fused_op:not->grant_predicate->grant_predicate->fused_op:grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i1, i1>, %arg3: !neura.data<i64, i1>, %arg4: !neura.data<i64, i1>, %arg5: !neura.data<i64, i1>, %arg6: !neura.data<i1, i1>):
      %69 = "neura.not"(%arg2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
      %70 = neura.grant_predicate %arg3, %69 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %71 = neura.grant_predicate %arg4, %69 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %72 = neura.grant_predicate %arg5, %arg6 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %73 = neura.grant_predicate %72, %69 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%69, %70, %71, %73 : !neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    }) : (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i1, i1>) -> (!neura.data<i1, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>)
    %62 = "neura.fused_op"(%22, %50#0, %61#0) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %69 = neura.grant_predicate %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %70 = neura.grant_predicate %69, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%70 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %63 = "neura.fused_op"(%24, %50#0, %61#0) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i64, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %69 = neura.grant_predicate %arg2, %arg3 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      %70 = neura.grant_predicate %69, %arg4 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
      neura.yield results(%70 : !neura.data<i64, i1>)
    }) : (!neura.data<i64, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i64, i1>
    %64 = "neura.fused_op"(%27, %50#0, %61#0) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %69 = neura.grant_predicate %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %70 = neura.grant_predicate %69, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%70 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    %65 = "neura.fused_op"(%29, %50#0, %61#0) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<i32, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %69 = neura.grant_predicate %arg2, %arg3 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      %70 = neura.grant_predicate %69, %arg4 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
      neura.yield results(%70 : !neura.data<i32, i1>)
    }) : (!neura.data<i32, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<i32, i1>
    %66 = "neura.fused_op"(%31, %50#0, %61#0) <{frequency = 9 : i64, pattern_id = 1 : i64, pattern_name = "grant_predicate->grant_predicate"}> ({
    ^bb0(%arg2: !neura.data<!llvm.ptr, i1>, %arg3: !neura.data<i1, i1>, %arg4: !neura.data<i1, i1>):
      %69 = neura.grant_predicate %arg2, %arg3 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      %70 = neura.grant_predicate %69, %arg4 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
      neura.yield results(%70 : !neura.data<!llvm.ptr, i1>)
    }) : (!neura.data<!llvm.ptr, i1>, !neura.data<i1, i1>, !neura.data<i1, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %61#2 -> %12 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %61#3 -> %10 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %61#1 -> %8 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %66 -> %7 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %65 -> %6 : !neura.data<i32, i1> !neura.data<i32, i1>
    neura.ctrl_mov %64 -> %5 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %67 = neura.grant_predicate %50#2, %61#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %67 -> %4 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %63 -> %3 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.ctrl_mov %62 -> %2 : !neura.data<i64, i1> !neura.data<i64, i1>
    %68 = neura.grant_predicate %50#3, %61#0 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %68 -> %1 : !neura.data<i64, i1> !neura.data<i64, i1>
    neura.return_void %60#1 : !neura.data<i1, i1>
    neura.yield
  }
}

