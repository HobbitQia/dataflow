module attributes {dlti.dl_spec = #dlti.dl_spec<i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i8 = dense<8> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %6 = "neura.grant_once"() <{constant_value = 64 : i64}> : () -> !neura.data<i64, i1>
    %7 = neura.reserve : !neura.data<i64, i1>
    %8 = neura.phi_start %6, %7 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %9 = neura.reserve : !neura.data<i64, i1>
    %10 = neura.phi_start %5, %9 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %11 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %12 = neura.phi_start %1, %11 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %13 = neura.reserve : !neura.data<i32, i1>
    %14 = neura.phi_start %4, %13 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %15 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %16 = neura.phi_start %0, %15 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %17 = neura.reserve : !neura.data<i64, i1>
    %18 = neura.phi_start %2, %17 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %19 = neura.reserve : !neura.data<i64, i1>
    %20 = neura.phi_start %3, %19 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %21 = neura.reserve : !neura.data<i64, i1>
    %22 = neura.phi_start %2, %21 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %23 = "neura.shl"(%22, %20) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %24 = neura.reserve : !neura.data<i64, i1>
    %25 = neura.phi_start %18, %24 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %26 = neura.reserve : !neura.data<i64, i1>
    %27 = neura.phi_start %20, %26 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %28 = neura.reserve : !neura.data<i64, i1>
    %29 = neura.phi_start %22, %28 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %30 = neura.reserve : !neura.data<i64, i1>
    %31 = neura.phi_start %8, %30 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %32 = neura.reserve : !neura.data<i64, i1>
    %33 = neura.phi_start %10, %32 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %34 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %35 = neura.phi_start %12, %34 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %36 = neura.reserve : !neura.data<i32, i1>
    %37 = neura.phi_start %14, %36 : !neura.data<i32, i1>, !neura.data<i32, i1> -> !neura.data<i32, i1>
    %38 = neura.reserve : !neura.data<!llvm.ptr, i1>
    %39 = neura.phi_start %16, %38 : !neura.data<!llvm.ptr, i1>, !neura.data<!llvm.ptr, i1> -> !neura.data<!llvm.ptr, i1>
    %40 = neura.reserve : !neura.data<i64, i1>
    %41 = neura.phi_start %23, %40 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %42 = neura.reserve : !neura.data<i64, i1>
    %43 = neura.phi_start %18, %42 : !neura.data<i64, i1>, !neura.data<i64, i1> -> !neura.data<i64, i1>
    %44 = "neura.add"(%43, %41) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.gep"(%39, %44) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.load"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %47 = "neura.icmp"(%46, %37) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %48 = "neura.sel"(%47, %46, %37) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %49 = "neura.gep"(%35, %44) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%48, %49) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %50 = "neura.add"(%43, %33) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.icmp"(%50, %31) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %52 = "neura.not"(%51) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %53 = neura.grant_predicate %50, %52 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %53 -> %42 : !neura.data<i64, i1> !neura.data<i64, i1>
    %54 = neura.grant_predicate %41, %52 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %54 -> %40 : !neura.data<i64, i1> !neura.data<i64, i1>
    %55 = neura.grant_predicate %39, %52 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %55 -> %38 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %56 = neura.grant_predicate %37, %52 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %56 -> %36 : !neura.data<i32, i1> !neura.data<i32, i1>
    %57 = neura.grant_predicate %35, %52 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %57 -> %34 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %58 = neura.grant_predicate %33, %52 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %58 -> %32 : !neura.data<i64, i1> !neura.data<i64, i1>
    %59 = neura.grant_predicate %31, %52 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %59 -> %30 : !neura.data<i64, i1> !neura.data<i64, i1>
    %60 = neura.grant_predicate %29, %52 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %60 -> %28 : !neura.data<i64, i1> !neura.data<i64, i1>
    %61 = neura.grant_predicate %27, %52 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %61 -> %26 : !neura.data<i64, i1> !neura.data<i64, i1>
    %62 = neura.grant_predicate %25, %52 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %62 -> %24 : !neura.data<i64, i1> !neura.data<i64, i1>
    %63 = neura.grant_predicate %29, %51 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %64 = neura.grant_predicate %33, %51 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %65 = neura.grant_predicate %31, %51 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %66 = neura.grant_predicate %27, %51 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %67 = neura.grant_predicate %25, %51 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    %68 = neura.grant_predicate %39, %51 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %69 = neura.grant_predicate %37, %51 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    %70 = neura.grant_predicate %35, %51 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.add"(%63, %64) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %72 = "neura.icmp"(%71, %65) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    %73 = "neura.not"(%72) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    %74 = neura.grant_predicate %71, %73 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %74 -> %21 : !neura.data<i64, i1> !neura.data<i64, i1>
    %75 = neura.grant_predicate %66, %73 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %75 -> %19 : !neura.data<i64, i1> !neura.data<i64, i1>
    %76 = neura.grant_predicate %67, %73 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %76 -> %17 : !neura.data<i64, i1> !neura.data<i64, i1>
    %77 = neura.grant_predicate %68, %73 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %77 -> %15 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %78 = neura.grant_predicate %69, %73 : !neura.data<i32, i1>, !neura.data<i1, i1> -> !neura.data<i32, i1>
    neura.ctrl_mov %78 -> %13 : !neura.data<i32, i1> !neura.data<i32, i1>
    %79 = neura.grant_predicate %70, %73 : !neura.data<!llvm.ptr, i1>, !neura.data<i1, i1> -> !neura.data<!llvm.ptr, i1>
    neura.ctrl_mov %79 -> %11 : !neura.data<!llvm.ptr, i1> !neura.data<!llvm.ptr, i1>
    %80 = neura.grant_predicate %64, %73 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %80 -> %9 : !neura.data<i64, i1> !neura.data<i64, i1>
    %81 = neura.grant_predicate %65, %73 : !neura.data<i64, i1>, !neura.data<i1, i1> -> !neura.data<i64, i1>
    neura.ctrl_mov %81 -> %7 : !neura.data<i64, i1> !neura.data<i64, i1>
    %82 = neura.grant_predicate %72, %72 : !neura.data<i1, i1>, !neura.data<i1, i1> -> !neura.data<i1, i1>
    neura.return_void %82 : !neura.data<i1, i1>
    neura.yield
  }
}

