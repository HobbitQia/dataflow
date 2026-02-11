module attributes {dlti.dl_spec = #dlti.dl_spec<f80 = dense<128> : vector<2xi64>, i64 = dense<64> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, !llvm.ptr = dense<64> : vector<4xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, !llvm.ptr<270> = dense<32> : vector<4xi64>, !llvm.ptr<272> = dense<64> : vector<4xi64>, f128 = dense<128> : vector<2xi64>, !llvm.ptr<271> = dense<32> : vector<4xi64>, "dlti.stack_alignment" = 128 : i64, "dlti.endianness" = "little">, llvm.ident = "Ubuntu clang version 12.0.1-19ubuntu3"} {
  func.func @_Z6kernelPiS_S_(%arg0: !llvm.ptr {llvm.nocapture, llvm.readonly}, %arg1: !llvm.ptr {llvm.nocapture, llvm.readnone}, %arg2: !llvm.ptr {llvm.nocapture, llvm.readonly}) -> i32 attributes {CConv = #llvm.cconv<ccc>, accelerator = "neura", frame_pointer = #llvm.framePointerKind<none>, linkage = #llvm.linkage<external>, memory_effects = #llvm.memory_effects<other = read, argMem = read, inaccessibleMem = read>, no_infs_fp_math = false, no_nans_fp_math = false, no_signed_zeros_fp_math = false, no_unwind, passthrough = ["mustprogress", "norecurse", ["uwtable", "2"], ["disable-tail-calls", "false"], ["less-precise-fpmad", "false"], ["min-legal-vector-width", "0"], ["no-jump-tables", "false"], ["no-trapping-math", "true"], ["stack-protector-buffer-size", "8"], ["target-cpu", "x86-64"], ["use-soft-float", "false"]], target_cpu = "x86-64", target_features = #llvm.target_features<["+cx8", "+fxsr", "+mmx", "+sse", "+sse2", "+x87"]>, tune_cpu = "generic", unnamed_addr = 1 : i64, unsafe_fp_math = false, visibility_ = 0 : i64, will_return} {
    %0 = "neura.constant"() <{value = 0 : i64}> : () -> !neura.data<i64, i1>
    %1 = "neura.constant"() <{value = 0 : i32}> : () -> !neura.data<i32, i1>
    neura.br %0, %1 : !neura.data<i64, i1>, !neura.data<i32, i1> to ^bb1
  ^bb1(%2: !neura.data<i64, i1>, %3: !neura.data<i32, i1>):  // 2 preds: ^bb0, ^bb1
    %4 = "neura.gep"(%2) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg0"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %5 = "neura.load"(%4) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %6 = "neura.gep"(%2) <{operandSegmentSizes = array<i32: 0, 1>}> {lhs_value = "%arg2"} : (!neura.data<i64, i1>) -> !neura.data<!llvm.ptr, i1>
    %7 = "neura.load"(%6) : (!neura.data<!llvm.ptr, i1>) -> !neura.data<i32, i1>
    %8 = "neura.mul"(%7, %5) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %9 = "neura.add"(%8, %3) : (!neura.data<i32, i1>, !neura.data<i32, i1>) -> !neura.data<i32, i1>
    %10 = "neura.add"(%2) {rhs_value = 1 : i64} : (!neura.data<i64, i1>) -> !neura.data<i64, i1>
    %11 = "neura.icmp"(%10) <{cmpType = "eq"}> {rhs_value = 32 : i64} : (!neura.data<i64, i1>) -> !neura.data<i1, i1>
    neura.cond_br %11 : !neura.data<i1, i1> then %9 : !neura.data<i32, i1> to ^bb2 else %10, %9 : !neura.data<i64, i1>, !neura.data<i32, i1> to ^bb1
  ^bb2(%12: !neura.data<i32, i1>):  // pred: ^bb1
    "neura.return"(%12) {return_type = "value"} : (!neura.data<i32, i1>) -> ()
  }
}

