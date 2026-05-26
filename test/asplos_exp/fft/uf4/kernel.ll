; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@_ZZ4mainE9data_real = internal global [256 x i32] zeroinitializer, align 16
@_ZZ4mainE9data_imag = internal global [256 x i32] zeroinitializer, align 16

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

8:                                                ; preds = %1
  tail call void @_Z6kernelPiS_iil(i32* noundef getelementptr inbounds ([256 x i32], [256 x i32]* @_ZZ4mainE9data_real, i64 0, i64 0), i32* noundef getelementptr inbounds ([256 x i32], [256 x i32]* @_ZZ4mainE9data_imag, i64 0, i64 0), i32 noundef 2, i32 noundef 2, i64 noundef 0)
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable
define dso_local void @_Z6kernelPiS_iil(i32* nocapture noundef %0, i32* nocapture noundef %1, i32 noundef %2, i32 noundef %3, i64 noundef %4) local_unnamed_addr #0 {
  br label %6

6:                                                ; preds = %5, %6
  %7 = phi i64 [ 0, %5 ], [ %88, %6 ]
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
  %28 = add i64 %8, 129
  %29 = getelementptr inbounds i32, i32* %0, i64 %28
  %30 = load i32, i32* %29, align 4, !tbaa !5
  %31 = mul nsw i32 %30, %2
  %32 = getelementptr inbounds i32, i32* %1, i64 %28
  %33 = load i32, i32* %32, align 4, !tbaa !5
  %34 = mul nsw i32 %33, %3
  %35 = sub nsw i32 %31, %34
  %36 = mul nsw i32 %30, %3
  %37 = mul nsw i32 %33, %2
  %38 = add nsw i32 %37, %36
  %39 = add nsw i64 %8, 1
  %40 = getelementptr inbounds i32, i32* %0, i64 %39
  %41 = load i32, i32* %40, align 4, !tbaa !5
  %42 = sub nsw i32 %41, %35
  store i32 %42, i32* %29, align 4, !tbaa !5
  %43 = add nsw i32 %41, %35
  store i32 %43, i32* %40, align 4, !tbaa !5
  %44 = getelementptr inbounds i32, i32* %1, i64 %39
  %45 = load i32, i32* %44, align 4, !tbaa !5
  %46 = sub nsw i32 %45, %38
  store i32 %46, i32* %32, align 4, !tbaa !5
  %47 = add nsw i32 %45, %38
  store i32 %47, i32* %44, align 4, !tbaa !5
  %48 = add i64 %8, 130
  %49 = getelementptr inbounds i32, i32* %0, i64 %48
  %50 = load i32, i32* %49, align 4, !tbaa !5
  %51 = mul nsw i32 %50, %2
  %52 = getelementptr inbounds i32, i32* %1, i64 %48
  %53 = load i32, i32* %52, align 4, !tbaa !5
  %54 = mul nsw i32 %53, %3
  %55 = sub nsw i32 %51, %54
  %56 = mul nsw i32 %50, %3
  %57 = mul nsw i32 %53, %2
  %58 = add nsw i32 %57, %56
  %59 = add nsw i64 %8, 2
  %60 = getelementptr inbounds i32, i32* %0, i64 %59
  %61 = load i32, i32* %60, align 4, !tbaa !5
  %62 = sub nsw i32 %61, %55
  store i32 %62, i32* %49, align 4, !tbaa !5
  %63 = add nsw i32 %61, %55
  store i32 %63, i32* %60, align 4, !tbaa !5
  %64 = getelementptr inbounds i32, i32* %1, i64 %59
  %65 = load i32, i32* %64, align 4, !tbaa !5
  %66 = sub nsw i32 %65, %58
  store i32 %66, i32* %52, align 4, !tbaa !5
  %67 = add nsw i32 %65, %58
  store i32 %67, i32* %64, align 4, !tbaa !5
  %68 = add i64 %8, 131
  %69 = getelementptr inbounds i32, i32* %0, i64 %68
  %70 = load i32, i32* %69, align 4, !tbaa !5
  %71 = mul nsw i32 %70, %2
  %72 = getelementptr inbounds i32, i32* %1, i64 %68
  %73 = load i32, i32* %72, align 4, !tbaa !5
  %74 = mul nsw i32 %73, %3
  %75 = sub nsw i32 %71, %74
  %76 = mul nsw i32 %70, %3
  %77 = mul nsw i32 %73, %2
  %78 = add nsw i32 %77, %76
  %79 = add nsw i64 %8, 3
  %80 = getelementptr inbounds i32, i32* %0, i64 %79
  %81 = load i32, i32* %80, align 4, !tbaa !5
  %82 = sub nsw i32 %81, %75
  store i32 %82, i32* %69, align 4, !tbaa !5
  %83 = add nsw i32 %81, %75
  store i32 %83, i32* %80, align 4, !tbaa !5
  %84 = getelementptr inbounds i32, i32* %1, i64 %79
  %85 = load i32, i32* %84, align 4, !tbaa !5
  %86 = sub nsw i32 %85, %78
  store i32 %86, i32* %72, align 4, !tbaa !5
  %87 = add nsw i32 %85, %78
  store i32 %87, i32* %84, align 4, !tbaa !5
  %88 = add nuw nsw i64 %7, 4
  %89 = icmp ult i64 %7, 124
  br i1 %89, label %6, label %90, !llvm.loop !12

90:                                               ; preds = %6
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
