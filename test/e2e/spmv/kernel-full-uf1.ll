; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/spmv/spmv.c'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/spmv/spmv.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@nnz = dso_local local_unnamed_addr global i32 100, align 4
@val = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@col = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@row = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@feature = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16
@output = dso_local local_unnamed_addr global [10000 x i32] zeroinitializer, align 16

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = load i32, i32* @nnz, align 4, !tbaa !2
  %2 = icmp sgt i32 %1, 0
  br i1 %2, label %3, label %23

3:                                                ; preds = %0
  %4 = zext i32 %1 to i64
  br label %5

5:                                                ; preds = %5, %3
  %6 = phi i64 [ 0, %3 ], [ %21, %5 ]
  %7 = getelementptr inbounds [10000 x i32], [10000 x i32]* @val, i64 0, i64 %6
  %8 = load i32, i32* %7, align 4, !tbaa !2
  %9 = getelementptr inbounds [10000 x i32], [10000 x i32]* @col, i64 0, i64 %6
  %10 = load i32, i32* %9, align 4, !tbaa !2
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [10000 x i32], [10000 x i32]* @feature, i64 0, i64 %11
  %13 = load i32, i32* %12, align 4, !tbaa !2
  %14 = mul nsw i32 %13, %8
  %15 = getelementptr inbounds [10000 x i32], [10000 x i32]* @row, i64 0, i64 %6
  %16 = load i32, i32* %15, align 4, !tbaa !2
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [10000 x i32], [10000 x i32]* @output, i64 0, i64 %17
  %19 = load i32, i32* %18, align 4, !tbaa !2
  %20 = add nsw i32 %19, %14
  store i32 %20, i32* %18, align 4, !tbaa !2
  %21 = add nuw nsw i64 %6, 1
  %22 = icmp eq i64 %21, %4
  br i1 %22, label %23, label %5, !llvm.loop !6

23:                                               ; preds = %5, %0
  ret i32 0
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32* nocapture readonly %1, i32* nocapture readonly %2, i32* nocapture readonly %3, i32* nocapture readonly %4, i32* nocapture %5) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %8, label %28

8:                                                ; preds = %6
  %9 = zext i32 %0 to i64
  br label %10

10:                                               ; preds = %8, %10
  %11 = phi i64 [ 0, %8 ], [ %26, %10 ]
  %12 = getelementptr inbounds i32, i32* %1, i64 %11
  %13 = load i32, i32* %12, align 4, !tbaa !2
  %14 = getelementptr inbounds i32, i32* %2, i64 %11
  %15 = load i32, i32* %14, align 4, !tbaa !2
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32* %4, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !2
  %19 = mul nsw i32 %18, %13
  %20 = getelementptr inbounds i32, i32* %3, i64 %11
  %21 = load i32, i32* %20, align 4, !tbaa !2
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds i32, i32* %5, i64 %22
  %24 = load i32, i32* %23, align 4, !tbaa !2
  %25 = add nsw i32 %24, %19
  store i32 %25, i32* %23, align 4, !tbaa !2
  %26 = add nuw nsw i64 %11, 1
  %27 = icmp eq i64 %26, %9
  br i1 %27, label %28, label %10, !llvm.loop !6

28:                                               ; preds = %10, %6
  ret void
}

attributes #0 = { nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

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
