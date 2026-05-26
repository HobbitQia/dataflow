; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@_ZZ4mainE1S = internal unnamed_addr global [512 x i32] zeroinitializer, align 16
@_ZZ4mainE1T = internal unnamed_addr global [512 x i32] zeroinitializer, align 16
@_ZZ4mainE3DTW = internal unnamed_addr global [263169 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i64 [ 0, %0 ], [ %3, %1 ]
  %3 = add nuw nsw i64 %2, 1
  %4 = getelementptr inbounds [512 x i32], [512 x i32]* @_ZZ4mainE1S, i64 0, i64 %2
  %5 = trunc i64 %3 to i32
  store i32 %5, i32* %4, align 4, !tbaa !5
  %6 = getelementptr inbounds [512 x i32], [512 x i32]* @_ZZ4mainE1T, i64 0, i64 %2
  %7 = trunc i64 %2 to i32
  %8 = add i32 %7, 3
  store i32 %8, i32* %6, align 4, !tbaa !5
  %9 = icmp eq i64 %3, 512
  br i1 %9, label %10, label %1, !llvm.loop !9

10:                                               ; preds = %1, %10
  %11 = phi i64 [ %13, %10 ], [ 0, %1 ]
  %12 = getelementptr inbounds [263169 x i32], [263169 x i32]* @_ZZ4mainE3DTW, i64 0, i64 %11
  store i32 65535, i32* %12, align 4, !tbaa !5
  %13 = add nuw nsw i64 %11, 1
  %14 = icmp eq i64 %13, 263169
  br i1 %14, label %15, label %10, !llvm.loop !12

15:                                               ; preds = %10
  store i32 0, i32* getelementptr inbounds ([263169 x i32], [263169 x i32]* @_ZZ4mainE3DTW, i64 0, i64 0), align 16, !tbaa !5
  br label %16

16:                                               ; preds = %48, %15
  %17 = phi i64 [ 1, %15 ], [ %49, %48 ]
  %18 = getelementptr inbounds [512 x i32], [512 x i32]* @_ZZ4mainE1S, i64 0, i64 %17
  %19 = mul nuw nsw i64 %17, 513
  %20 = add nuw nsw i64 %19, 513
  %21 = load i32, i32* %18, align 4, !tbaa !5
  br label %22

22:                                               ; preds = %22, %16
  %23 = phi i64 [ 1, %16 ], [ %44, %22 ]
  %24 = getelementptr inbounds [512 x i32], [512 x i32]* @_ZZ4mainE1T, i64 0, i64 %23
  %25 = load i32, i32* %24, align 4, !tbaa !5
  %26 = sub nsw i32 %21, %25
  %27 = sub nsw i32 %25, %21
  %28 = icmp sgt i32 %27, %26
  %29 = select i1 %28, i32 %27, i32 %26
  %30 = add nuw nsw i64 %23, %19
  %31 = add nsw i64 %30, -513
  %32 = getelementptr inbounds [263169 x i32], [263169 x i32]* @_ZZ4mainE3DTW, i64 0, i64 %31
  %33 = load i32, i32* %32, align 4, !tbaa !5
  %34 = getelementptr inbounds [263169 x i32], [263169 x i32]* @_ZZ4mainE3DTW, i64 0, i64 %30
  %35 = load i32, i32* %34, align 4, !tbaa !5
  %36 = add nsw i64 %30, -1
  %37 = getelementptr inbounds [263169 x i32], [263169 x i32]* @_ZZ4mainE3DTW, i64 0, i64 %36
  %38 = load i32, i32* %37, align 4, !tbaa !5
  %39 = icmp slt i32 %35, %33
  %40 = select i1 %39, i32 %35, i32 %33
  %41 = icmp slt i32 %38, %40
  %42 = select i1 %41, i32 %38, i32 %40
  %43 = add nsw i32 %42, %29
  %44 = add nuw nsw i64 %23, 1
  %45 = add nuw nsw i64 %20, %44
  %46 = getelementptr inbounds [263169 x i32], [263169 x i32]* @_ZZ4mainE3DTW, i64 0, i64 %45
  store i32 %43, i32* %46, align 4, !tbaa !5
  %47 = icmp eq i64 %44, 512
  br i1 %47, label %48, label %22, !llvm.loop !13

48:                                               ; preds = %22
  %49 = add nuw nsw i64 %17, 1
  %50 = icmp eq i64 %49, 512
  br i1 %50, label %51, label %16, !llvm.loop !14

51:                                               ; preds = %48
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPKiS0_Pi(i32* nocapture noundef readonly %0, i32* nocapture noundef readonly %1, i32* nocapture noundef %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %3, %36
  %5 = phi i64 [ 1, %3 ], [ %37, %36 ]
  %6 = getelementptr inbounds i32, i32* %0, i64 %5
  %7 = mul nuw nsw i64 %5, 513
  %8 = add nuw nsw i64 %7, 513
  br label %9

9:                                                ; preds = %4, %9
  %10 = phi i64 [ 1, %4 ], [ %32, %9 ]
  %11 = load i32, i32* %6, align 4, !tbaa !5
  %12 = getelementptr inbounds i32, i32* %1, i64 %10
  %13 = load i32, i32* %12, align 4, !tbaa !5
  %14 = sub nsw i32 %11, %13
  %15 = sub nsw i32 %13, %11
  %16 = icmp sgt i32 %15, %14
  %17 = select i1 %16, i32 %15, i32 %14
  %18 = add nuw nsw i64 %10, %7
  %19 = add nsw i64 %18, -513
  %20 = getelementptr inbounds i32, i32* %2, i64 %19
  %21 = load i32, i32* %20, align 4, !tbaa !5
  %22 = getelementptr inbounds i32, i32* %2, i64 %18
  %23 = load i32, i32* %22, align 4, !tbaa !5
  %24 = add nsw i64 %18, -1
  %25 = getelementptr inbounds i32, i32* %2, i64 %24
  %26 = load i32, i32* %25, align 4, !tbaa !5
  %27 = icmp slt i32 %23, %21
  %28 = select i1 %27, i32 %23, i32 %21
  %29 = icmp slt i32 %26, %28
  %30 = select i1 %29, i32 %26, i32 %28
  %31 = add nsw i32 %30, %17
  %32 = add nuw nsw i64 %10, 1
  %33 = add nuw nsw i64 %8, %32
  %34 = getelementptr inbounds i32, i32* %2, i64 %33
  store i32 %31, i32* %34, align 4, !tbaa !5
  %35 = icmp eq i64 %32, 512
  br i1 %35, label %36, label %9, !llvm.loop !13

36:                                               ; preds = %9
  %37 = add nuw nsw i64 %5, 1
  %38 = icmp eq i64 %37, 512
  br i1 %38, label %39, label %4, !llvm.loop !14

39:                                               ; preds = %36
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
!14 = distinct !{!14, !10, !11}
