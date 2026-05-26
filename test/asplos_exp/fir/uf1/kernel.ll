; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@coefficients = dso_local local_unnamed_addr global [32 x i32] [i32 0, i32 1, i32 3, i32 -2, i32 0, i32 0, i32 -3, i32 1, i32 0, i32 1, i32 3, i32 -2, i32 0, i32 0, i32 -3, i32 1, i32 0, i32 1, i32 3, i32 -2, i32 0, i32 0, i32 -3, i32 1, i32 0, i32 1, i32 3, i32 -2, i32 0, i32 0, i32 -3, i32 1], align 16
@_ZZ4mainE5input = internal unnamed_addr global [32 x i32] zeroinitializer, align 16

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i64 [ 0, %0 ], [ %7, %1 ]
  %3 = trunc i64 %2 to i8
  %4 = urem i8 %3, 5
  %5 = zext i8 %4 to i32
  %6 = getelementptr inbounds [32 x i32], [32 x i32]* @_ZZ4mainE5input, i64 0, i64 %2
  store i32 %5, i32* %6, align 4, !tbaa !5
  %7 = add nuw nsw i64 %2, 1
  %8 = icmp eq i64 %7, 32
  br i1 %8, label %9, label %1, !llvm.loop !9

9:                                                ; preds = %1
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPiS_S_(i32* nocapture noundef readonly %0, i32* nocapture noundef %1, i32* nocapture noundef readonly %2) local_unnamed_addr #0 {
  store i32 0, i32* %1, align 4, !tbaa !5
  br label %4

4:                                                ; preds = %3, %4
  %5 = phi i32 [ 0, %3 ], [ %12, %4 ]
  %6 = phi i64 [ 0, %3 ], [ %13, %4 ]
  %7 = getelementptr inbounds i32, i32* %0, i64 %6
  %8 = load i32, i32* %7, align 4, !tbaa !5
  %9 = getelementptr inbounds i32, i32* %2, i64 %6
  %10 = load i32, i32* %9, align 4, !tbaa !5
  %11 = mul nsw i32 %10, %8
  %12 = add nsw i32 %5, %11
  store i32 %12, i32* %1, align 4, !tbaa !5
  %13 = add nuw nsw i64 %6, 1
  %14 = icmp eq i64 %13, 32
  br i1 %14, label %15, label %4, !llvm.loop !12

15:                                               ; preds = %4
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
