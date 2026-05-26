module attributes {dlti.dl_spec = #dlti.dl_spec<f128 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %7 = "neura.grant_once"() <{constant_value = 3 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.grant_once"() <{constant_value = 4 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.grant_once"() <{constant_value = 60 : i64}> : () -> !neura.data<i64, i1>
    %10 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<i64, i1>
    %12 = neura.phi_start %10, %11 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %13 = neura.reserve : !neura.data<i64, i1>
    %14 = neura.phi_start %9, %13 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %15 = neura.reserve : !neura.data<i64, i1>
    %16 = neura.phi_start %8, %15 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.phi_start %7, %17 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = neura.phi_start %6, %19 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = neura.phi_start %5, %21 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %23 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %24 = neura.phi_start %1, %23 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %25 = neura.reserve : !neura.data<i32, i1>
    %26 = neura.phi_start %4, %25 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %27 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %28 = neura.phi_start %0, %27 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %29 = neura.reserve : !neura.data<i64, i1>
    %30 = neura.phi_start %2, %29 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %31 = neura.reserve : !neura.data<i64, i1>
    %32 = neura.phi_start %3, %31 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %33 = neura.reserve : !neura.data<i64, i1>
    %34 = neura.phi_start %2, %33 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %35 = "neura.shl"(%34, %32) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %36 = neura.reserve : !neura.data<i64, i1>
    %37 = neura.phi_start %30, %36 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %38 = neura.reserve : !neura.data<i64, i1>
    %39 = neura.phi_start %32, %38 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = neura.phi_start %12, %40 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %42 = neura.reserve : !neura.data<i64, i1>
    %43 = neura.phi_start %34, %42 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %44 = neura.reserve : !neura.data<i64, i1>
    %45 = neura.phi_start %14, %44 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %46 = neura.reserve : !neura.data<i64, i1>
    %47 = neura.phi_start %16, %46 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %48 = neura.reserve : !neura.data<i64, i1>
    %49 = neura.phi_start %18, %48 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %50 = neura.reserve : !neura.data<i64, i1>
    %51 = neura.phi_start %20, %50 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %52 = neura.reserve : !neura.data<i64, i1>
    %53 = neura.phi_start %22, %52 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %54 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %55 = neura.phi_start %24, %54 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %56 = neura.reserve : !neura.data<i32, i1>
    %57 = neura.phi_start %26, %56 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %58 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %59 = neura.phi_start %28, %58 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %60 = neura.reserve : !neura.data<i64, i1>
    %61 = neura.phi_start %35, %60 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %62 = neura.reserve : !neura.data<i64, i1>
    %63 = neura.phi_start %30, %62 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %64 = "neura.add"(%63, %61) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %65 = "neura.gep"(%59, %64) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %66 = "neura.load"(%65) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %67 = "neura.icmp"(%66, %57) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %68 = "neura.sel"(%67, %66, %57) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %69 = "neura.gep"(%55, %64) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%68, %69) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %70 = "neura.or"(%64, %53) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %71 = "neura.gep"(%59, %70) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %72 = "neura.load"(%71) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %73 = "neura.icmp"(%72, %57) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %74 = "neura.sel"(%73, %72, %57) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %75 = "neura.gep"(%55, %70) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%74, %75) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %76 = "neura.or"(%64, %51) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %77 = "neura.gep"(%59, %76) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %78 = "neura.load"(%77) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %79 = "neura.icmp"(%78, %57) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %80 = "neura.sel"(%79, %78, %57) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %81 = "neura.gep"(%55, %76) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%80, %81) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %82 = "neura.or"(%64, %49) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %83 = "neura.gep"(%59, %82) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = "neura.load"(%83) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %85 = "neura.icmp"(%84, %57) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %86 = "neura.sel"(%85, %84, %57) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %87 = "neura.gep"(%55, %82) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%86, %87) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %88 = "neura.add"(%63, %47) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %89 = "neura.icmp"(%63, %45) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %90 = neura.grant_predicate %88, %89 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %90 -> %62 : !neura.data<i64, i1> !neura.data<i64, i1>
    %91 = neura.grant_predicate %61, %89 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %91 -> %60 : !neura.data<i64, i1> !neura.data<i64, i1>
    %92 = neura.grant_predicate %59, %89 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %92 -> %58 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %93 = neura.grant_predicate %57, %89 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %93 -> %56 : !neura.data<i32, i1> !neura.data<i32, i1>
    %94 = neura.grant_predicate %55, %89 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %94 -> %54 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %95 = neura.grant_predicate %53, %89 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %95 -> %52 : !neura.data<i64, i1> !neura.data<i64, i1>
    %96 = neura.grant_predicate %51, %89 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %96 -> %50 : !neura.data<i64, i1> !neura.data<i64, i1>
    %97 = neura.grant_predicate %49, %89 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %97 -> %48 : !neura.data<i64, i1> !neura.data<i64, i1>
    %98 = neura.grant_predicate %47, %89 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %98 -> %46 : !neura.data<i64, i1> !neura.data<i64, i1>
    %99 = neura.grant_predicate %45, %89 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %99 -> %44 : !neura.data<i64, i1> !neura.data<i64, i1>
    %100 = neura.grant_predicate %43, %89 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %100 -> %42 : !neura.data<i64, i1> !neura.data<i64, i1>
    %101 = neura.grant_predicate %41, %89 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %101 -> %40 : !neura.data<i64, i1> !neura.data<i64, i1>
    %102 = neura.grant_predicate %39, %89 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %102 -> %38 : !neura.data<i64, i1> !neura.data<i64, i1>
    %103 = neura.grant_predicate %37, %89 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %103 -> %36 : !neura.data<i64, i1> !neura.data<i64, i1>
    %104 = "neura.not"(%89) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %105 = neura.grant_predicate %43, %104 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %106 = neura.grant_predicate %53, %104 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %107 = neura.grant_predicate %41, %104 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %108 = neura.grant_predicate %39, %104 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %109 = neura.grant_predicate %37, %104 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %110 = neura.grant_predicate %59, %104 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %111 = neura.grant_predicate %57, %104 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    %112 = neura.grant_predicate %55, %104 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %113 = neura.grant_predicate %51, %104 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %114 = neura.grant_predicate %49, %104 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %115 = neura.grant_predicate %47, %104 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %116 = neura.grant_predicate %45, %104 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %117 = "neura.add"(%105, %106) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %118 = "neura.icmp"(%117, %107) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %119 = "neura.not"(%118) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %120 = neura.grant_predicate %117, %119 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %120 -> %33 : !neura.data<i64, i1> !neura.data<i64, i1>
    %121 = neura.grant_predicate %108, %119 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %121 -> %31 : !neura.data<i64, i1> !neura.data<i64, i1>
    %122 = neura.grant_predicate %109, %119 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %122 -> %29 : !neura.data<i64, i1> !neura.data<i64, i1>
    %123 = neura.grant_predicate %110, %119 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %123 -> %27 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %124 = neura.grant_predicate %111, %119 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %124 -> %25 : !neura.data<i32, i1> !neura.data<i32, i1>
    %125 = neura.grant_predicate %112, %119 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %125 -> %23 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %126 = neura.grant_predicate %106, %119 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %126 -> %21 : !neura.data<i64, i1> !neura.data<i64, i1>
    %127 = neura.grant_predicate %113, %119 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %127 -> %19 : !neura.data<i64, i1> !neura.data<i64, i1>
    %128 = neura.grant_predicate %114, %119 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %128 -> %17 : !neura.data<i64, i1> !neura.data<i64, i1>
    %129 = neura.grant_predicate %115, %119 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %129 -> %15 : !neura.data<i64, i1> !neura.data<i64, i1>
    %130 = neura.grant_predicate %116, %119 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %130 -> %13 : !neura.data<i64, i1> !neura.data<i64, i1>
    %131 = neura.grant_predicate %107, %119 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %131 -> %11 : !neura.data<i64, i1> !neura.data<i64, i1>
    %132 = neura.grant_predicate %118, %118 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %132 : !neura.data<i1, i1>
    neura.yield
  }
}

