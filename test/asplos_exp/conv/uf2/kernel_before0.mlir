module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.return %0 : i32
  }
  func.func @_Z6kernelPKiS0_Pi(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.noundef}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.constant"() <{value = "%arg2"}> : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
    %5 = "neura.constant"() <{value = 0 : i32}> : () -> !neura.data<i32, i1>
    %6 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.grant_once"() <{constant_value = 1022 : i64}> : () -> !neura.data<i64, i1>
    "neura.store"(%5, %3) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %10 = neura.reserve : !neura.data<i64, i1>
    %11 = neura.phi_start %9, %10 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %12 = neura.reserve : !neura.data<i64, i1>
    %13 = neura.phi_start %8, %12 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %14 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %15 = neura.phi_start %2, %14 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %16 = neura.reserve : !neura.data<i64, i1>
    %17 = neura.phi_start %7, %16 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %18 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %19 = neura.phi_start %1, %18 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %20 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %21 = neura.phi_start %0, %20 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %22 = neura.reserve : !neura.data<i64, i1>
    %23 = neura.phi_start %6, %22 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %24 = neura.reserve : !neura.data<i32, i1>
    %25 = neura.phi_start %4, %24 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %26 = "neura.gep"(%21, %23) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %27 = "neura.load"(%26) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %28 = "neura.gep"(%19, %23) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %29 = "neura.load"(%28) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %30 = "neura.mul"(%29, %27) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %31 = "neura.or"(%23, %17) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %32 = "neura.gep"(%21, %31) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %33 = "neura.load"(%32) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %34 = "neura.gep"(%19, %31) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = "neura.load"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %36 = "neura.mul"(%35, %33) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %37 = "neura.add"(%36, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %38 = "neura.add"(%37, %25) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%38, %15) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %39 = "neura.add"(%23, %13) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %40 = "neura.icmp"(%23, %11) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %41 = "neura.not"(%40) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %42 = neura.grant_predicate %38, %40 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %42 -> %24 : !neura.data<i32, i1> !neura.data<i32, i1>
    %43 = neura.grant_predicate %39, %40 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %43 -> %22 : !neura.data<i64, i1> !neura.data<i64, i1>
    %44 = neura.grant_predicate %21, %40 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %44 -> %20 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %45 = neura.grant_predicate %19, %40 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %45 -> %18 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %46 = neura.grant_predicate %17, %40 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %46 -> %16 : !neura.data<i64, i1> !neura.data<i64, i1>
    %47 = neura.grant_predicate %15, %40 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %47 -> %14 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %48 = neura.grant_predicate %13, %40 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %48 -> %12 : !neura.data<i64, i1> !neura.data<i64, i1>
    %49 = neura.grant_predicate %11, %40 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %49 -> %10 : !neura.data<i64, i1> !neura.data<i64, i1>
    %50 = neura.grant_predicate %41, %41 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %50 : !neura.data<i1, i1>
    neura.yield
  }
}

