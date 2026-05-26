; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPiS_(i32* nocapture noundef readonly %0, i32* nocapture noundef writeonly %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %2, %34
  %4 = phi i64 [ 0, %2 ], [ %35, %34 ]
  %5 = shl nsw i64 %4, 6
  br label %6

6:                                                ; preds = %3, %6
  %7 = phi i64 [ 0, %3 ], [ %32, %6 ]
  %8 = add nuw nsw i64 %7, %5
  %9 = getelementptr inbounds i32, i32* %0, i64 %8
  %10 = load i32, i32* %9, align 4, !tbaa !5
  %11 = icmp sgt i32 %10, 0
  %12 = select i1 %11, i32 %10, i32 0
  %13 = getelementptr inbounds i32, i32* %1, i64 %8
  store i32 %12, i32* %13, align 4, !tbaa !5
  %14 = or i64 %8, 1
  %15 = getelementptr inbounds i32, i32* %0, i64 %14
  %16 = load i32, i32* %15, align 4, !tbaa !5
  %17 = icmp sgt i32 %16, 0
  %18 = select i1 %17, i32 %16, i32 0
  %19 = getelementptr inbounds i32, i32* %1, i64 %14
  store i32 %18, i32* %19, align 4, !tbaa !5
  %20 = or i64 %8, 2
  %21 = getelementptr inbounds i32, i32* %0, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !5
  %23 = icmp sgt i32 %22, 0
  %24 = select i1 %23, i32 %22, i32 0
  %25 = getelementptr inbounds i32, i32* %1, i64 %20
  store i32 %24, i32* %25, align 4, !tbaa !5
  %26 = or i64 %8, 3
  %27 = getelementptr inbounds i32, i32* %0, i64 %26
  %28 = load i32, i32* %27, align 4, !tbaa !5
  %29 = icmp sgt i32 %28, 0
  %30 = select i1 %29, i32 %28, i32 0
  %31 = getelementptr inbounds i32, i32* %1, i64 %26
  store i32 %30, i32* %31, align 4, !tbaa !5
  %32 = add nuw nsw i64 %7, 4
  %33 = icmp ult i64 %7, 60
  br i1 %33, label %6, label %34, !llvm.loop !9

34:                                               ; preds = %6
  %35 = add nuw nsw i64 %4, 1
  %36 = icmp eq i64 %35, 64
  br i1 %36, label %37, label %3, !llvm.loop !12

37:                                               ; preds = %34
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
