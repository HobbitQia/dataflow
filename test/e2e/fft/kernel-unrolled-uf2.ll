; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/fft/kernel-only-uf2.ll'
source_filename = "/mnt/public/qjj/dataflow/test/benchmark/CGRA-Bench/kernels/fft/fft_int.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32* nocapture %0, i32* nocapture %1, i32* nocapture readonly %2, i32* nocapture readonly %3) local_unnamed_addr #0 {
  br label %5

5:                                                ; preds = %58, %4
  %6 = phi i32 [ 0, %4 ], [ %62, %58 ]
  %7 = phi i32 [ 128, %4 ], [ %60, %58 ]
  %8 = phi i32 [ 1, %4 ], [ %59, %58 ]
  %9 = phi i32 [ 0, %4 ], [ %63, %58 ]
  %10 = icmp ne i32 %8, 0
  %11 = icmp sgt i32 %7, 0
  %12 = and i1 %10, %11
  br i1 %12, label %13, label %58

13:                                               ; preds = %5
  %14 = sext i32 %6 to i64
  %15 = zext i32 %7 to i64
  %16 = zext i32 %8 to i64
  %17 = zext i32 %7 to i64
  br label %18

18:                                               ; preds = %55, %13
  %19 = phi i64 [ 0, %13 ], [ %56, %55 ]
  %20 = add nsw i64 %19, %14
  %21 = getelementptr inbounds i32, i32* %2, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !2
  %23 = getelementptr inbounds i32, i32* %3, i64 %20
  %24 = load i32, i32* %23, align 4, !tbaa !2
  %25 = shl nuw nsw i64 %19, 1
  %26 = mul nsw i64 %25, %15
  br label %27

27:                                               ; preds = %27, %18
  %28 = phi i64 [ 0, %18 ], [ %53, %27 ]
  %29 = add nuw nsw i64 %28, %26
  %30 = trunc i64 %29 to i32
  %31 = add i32 %7, %30
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds i32, i32* %0, i64 %32
  %34 = load i32, i32* %33, align 4, !tbaa !2
  %35 = mul nsw i32 %34, %22
  %36 = getelementptr inbounds i32, i32* %1, i64 %32
  %37 = load i32, i32* %36, align 4, !tbaa !2
  %38 = mul nsw i32 %37, %24
  %39 = sub nsw i32 %35, %38
  %40 = mul nsw i32 %34, %24
  %41 = mul nsw i32 %37, %22
  %42 = add nsw i32 %41, %40
  %43 = getelementptr inbounds i32, i32* %0, i64 %29
  %44 = load i32, i32* %43, align 4, !tbaa !2
  %45 = sub nsw i32 %44, %39
  store i32 %45, i32* %33, align 4, !tbaa !2
  %46 = load i32, i32* %43, align 4, !tbaa !2
  %47 = add nsw i32 %46, %39
  store i32 %47, i32* %43, align 4, !tbaa !2
  %48 = getelementptr inbounds i32, i32* %1, i64 %29
  %49 = load i32, i32* %48, align 4, !tbaa !2
  %50 = sub nsw i32 %49, %42
  store i32 %50, i32* %36, align 4, !tbaa !2
  %51 = load i32, i32* %48, align 4, !tbaa !2
  %52 = add nsw i32 %51, %42
  store i32 %52, i32* %48, align 4, !tbaa !2
  %53 = add nuw nsw i64 %28, 1
  %54 = icmp eq i64 %53, %17
  br i1 %54, label %55, label %27, !llvm.loop !6

55:                                               ; preds = %27
  %56 = add nuw nsw i64 %19, 1
  %57 = icmp eq i64 %56, %16
  br i1 %57, label %.loopexit, label %18, !llvm.loop !9

.loopexit:                                        ; preds = %55
  br label %58

58:                                               ; preds = %.loopexit, %5
  %59 = shl nsw i32 %8, 1
  %60 = sdiv i32 %7, 2
  %61 = shl i32 %6, 1
  %62 = or i32 %61, 1
  %63 = add nuw nsw i32 %9, 1
  %64 = icmp eq i32 %63, 8
  br i1 %64, label %65, label %5, !llvm.loop !10

65:                                               ; preds = %58
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
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
