module attributes {dlti.dl_spec = #dlti.dl_spec<i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, f80 = dense<128> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, i1 = dense<8> : vector<2xi64>, "dlti.endianness" = "little", "dlti.stack_alignment" = 128 : i64>, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  func.func @kernel(%arg0: i32, %arg1: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg2: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg3: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg4: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg5: !llvm.ptr {llvm.nocapture}) -> !llvm.void attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["nofree", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, unsafe_fp_math = false, visibility_ = 0 : i64} {
    %0 = "neura.constant"() <{value = "%arg0"}> : () -> !neura.data<i32, i1>
    %1 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %2 = "neura.icmp"(%0) <{cmpType = "sgt"}> {rhs_value = 0 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    %3 = "neura.not"(%2) : (!neura.data<i1, i1>) -> !neura.data<i1, i1>
    neura.cond_br %2 : !neura.data<i1, i1> then %0, %1 : !neura.data<i32, i1>, !neura.data<i64, i1> to ^bb1 else %3 : !neura.data<i1, i1> to ^bb6
  ^bb1(%4: !neura.data<i32, i1>, %5: !neura.data<i64, i1>):  // pred: ^bb0
    %6 = "neura.add"(%4) {rhs_value = -1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %7 = "neura.and"(%4) {rhs_value = 3 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %8 = "neura.icmp"(%6) <{cmpType = "ult"}> {rhs_value = 3 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    neura.cond_br %8 : !neura.data<i1, i1> then %5 : !neura.data<i64, i1> to ^bb4 else %4, %5 : !neura.data<i32, i1>, !neura.data<i64, i1> to ^bb2
  ^bb2(%9: !neura.data<i32, i1>, %10: !neura.data<i64, i1>):  // pred: ^bb1
    %11 = "neura.and"(%9) {rhs_value = -4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    neura.br %10, %11 : !neura.data<i64, i1>, !neura.data<i32, i1> to ^bb3
  ^bb3(%12: !neura.data<i64, i1>, %13: !neura.data<i32, i1>):  // 2 preds: ^bb2, ^bb3
    %14 = "neura.gep"(%12) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg1"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %15 = "neura.load"(%14) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %16 = "neura.gep"(%12) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg2"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %17 = "neura.load"(%16) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %18 = neura.sext %17 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %19 = "neura.gep"(%18) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg4"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %20 = "neura.load"(%19) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %21 = "neura.mul"(%20, %15) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %22 = "neura.gep"(%12) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg3"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %23 = "neura.load"(%22) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %24 = neura.sext %23 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %25 = "neura.gep"(%24) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg5"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %26 = "neura.load"(%25) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %27 = "neura.add"(%26, %21) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%27, %25) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %28 = "neura.or"(%12) {rhs_value = 1 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %29 = "neura.gep"(%28) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg1"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %30 = "neura.load"(%29) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %31 = "neura.gep"(%28) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg2"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %32 = "neura.load"(%31) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %33 = neura.sext %32 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %34 = "neura.gep"(%33) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg4"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %35 = "neura.load"(%34) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %36 = "neura.mul"(%35, %30) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %37 = "neura.gep"(%28) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg3"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %38 = "neura.load"(%37) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %39 = neura.sext %38 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %40 = "neura.gep"(%39) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg5"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %41 = "neura.load"(%40) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %42 = "neura.add"(%41, %36) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%42, %40) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %43 = "neura.or"(%12) {rhs_value = 2 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %44 = "neura.gep"(%43) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg1"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %45 = "neura.load"(%44) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %46 = "neura.gep"(%43) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg2"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %47 = "neura.load"(%46) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %48 = neura.sext %47 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %49 = "neura.gep"(%48) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg4"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %50 = "neura.load"(%49) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %51 = "neura.mul"(%50, %45) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %52 = "neura.gep"(%43) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg3"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %53 = "neura.load"(%52) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %54 = neura.sext %53 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %55 = "neura.gep"(%54) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg5"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %56 = "neura.load"(%55) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %57 = "neura.add"(%56, %51) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%57, %55) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %58 = "neura.or"(%12) {rhs_value = 3 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %59 = "neura.gep"(%58) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg1"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %60 = "neura.load"(%59) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %61 = "neura.gep"(%58) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg2"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %62 = "neura.load"(%61) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %63 = neura.sext %62 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %64 = "neura.gep"(%63) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg4"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %65 = "neura.load"(%64) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %66 = "neura.mul"(%65, %60) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %67 = "neura.gep"(%58) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg3"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %68 = "neura.load"(%67) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %69 = neura.sext %68 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %70 = "neura.gep"(%69) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg5"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %71 = "neura.load"(%70) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %72 = "neura.add"(%71, %66) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%72, %70) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %73 = "neura.add"(%12) {rhs_value = 4 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %74 = "neura.add"(%13) {rhs_value = -4 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %75 = "neura.icmp"(%74) <{cmpType = "eq"}> {rhs_value = 0 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    neura.cond_br %75 : !neura.data<i1, i1> then %73 : !neura.data<i64, i1> to ^bb4 else %73, %74 : !neura.data<i64, i1>, !neura.data<i32, i1> to ^bb3
  ^bb4(%76: !neura.data<i64, i1>):  // 2 preds: ^bb1, ^bb3
    %77 = "neura.icmp"(%7) <{cmpType = "eq"}> {rhs_value = 0 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    neura.cond_br %77 : !neura.data<i1, i1> then %77 : !neura.data<i1, i1> to ^bb6 else %76, %7 : !neura.data<i64, i1>, !neura.data<i32, i1> to ^bb5
  ^bb5(%78: !neura.data<i64, i1>, %79: !neura.data<i32, i1>):  // 2 preds: ^bb4, ^bb5
    %80 = "neura.gep"(%78) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg1"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %81 = "neura.load"(%80) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %82 = "neura.gep"(%78) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg2"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %83 = "neura.load"(%82) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %84 = neura.sext %83 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %85 = "neura.gep"(%84) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg4"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %86 = "neura.load"(%85) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %87 = "neura.mul"(%86, %81) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %88 = "neura.gep"(%78) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg3"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %89 = "neura.load"(%88) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %90 = neura.sext %89 : !neura.data<i32, i1> -> !neura.data<i64, i1>
    %91 = "neura.gep"(%90) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg5"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %92 = "neura.load"(%91) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %93 = "neura.add"(%92, %87) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    "neura.store"(%93, %91) : (!neura.data<i32, i1>, !neura.data<!llvm.ptr, i1>) -> ()
    %94 = "neura.add"(%78) {rhs_value = 1 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %95 = "neura.add"(%79) {rhs_value = -1 : i32} : (!neura.data<i32, i1>) -> !neura.data<i32, i1>
    %96 = "neura.icmp"(%95) <{cmpType = "eq"}> {rhs_value = 0 : i32} : (!neura.data<i32, i1>) -> !neura.data<i1, i1>
    neura.cond_br %96 : !neura.data<i1, i1> then %96 : !neura.data<i1, i1> to ^bb6 else %94, %95 : !neura.data<i64, i1>, !neura.data<i32, i1> to ^bb5
  ^bb6(%97: !neura.data<i1, i1>):  // 3 preds: ^bb0, ^bb4, ^bb5
    "neura.return"(%97) {return_type = "void"} : (!neura.data<i1, i1>) -> ()
  }
}

