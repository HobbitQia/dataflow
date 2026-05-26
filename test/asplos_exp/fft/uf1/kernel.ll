; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@_ZZ4mainE9data_real = internal unnamed_addr global [256 x i32] zeroinitializer, align 16
@_ZZ4mainE9data_imag = internal unnamed_addr global [256 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i64 [ 0, %0 ], [ %6, %1 ]
  %3 = getelementptr inbounds [256 x i32], [256 x i32]* @_ZZ4mainE9data_real, i64 0, i64 %2
  %4 = trunc i64 %2 to i32
  store i32 %4, i32* %3, align 4, !tbaa !5
  %5 = getelementptr inbounds [256 x i32], [256 x i32]* @_ZZ4mainE9data_imag, i64 0, i64 %2
  store i32 1, i32* %5, align 4, !tbaa !5
  %6 = add nuw nsw i64 %2, 1
  %7 = icmp eq i64 %6, 256
  br i1 %7, label %8, label %1, !llvm.loop !9

8:                                                ; preds = %1, %8
  %9 = phi i64 [ %27, %8 ], [ 0, %1 ]
  %10 = add nuw nsw i64 %9, 128
  %11 = getelementptr inbounds [256 x i32], [256 x i32]* @_ZZ4mainE9data_real, i64 0, i64 %10
  %12 = load i32, i32* %11, align 4, !tbaa !5
  %13 = shl nsw i32 %12, 1
  %14 = getelementptr inbounds [256 x i32], [256 x i32]* @_ZZ4mainE9data_imag, i64 0, i64 %10
  %15 = load i32, i32* %14, align 4, !tbaa !5
  %16 = shl nsw i32 %15, 1
  %17 = sub nsw i32 %13, %16
  %18 = add nsw i32 %16, %13
  %19 = getelementptr inbounds [256 x i32], [256 x i32]* @_ZZ4mainE9data_real, i64 0, i64 %9
  %20 = load i32, i32* %19, align 4, !tbaa !5
  %21 = sub nsw i32 %20, %17
  store i32 %21, i32* %11, align 4, !tbaa !5
  %22 = add nsw i32 %17, %20
  store i32 %22, i32* %19, align 4, !tbaa !5
  %23 = getelementptr inbounds [256 x i32], [256 x i32]* @_ZZ4mainE9data_imag, i64 0, i64 %9
  %24 = load i32, i32* %23, align 4, !tbaa !5
  %25 = sub nsw i32 %24, %18
  store i32 %25, i32* %14, align 4, !tbaa !5
  %26 = add nsw i32 %24, %18
  store i32 %26, i32* %23, align 4, !tbaa !5
  %27 = add nuw nsw i64 %9, 1
  %28 = icmp eq i64 %27, 128
  br i1 %28, label %29, label %8, !llvm.loop !12

29:                                               ; preds = %8
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPiS_iil(i32* nocapture noundef %0, i32* nocapture noundef %1, i32 noundef %2, i32 noundef %3, i64 noundef %4) local_unnamed_addr #0 {
  br label %6

6:                                                ; preds = %5, %6
  %7 = phi i64 [ 0, %5 ], [ %28, %6 ]
  %8 = add nsw i64 %7, %4
  %9 = add i64 %8, 128
  %10 = getelementptr inbounds i32, i32* %0, i64 %9
  %11 = load i32, i32* %10, align 4, !tbaa !5
  %12 = mul nsw i32 %11, %2
  %13 = getelementptr inbounds i32, i32* %1, i64 %9
  %14 = load i32, i32* %13, align 4, !tbaa !5
  %15 = mul nsw i32 %14, %3
  %16 = sub nsw i32 %12, %15
  %17 = mul nsw i32 %11, %3
  %18 = mul nsw i32 %14, %2
  %19 = add nsw i32 %18, %17
  %20 = getelementptr inbounds i32, i32* %0, i64 %8
  %21 = load i32, i32* %20, align 4, !tbaa !5
  %22 = sub nsw i32 %21, %16
  store i32 %22, i32* %10, align 4, !tbaa !5
  %23 = add nsw i32 %21, %16
  store i32 %23, i32* %20, align 4, !tbaa !5
  %24 = getelementptr inbounds i32, i32* %1, i64 %8
  %25 = load i32, i32* %24, align 4, !tbaa !5
  %26 = sub nsw i32 %25, %19
  store i32 %26, i32* %13, align 4, !tbaa !5
  %27 = add nsw i32 %25, %19
  store i32 %27, i32* %24, align 4, !tbaa !5
  %28 = add nuw nsw i64 %7, 1
  %29 = icmp eq i64 %28, 128
  br i1 %29, label %30, label %6, !llvm.loop !12

30:                                               ; preds = %6
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
