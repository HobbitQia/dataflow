; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/relu/kernel_uf2.c'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/relu/kernel_uf2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32 %1, i32 %2, [1100 x i32]* nocapture %3, [1100 x i32]* nocapture readonly %4, [1100 x i32]* nocapture readnone %5) local_unnamed_addr #0 {
  br label %7

7:                                                ; preds = %6, %7
  %8 = phi i32 [ 0, %6 ], [ %26, %7 ]
  %9 = udiv i32 %8, 1100
  %10 = urem i32 %8, 1100
  %11 = zext i32 %9 to i64
  %12 = zext i32 %10 to i64
  %13 = getelementptr inbounds [1100 x i32], [1100 x i32]* %4, i64 %11, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !2
  %15 = icmp sgt i32 %14, 0
  %16 = select i1 %15, i32 %14, i32 0
  %17 = getelementptr inbounds [1100 x i32], [1100 x i32]* %3, i64 %11, i64 %12
  store i32 %16, i32* %17, align 4
  %18 = or i32 %8, 1
  %19 = urem i32 %18, 1100
  %20 = zext i32 %19 to i64
  %21 = getelementptr inbounds [1100 x i32], [1100 x i32]* %4, i64 %11, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !2
  %23 = icmp sgt i32 %22, 0
  %24 = select i1 %23, i32 %22, i32 0
  %25 = getelementptr inbounds [1100 x i32], [1100 x i32]* %3, i64 %11, i64 %20
  store i32 %24, i32* %25, align 4
  %26 = add nuw nsw i32 %8, 2
  %27 = icmp ult i32 %8, 1099998
  br i1 %27, label %7, label %28, !llvm.loop !6

28:                                               ; preds = %7
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %0, i8** nocapture readnone %1) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 1100000, i32 4) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1100000, i32 4) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 4) #3
  %6 = bitcast i8* %3 to [1100 x i32]*
  %7 = bitcast i8* %4 to [1100 x i32]*
  br label %8

8:                                                ; preds = %8, %2
  %9 = phi i32 [ 0, %2 ], [ %27, %8 ]
  %10 = udiv i32 %9, 1100
  %11 = urem i32 %9, 1100
  %12 = zext i32 %10 to i64
  %13 = zext i32 %11 to i64
  %14 = getelementptr inbounds [1100 x i32], [1100 x i32]* %7, i64 %12, i64 %13
  %15 = load i32, i32* %14, align 4, !tbaa !2
  %16 = icmp sgt i32 %15, 0
  %17 = select i1 %16, i32 %15, i32 0
  %18 = getelementptr inbounds [1100 x i32], [1100 x i32]* %6, i64 %12, i64 %13
  store i32 %17, i32* %18, align 4
  %19 = or i32 %9, 1
  %20 = urem i32 %19, 1100
  %21 = zext i32 %20 to i64
  %22 = getelementptr inbounds [1100 x i32], [1100 x i32]* %7, i64 %12, i64 %21
  %23 = load i32, i32* %22, align 4, !tbaa !2
  %24 = icmp sgt i32 %23, 0
  %25 = select i1 %24, i32 %23, i32 0
  %26 = getelementptr inbounds [1100 x i32], [1100 x i32]* %6, i64 %12, i64 %21
  store i32 %25, i32* %26, align 4
  %27 = add nuw nsw i32 %9, 2
  %28 = icmp ult i32 %9, 1099998
  br i1 %28, label %8, label %29, !llvm.loop !6

29:                                               ; preds = %8
  ret i32 0
}

declare dso_local i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

attributes #0 = { nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 12.0.1-19ubuntu3"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
