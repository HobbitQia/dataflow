module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.return %0 : i32
  }
  func.func @_Z6kernelPiS_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.writeonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", dataflow_mode = "predicate", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.grant_once"() <{constant_value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.grant_once"() <{constant_value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.grant_once"() <{constant_value = 0 : i64}> : () -> !neura.data<i64, i1>
    %3 = "neura.grant_once"() <{constant_value = 6 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.grant_once"() <{constant_value = 0 : i32}> : () -> !neura.data<i32, i1>
    %5 = "neura.grant_once"() <{constant_value = 1 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.grant_once"() <{constant_value = 2 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.grant_once"() <{constant_value = 62 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.phi_start %8, %9 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.phi_start %7, %11 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.phi_start %6, %13 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.phi_start %5, %15 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %18 = neura.phi_start %1, %17 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %19 = neura.reserve : !neura.data<i32, i1>
    %20 = neura.phi_start %4, %19 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %21 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %22 = neura.phi_start %0, %21 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %23 = neura.reserve : !neura.data<i64, i1>
    %24 = neura.phi_start %2, %23 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %25 = neura.reserve : !neura.data<i64, i1>
    %26 = neura.phi_start %3, %25 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %27 = neura.reserve : !neura.data<i64, i1>
    %28 = neura.phi_start %2, %27 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %29 = "neura.shl"(%28, %26) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = neura.phi_start %24, %30 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %32 = neura.reserve : !neura.data<i64, i1>
    %33 = neura.phi_start %26, %32 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %34 = neura.reserve : !neura.data<i64, i1>
    %35 = neura.phi_start %10, %34 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = neura.phi_start %28, %36 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39 = neura.phi_start %12, %38 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = neura.phi_start %14, %40 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %42 = neura.reserve : !neura.data<i64, i1>
    %43 = neura.phi_start %16, %42 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %44 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %45 = neura.phi_start %18, %44 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %46 = neura.reserve : !neura.data<i32, i1>
    %47 = neura.phi_start %20, %46 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %48 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %49 = neura.phi_start %22, %48 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51 = neura.phi_start %29, %50 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %52 = neura.reserve : !neura.data<i64, i1>
    %53 = neura.phi_start %24, %52 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %54 = "neura.add"(%53, %51) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %55 = "neura.gep"(%49, %54) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = "neura.load"(%55) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %57 = "neura.icmp"(%56, %47) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %58 = "neura.sel"(%57, %56, %47) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %59 = "neura.gep"(%45, %54) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%58, %59) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %60 = "neura.or"(%54, %43) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %61 = "neura.gep"(%49, %60) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %62 = "neura.load"(%61) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %63 = "neura.icmp"(%62, %47) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %64 = "neura.sel"(%63, %62, %47) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %65 = "neura.gep"(%45, %60) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%64, %65) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %66 = "neura.add"(%53, %41) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %67 = "neura.icmp"(%53, %39) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %68 = neura.grant_predicate %66, %67 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %68 -> %52 : !neura.data<i64, i1> !neura.data<i64, i1>
    %69 = neura.grant_predicate %51, %67 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %69 -> %50 : !neura.data<i64, i1> !neura.data<i64, i1>
    %70 = neura.grant_predicate %49, %67 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %70 -> %48 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %71 = neura.grant_predicate %47, %67 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %71 -> %46 : !neura.data<i32, i1> !neura.data<i32, i1>
    %72 = neura.grant_predicate %45, %67 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %72 -> %44 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %73 = neura.grant_predicate %43, %67 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %73 -> %42 : !neura.data<i64, i1> !neura.data<i64, i1>
    %74 = neura.grant_predicate %41, %67 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %74 -> %40 : !neura.data<i64, i1> !neura.data<i64, i1>
    %75 = neura.grant_predicate %39, %67 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %75 -> %38 : !neura.data<i64, i1> !neura.data<i64, i1>
    %76 = neura.grant_predicate %37, %67 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %76 -> %36 : !neura.data<i64, i1> !neura.data<i64, i1>
    %77 = neura.grant_predicate %35, %67 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %77 -> %34 : !neura.data<i64, i1> !neura.data<i64, i1>
    %78 = neura.grant_predicate %33, %67 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %78 -> %32 : !neura.data<i64, i1> !neura.data<i64, i1>
    %79 = neura.grant_predicate %31, %67 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %79 -> %30 : !neura.data<i64, i1> !neura.data<i64, i1>
    %80 = "neura.not"(%67) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %81 = neura.grant_predicate %37, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %82 = neura.grant_predicate %43, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %83 = neura.grant_predicate %35, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %84 = neura.grant_predicate %33, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %85 = neura.grant_predicate %31, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %86 = neura.grant_predicate %49, %80 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %87 = neura.grant_predicate %47, %80 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    %88 = neura.grant_predicate %45, %80 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %89 = neura.grant_predicate %41, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %90 = neura.grant_predicate %39, %80 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %91 = "neura.add"(%81, %82) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %92 = "neura.icmp"(%91, %83) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %93 = "neura.not"(%92) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %94 = neura.grant_predicate %91, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %94 -> %27 : !neura.data<i64, i1> !neura.data<i64, i1>
    %95 = neura.grant_predicate %84, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %95 -> %25 : !neura.data<i64, i1> !neura.data<i64, i1>
    %96 = neura.grant_predicate %85, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %96 -> %23 : !neura.data<i64, i1> !neura.data<i64, i1>
    %97 = neura.grant_predicate %86, %93 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %97 -> %21 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %98 = neura.grant_predicate %87, %93 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %98 -> %19 : !neura.data<i32, i1> !neura.data<i32, i1>
    %99 = neura.grant_predicate %88, %93 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %99 -> %17 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %100 = neura.grant_predicate %82, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %100 -> %15 : !neura.data<i64, i1> !neura.data<i64, i1>
    %101 = neura.grant_predicate %89, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %101 -> %13 : !neura.data<i64, i1> !neura.data<i64, i1>
    %102 = neura.grant_predicate %90, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %102 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    %103 = neura.grant_predicate %83, %93 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %103 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    %104 = neura.grant_predicate %92, %92 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %104 : !neura.data<i1, i1>
    neura.yield
  }
}

