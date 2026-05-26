; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@_ZZ4mainE1S = internal global [512 x i32] zeroinitializer, align 16
@_ZZ4mainE1T = internal global [512 x i32] zeroinitializer, align 16
@_ZZ4mainE3DTW = internal global [263169 x i32] zeroinitializer, align 16

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
  tail call void @_Z6kernelPKiS0_Pi(i32* noundef getelementptr inbounds ([512 x i32], [512 x i32]* @_ZZ4mainE1S, i64 0, i64 0), i32* noundef getelementptr inbounds ([512 x i32], [512 x i32]* @_ZZ4mainE1T, i64 0, i64 0), i32* noundef getelementptr inbounds ([263169 x i32], [263169 x i32]* @_ZZ4mainE3DTW, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPKiS0_Pi(i32* nocapture noundef readonly %0, i32* nocapture noundef readonly %1, i32* nocapture noundef %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %3, %100
  %5 = phi i64 [ 1, %3 ], [ %101, %100 ]
  %6 = getelementptr inbounds i32, i32* %0, i64 %5
  %7 = mul nuw nsw i64 %5, 513
  %8 = add nsw i64 %7, -513
  %9 = add nuw nsw i64 %7, 513
  br label %10

10:                                               ; preds = %4, %10
  %11 = phi i64 [ 1, %4 ], [ %96, %10 ]
  %12 = load i32, i32* %6, align 4, !tbaa !5
  %13 = getelementptr inbounds i32, i32* %1, i64 %11
  %14 = load i32, i32* %13, align 4, !tbaa !5
  %15 = sub nsw i32 %12, %14
  %16 = sub nsw i32 %14, %12
  %17 = icmp sgt i32 %16, %15
  %18 = select i1 %17, i32 %16, i32 %15
  %19 = add nuw nsw i64 %11, %8
  %20 = getelementptr inbounds i32, i32* %2, i64 %19
  %21 = load i32, i32* %20, align 4, !tbaa !5
  %22 = add nuw nsw i64 %11, %7
  %23 = getelementptr inbounds i32, i32* %2, i64 %22
  %24 = load i32, i32* %23, align 4, !tbaa !5
  %25 = add nsw i64 %22, -1
  %26 = getelementptr inbounds i32, i32* %2, i64 %25
  %27 = load i32, i32* %26, align 4, !tbaa !5
  %28 = icmp slt i32 %24, %21
  %29 = select i1 %28, i32 %24, i32 %21
  %30 = icmp slt i32 %27, %29
  %31 = select i1 %30, i32 %27, i32 %29
  %32 = add nsw i32 %31, %18
  %33 = add nuw nsw i64 %11, 1
  %34 = add nuw nsw i64 %33, %9
  %35 = getelementptr inbounds i32, i32* %2, i64 %34
  store i32 %32, i32* %35, align 4, !tbaa !5
  %36 = getelementptr inbounds i32, i32* %1, i64 %33
  %37 = load i32, i32* %36, align 4, !tbaa !5
  %38 = sub nsw i32 %12, %37
  %39 = sub nsw i32 %37, %12
  %40 = icmp sgt i32 %39, %38
  %41 = select i1 %40, i32 %39, i32 %38
  %42 = add nuw nsw i64 %33, %8
  %43 = getelementptr inbounds i32, i32* %2, i64 %42
  %44 = load i32, i32* %43, align 4, !tbaa !5
  %45 = add nuw nsw i64 %33, %7
  %46 = getelementptr inbounds i32, i32* %2, i64 %45
  %47 = load i32, i32* %46, align 4, !tbaa !5
  %48 = load i32, i32* %23, align 4, !tbaa !5
  %49 = icmp slt i32 %47, %44
  %50 = select i1 %49, i32 %47, i32 %44
  %51 = icmp slt i32 %48, %50
  %52 = select i1 %51, i32 %48, i32 %50
  %53 = add nsw i32 %52, %41
  %54 = add nuw nsw i64 %11, 2
  %55 = add nuw nsw i64 %54, %9
  %56 = getelementptr inbounds i32, i32* %2, i64 %55
  store i32 %53, i32* %56, align 4, !tbaa !5
  %57 = getelementptr inbounds i32, i32* %1, i64 %54
  %58 = load i32, i32* %57, align 4, !tbaa !5
  %59 = sub nsw i32 %12, %58
  %60 = sub nsw i32 %58, %12
  %61 = icmp sgt i32 %60, %59
  %62 = select i1 %61, i32 %60, i32 %59
  %63 = add nuw nsw i64 %54, %8
  %64 = getelementptr inbounds i32, i32* %2, i64 %63
  %65 = load i32, i32* %64, align 4, !tbaa !5
  %66 = add nuw nsw i64 %54, %7
  %67 = getelementptr inbounds i32, i32* %2, i64 %66
  %68 = load i32, i32* %67, align 4, !tbaa !5
  %69 = load i32, i32* %46, align 4, !tbaa !5
  %70 = icmp slt i32 %68, %65
  %71 = select i1 %70, i32 %68, i32 %65
  %72 = icmp slt i32 %69, %71
  %73 = select i1 %72, i32 %69, i32 %71
  %74 = add nsw i32 %73, %62
  %75 = add nuw nsw i64 %11, 3
  %76 = add nuw nsw i64 %75, %9
  %77 = getelementptr inbounds i32, i32* %2, i64 %76
  store i32 %74, i32* %77, align 4, !tbaa !5
  %78 = getelementptr inbounds i32, i32* %1, i64 %75
  %79 = load i32, i32* %78, align 4, !tbaa !5
  %80 = sub nsw i32 %12, %79
  %81 = sub nsw i32 %79, %12
  %82 = icmp sgt i32 %81, %80
  %83 = select i1 %82, i32 %81, i32 %80
  %84 = add nuw nsw i64 %75, %8
  %85 = getelementptr inbounds i32, i32* %2, i64 %84
  %86 = load i32, i32* %85, align 4, !tbaa !5
  %87 = add nuw nsw i64 %75, %7
  %88 = getelementptr inbounds i32, i32* %2, i64 %87
  %89 = load i32, i32* %88, align 4, !tbaa !5
  %90 = load i32, i32* %67, align 4, !tbaa !5
  %91 = icmp slt i32 %89, %86
  %92 = select i1 %91, i32 %89, i32 %86
  %93 = icmp slt i32 %90, %92
  %94 = select i1 %93, i32 %90, i32 %92
  %95 = add nsw i32 %94, %83
  %96 = add nuw nsw i64 %11, 4
  %97 = add nuw nsw i64 %96, %9
  %98 = getelementptr inbounds i32, i32* %2, i64 %97
  store i32 %95, i32* %98, align 4, !tbaa !5
  %99 = icmp ult i64 %11, 508
  br i1 %99, label %10, label %100, !llvm.loop !13

100:                                              ; preds = %10
  %101 = add nuw nsw i64 %5, 1
  %102 = icmp eq i64 %101, 512
  br i1 %102, label %103, label %4, !llvm.loop !14

103:                                              ; preds = %100
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
