module attributes {dlti.dl_spec = #dlti.dl_spec<i64 = dense<64> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  func.func @kernel(%arg0: i32, %arg1: i32, %arg2: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture}, %arg4: !llvm.ptr {llvm.nocapture}, %arg5: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg6: !llvm.ptr {llvm.nocapture, llvm.readonly}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, unsafe_fp_math = false, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<i32, i1>
    %1 = "neura.constant"() <{value = "%arg1"}> : () -> !neura.data<i32, i1>
    %2 = "neura.constant"() <{value = "%arg3"}> : () -> !neura.data<!llvm.ptr, i1>
    %3 = "neura.constant"() <{value = "%arg4"}> : () -> !neura.data<!llvm.ptr, i1>
    %4 = "neura.constant"() <{value = 0 : i8}> : () -> !neura.data<i8, i1>
    %5 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %6 = "neura.icmp"(%0) <{cmpType = "sgt"}> {rhs_value = 0 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    neura.cond_br %6 : !neura.data<i1, i1> then %0, %2, %4, %1, %5 : !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i8, i1>, !neura.data<i32, i1>, !neura.data<i64, i1> to ^bb1 else %1, %3, %4 : !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i8, i1> to ^bb2
  ^bb1(%7: !neura.data<i32, i1>, %8: !neura.data<!llvm.ptr, i1>, %9: !neura.data<i8, i1>, %10: !neura.data<i32, i1>, %11: !neura.data<i64, i1>):  // pred: ^bb0
    %12 = neura.zext %7 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %13 = "neura.shl"(%12) {rhs_value = 3 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    "neura.memset"(%8, %9, %13) <{is_volatile = false}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i8, i1>, !neura.data<i64, i1>) -> ()
    %14 = "neura.icmp"(%10) <{cmpType = "sgt"}> {rhs_value = 0 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    %15 = "neura.not"(%14) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.cond_br %14 : !neura.data<i1, i1> then %7, %10, %11 : !neura.data<i32, i1>, !neura.data<i32, i1>, !neura.data<i64, i1> to ^bb4 else %15 : !neura.data<i1, i1> to ^bb8
  ^bb2(%16: !neura.data<i32, i1>, %17: !neura.data<!llvm.ptr, i1>, %18: !neura.data<i8, i1>):  // pred: ^bb0
    %19 = "neura.icmp"(%16) <{cmpType = "sgt"}> {rhs_value = 0 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    %20 = "neura.not"(%19) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.cond_br %19 : !neura.data<i1, i1> then %16, %17, %18 : !neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>, !neura.data<i8, i1> to ^bb3 else %20 : !neura.data<i1, i1> to ^bb8
  ^bb3(%21: !neura.data<i32, i1>, %22: !neura.data<!llvm.ptr, i1>, %23: !neura.data<i8, i1>):  // pred: ^bb2
    %24 = neura.zext %21 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %25 = "neura.shl"(%24) {rhs_value = 3 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    "neura.memset"(%22, %23, %25) <{is_volatile = false}> : (!neura.data<!llvm.ptr, i1>, !neura.data<i8, i1>, !neura.data<i64, i1>) -> ()
    "neura.return"(%25) {return_type = "void"} : (!neura.data<i64, i1>) -> ()
  ^bb4(%26: !neura.data<i32, i1>, %27: !neura.data<i32, i1>, %28: !neura.data<i64, i1>):  // pred: ^bb1
    %29 = neura.sext %26 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %30 = neura.zext %27 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    neura.br %28, %28, %30 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb5
  ^bb5(%31: !neura.data<i64, i1>, %32: !neura.data<i64, i1>, %33: !neura.data<i64, i1>):  // 2 preds: ^bb4, ^bb7
    %34 = "neura.gep"(%31) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg4"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    "neura.store"(%34) {lhs_value = 0.000000e+00 : f64} : (!neura.data<!llvm.ptr, i1>) -> ()
    %35 = "neura.gep"(%31) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg6"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    neura.br %32, %31, %33, %32 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb6
  ^bb6(%36: !neura.data<i64, i1>, %37: !neura.data<i64, i1>, %38: !neura.data<i64, i1>, %39: !neura.data<i64, i1>):  // 2 preds: ^bb5, ^bb6
    %40 = "neura.gep"(%36) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg3"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %41 = "neura.load"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %42 = "neura.load"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %43 = "neura.gep"(%37, %36) <{operandSegmentSizes = array<i32: 0, 2>}> {lhs_value = "%arg2"} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %44 = "neura.load"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %45 = "neura.fmul"(%42, %44) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    %46 = "neura.fadd"(%41, %45) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    "neura.store"(%46, %40) : (!neura.data<f64, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %47 = "neura.or"(%36) <{rhs_value = 1 : i64}> : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %48 = "neura.gep"(%47) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg3"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %49 = "neura.load"(%48) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %50 = "neura.load"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %51 = "neura.gep"(%37, %47) <{operandSegmentSizes = array<i32: 0, 2>}> {lhs_value = "%arg2"} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %52 = "neura.load"(%51) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %53 = "neura.fmul"(%50, %52) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    %54 = "neura.fadd"(%49, %53) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    "neura.store"(%54, %48) : (!neura.data<f64, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %55 = "neura.or"(%36) <{rhs_value = 2 : i64}> : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %56 = "neura.gep"(%55) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg3"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %57 = "neura.load"(%56) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %58 = "neura.load"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %59 = "neura.gep"(%37, %55) <{operandSegmentSizes = array<i32: 0, 2>}> {lhs_value = "%arg2"} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %60 = "neura.load"(%59) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %61 = "neura.fmul"(%58, %60) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    %62 = "neura.fadd"(%57, %61) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    "neura.store"(%62, %56) : (!neura.data<f64, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %63 = "neura.or"(%36) <{rhs_value = 3 : i64}> : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %64 = "neura.gep"(%63) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg3"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %65 = "neura.load"(%64) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %66 = "neura.load"(%35) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %67 = "neura.gep"(%37, %63) <{operandSegmentSizes = array<i32: 0, 2>}> {lhs_value = "%arg2"} : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %68 = "neura.load"(%67) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %69 = "neura.fmul"(%66, %68) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    %70 = "neura.fadd"(%65, %69) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    "neura.store"(%70, %64) : (!neura.data<f64, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %71 = "neura.load"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %72 = "neura.load"(%43) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %73 = "neura.gep"(%36) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg5"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %74 = "neura.load"(%73) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %75 = "neura.fmul"(%72, %74) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    %76 = "neura.fadd"(%71, %75) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    "neura.store"(%76, %34) : (!neura.data<f64, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %77 = "neura.load"(%51) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %78 = "neura.gep"(%47) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg5"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %79 = "neura.load"(%78) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %80 = "neura.fmul"(%77, %79) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    %81 = "neura.fadd"(%76, %80) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    "neura.store"(%81, %34) : (!neura.data<f64, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %82 = "neura.load"(%59) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %83 = "neura.gep"(%55) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg5"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %84 = "neura.load"(%83) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %85 = "neura.fmul"(%82, %84) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    %86 = "neura.fadd"(%81, %85) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    "neura.store"(%86, %34) : (!neura.data<f64, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %87 = "neura.load"(%67) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %88 = "neura.gep"(%63) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg5"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %89 = "neura.load"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<f64, i1>
    %90 = "neura.fmul"(%87, %89) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    %91 = "neura.fadd"(%86, %90) : (!neura.data<f64, i1>, !neura.data<f64, i1>) -> !neura.data<f64, i1>
    "neura.store"(%91, %34) : (!neura.data<f64, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %92 = "neura.add"(%36) {rhs_value = 4 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %93 = "neura.icmp"(%92, %29) <{cmpType = "slt"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %93 : !neura.data<i1, i1> then %92, %37, %38, %39 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb6 else %37, %38, %39 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb7
  ^bb7(%94: !neura.data<i64, i1>, %95: !neura.data<i64, i1>, %96: !neura.data<i64, i1>):  // pred: ^bb6
    %97 = "neura.add"(%94) {rhs_value = 1 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %98 = "neura.icmp"(%97, %95) <{cmpType = "eq"}> : (!neura.data<i64, i1>, !neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %98 : !neura.data<i1, i1> then %98 : !neura.data<i1, i1> to ^bb8 else %97, %96, %95 : !neura.data<i64, i1>, !neura.data<i64, i1>, !neura.data<i64, i1> to ^bb5
  ^bb8(%99: !neura.data<i1, i1>):  // 3 preds: ^bb1, ^bb2, ^bb7
    "neura.return"(%99) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

