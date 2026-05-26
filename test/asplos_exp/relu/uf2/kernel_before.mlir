module attributes {dlti.dl_spec = #dlti.dl_spec<f16 = dense<16> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
  llvm.func local_unnamed_addr @main() -> (i32 {llvm.noundef}) attributes {frame_pointer = #llvm.framePointerKind<none>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic"} {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.return %0 : i32
  }
  func.func @_Z6kernelPiS_(%arg0: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.noundef, llvm.writeonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_unwind, passthrough = ["mustprogress", "nofree", "norecurse", "nosync", ["uwtable", "2"], ["min-legal-vector-width", "0"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<!llvm.ptr, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<!llvm.ptr, i1>
    %2 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %3 = "neura.constant"() <{value = 6 : i64}> : () -> !neura.data<i64, i1>
    %4 = "neura.constant"() <{value = 0 : i32}> : () -> !neura.data<i32, i1>
    %5 = "neura.constant"() <{value = 1 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.constant"() <{value = 2 : i64}> : () -> !neura.data<i64, i1>
    %7 = "neura.constant"() <{value = 62 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.constant"() <{value = 64 : i64}> : () -> !neura.data<i64, i1>
    neura.br %2, %3, %2, %0, %4, %1, %5, %6, %7, %8 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb1(%9: !neura.data<i64, i1>, %10: !neura.data<i64, i1>, %11: !neura.data<i64, i1>, %12: !neura.data<!llvm.ptr, i1>, %13: !neura.data<i32, i1>, %14: !neura.data<!llvm.ptr, i1>, %15: !neura.data<i64, i1>, %16: !neura.data<i64, i1>, %17: !neura.data<i64, i1>, %18: !neura.data<i64, i1>):  // 2 preds: ^bb0, ^bb3
    %19 = "neura.shl"(%9, %10) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.br %11, %19, %12, %13, %14, %15, %16, %17, %9, %18, %10, %11 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb2
  ^bb2(%20: !neura.data<i64, i1>, %21: !neura.data<i64, i1>, %22: !neura.data<!llvm.ptr, i1>, %23: !neura.data<i32, i1>, %24: !neura.data<!llvm.ptr, i1>, %25: !neura.data<i64, i1>, %26: !neura.data<i64, i1>, %27: !neura.data<i64, i1>, %28: !neura.data<i64, i1>, %29: !neura.data<i64, i1>, %30: !neura.data<i64, i1>, %31: !neura.data<i64, i1>):  // 2 preds: ^bb1, ^bb2
    %32 = "neura.add"(%20, %21) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %33 = "neura.gep"(%22, %32) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %34 = "neura.load"(%33) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %35 = "neura.icmp"(%34, %23) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %36 = "neura.sel"(%35, %34, %23) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %37 = "neura.gep"(%24, %32) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%36, %37) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %38 = "neura.or"(%32, %25) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = "neura.gep"(%22, %38) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = "neura.load"(%39) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %41 = "neura.icmp"(%40, %23) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %42 = "neura.sel"(%41, %40, %23) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %43 = "neura.gep"(%24, %38) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%42, %43) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %44 = "neura.add"(%20, %26) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.icmp"(%20, %27) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %45 : !neura.data<i1, i1> then %44, %21, %22, %23, %24, %25, %26, %27, %28, %29, %30, %31 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb2 else %28, %25, %29, %30, %31, %22, %23, %24, %26, %27 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb3
  ^bb3(%46: !neura.data<i64, i1>, %47: !neura.data<i64, i1>, %48: !neura.data<i64, i1>, %49: !neura.data<i64, i1>, %50: !neura.data<i64, i1>, %51: !neura.data<!llvm.ptr, i1>, %52: !neura.data<i32, i1>, %53: !neura.data<!llvm.ptr, i1>, %54: !neura.data<i64, i1>, %55: !neura.data<i64, i1>):  // pred: ^bb2
    %56 = "neura.add"(%46, %47) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = "neura.icmp"(%56, %48) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %57 : !neura.data<i1, i1> then %57 : !neura.data<i1, i1> to ^bb4 else %56, %49, %50, %51, %52, %53, %47, %54, %55, %48 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb4(%58: !neura.data<i1, i1>):  // pred: ^bb3
    "neura.return"(%58) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

