module attributes {dlti.dl_spec = #dlti.dl_spec<f128 = dense<128> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 14.0.0-1ubuntu1.1"} {
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
    %7 = "neura.constant"() <{value = 3 : i64}> : () -> !neura.data<i64, i1>
    %8 = "neura.constant"() <{value = 4 : i64}> : () -> !neura.data<i64, i1>
    %9 = "neura.constant"() <{value = 60 : i64}> : () -> !neura.data<i64, i1>
    %10 = "neura.constant"() <{value = 64 : i64}> : () -> !neura.data<i64, i1>
    neura.br %2, %3, %2, %0, %4, %1, %5, %6, %7, %8, %9, %10 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb1(%11: !neura.data<i64, i1>, %12: !neura.data<i64, i1>, %13: !neura.data<i64, i1>, %14: !neura.data<!llvm.ptr, i1>, %15: !neura.data<i32, i1>, %16: !neura.data<!llvm.ptr, i1>, %17: !neura.data<i64, i1>, %18: !neura.data<i64, i1>, %19: !neura.data<i64, i1>, %20: !neura.data<i64, i1>, %21: !neura.data<i64, i1>, %22: !neura.data<i64, i1>):  // 2 preds: ^bb0, ^bb3
    %23 = "neura.shl"(%11, %12) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    neura.br %13, %23, %14, %15, %16, %17, %18, %19, %20, %21, %11, %22, %12, %13 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb2
  ^bb2(%24: !neura.data<i64, i1>, %25: !neura.data<i64, i1>, %26: !neura.data<!llvm.ptr, i1>, %27: !neura.data<i32, i1>, %28: !neura.data<!llvm.ptr, i1>, %29: !neura.data<i64, i1>, %30: !neura.data<i64, i1>, %31: !neura.data<i64, i1>, %32: !neura.data<i64, i1>, %33: !neura.data<i64, i1>, %34: !neura.data<i64, i1>, %35: !neura.data<i64, i1>, %36: !neura.data<i64, i1>, %37: !neura.data<i64, i1>):  // 2 preds: ^bb1, ^bb2
    %38 = "neura.add"(%24, %25) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %39 = "neura.gep"(%26, %38) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %40 = "neura.load"(%39) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %41 = "neura.icmp"(%40, %27) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %42 = "neura.sel"(%41, %40, %27) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %43 = "neura.gep"(%28, %38) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%42, %43) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %44 = "neura.or"(%38, %29) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %45 = "neura.gep"(%26, %44) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %46 = "neura.load"(%45) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %47 = "neura.icmp"(%46, %27) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %48 = "neura.sel"(%47, %46, %27) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %49 = "neura.gep"(%28, %44) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%48, %49) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %50 = "neura.or"(%38, %30) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %51 = "neura.gep"(%26, %50) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %52 = "neura.load"(%51) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %53 = "neura.icmp"(%52, %27) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %54 = "neura.sel"(%53, %52, %27) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %55 = "neura.gep"(%28, %50) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%54, %55) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %56 = "neura.or"(%38, %31) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %57 = "neura.gep"(%26, %56) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %58 = "neura.load"(%57) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %59 = "neura.icmp"(%58, %27) <{cmpType = "sgt"}> : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i1, i1>
    %60 = "neura.sel"(%59, %58, %27) : (!neura.data<i1, i1>, !neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %61 = "neura.gep"(%28, %56) <{operandSegmentSizes = array<i32: 1, 1>}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%60, %61) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %62 = "neura.add"(%24, %32) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %63 = "neura.icmp"(%24, %33) <{cmpType = "ult"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %63 : !neura.data<i1, i1> then %62, %25, %26, %27, %28, %29, %30, %31, %32, %33, %34, %35, %36, %37 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb2 else %34, %29, %35, %36, %37, %26, %27, %28, %30, %31, %32, %33 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb3
  ^bb3(%64: !neura.data<i64, i1>, %65: !neura.data<i64, i1>, %66: !neura.data<i64, i1>, %67: !neura.data<i64, i1>, %68: !neura.data<i64, i1>, %69: !neura.data<!llvm.ptr, i1>, %70: !neura.data<i32, i1>, %71: !neura.data<!llvm.ptr, i1>, %72: !neura.data<i64, i1>, %73: !neura.data<i64, i1>, %74: !neura.data<i64, i1>, %75: !neura.data<i64, i1>):  // pred: ^bb2
    %76 = "neura.add"(%64, %65) : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i64, i1>
    %77 = "neura.icmp"(%76, %66) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %77 : !neura.data<i1, i1> then %77 : !neura.data<i1, i1> to ^bb4 else %76, %67, %68, %69, %70, %71, %65, %72, %73, %74, %75, %66 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb1
  ^bb4(%78: !neura.data<i1, i1>):  // pred: ^bb3
    "neura.return"(%78) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

