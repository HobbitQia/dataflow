; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@_ZZ4mainE3val = internal unnamed_addr global [1024 x i32] zeroinitializer, align 16
@_ZZ4mainE3col = internal unnamed_addr global [1024 x i32] zeroinitializer, align 16
@_ZZ4mainE3row = internal unnamed_addr global [1024 x i32] zeroinitializer, align 16
@_ZZ4mainE7feature = internal unnamed_addr global [1024 x i32] zeroinitializer, align 16
@_ZZ4mainE6output = internal unnamed_addr global [1024 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i64 [ 0, %0 ], [ %11, %1 ]
  %3 = trunc i64 %2 to i32
  %4 = trunc i64 %2 to i16
  %5 = urem i16 %4, 7
  %6 = add nuw nsw i16 %5, 1
  %7 = zext i16 %6 to i32
  %8 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_ZZ4mainE3val, i64 0, i64 %2
  store i32 %7, i32* %8, align 4, !tbaa !5
  %9 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_ZZ4mainE3col, i64 0, i64 %2
  store i32 %3, i32* %9, align 4, !tbaa !5
  %10 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_ZZ4mainE3row, i64 0, i64 %2
  store i32 %3, i32* %10, align 4, !tbaa !5
  %11 = add nuw nsw i64 %2, 1
  %12 = icmp eq i64 %11, 1024
  br i1 %12, label %13, label %1, !llvm.loop !9

13:                                               ; preds = %1, %13
  %14 = phi i64 [ %19, %13 ], [ 0, %1 ]
  %15 = trunc i64 %14 to i16
  %16 = urem i16 %15, 13
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_ZZ4mainE7feature, i64 0, i64 %14
  store i32 %17, i32* %18, align 4, !tbaa !5
  %19 = add nuw nsw i64 %14, 1
  %20 = icmp eq i64 %19, 1024
  br i1 %20, label %21, label %13, !llvm.loop !12

21:                                               ; preds = %13, %21
  %22 = phi i64 [ %37, %21 ], [ 0, %13 ]
  %23 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_ZZ4mainE3val, i64 0, i64 %22
  %24 = load i32, i32* %23, align 4, !tbaa !5
  %25 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_ZZ4mainE3col, i64 0, i64 %22
  %26 = load i32, i32* %25, align 4, !tbaa !5
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_ZZ4mainE7feature, i64 0, i64 %27
  %29 = load i32, i32* %28, align 4, !tbaa !5
  %30 = mul nsw i32 %29, %24
  %31 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_ZZ4mainE3row, i64 0, i64 %22
  %32 = load i32, i32* %31, align 4, !tbaa !5
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [1024 x i32], [1024 x i32]* @_ZZ4mainE6output, i64 0, i64 %33
  %35 = load i32, i32* %34, align 4, !tbaa !5
  %36 = add nsw i32 %35, %30
  store i32 %36, i32* %34, align 4, !tbaa !5
  %37 = add nuw nsw i64 %22, 1
  %38 = icmp eq i64 %37, 1024
  br i1 %38, label %39, label %21, !llvm.loop !13

39:                                               ; preds = %21
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPiS_S_S_S_(i32* nocapture noundef readonly %0, i32* nocapture noundef readonly %1, i32* nocapture noundef readonly %2, i32* nocapture noundef readonly %3, i32* nocapture noundef %4) local_unnamed_addr #0 {
  br label %6

6:                                                ; preds = %5, %6
  %7 = phi i64 [ 0, %5 ], [ %22, %6 ]
  %8 = getelementptr inbounds i32, i32* %0, i64 %7
  %9 = load i32, i32* %8, align 4, !tbaa !5
  %10 = getelementptr inbounds i32, i32* %1, i64 %7
  %11 = load i32, i32* %10, align 4, !tbaa !5
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32* %3, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !5
  %15 = mul nsw i32 %14, %9
  %16 = getelementptr inbounds i32, i32* %2, i64 %7
  %17 = load i32, i32* %16, align 4, !tbaa !5
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i32, i32* %4, i64 %18
  %20 = load i32, i32* %19, align 4, !tbaa !5
  %21 = add nsw i32 %20, %15
  store i32 %21, i32* %19, align 4, !tbaa !5
  %22 = add nuw nsw i64 %7, 1
  %23 = icmp eq i64 %22, 1024
  br i1 %23, label %24, label %6, !llvm.loop !13

24:                                               ; preds = %6
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !10, !11}
!13 = distinct !{!13, !10, !11}
