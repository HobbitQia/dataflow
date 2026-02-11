; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/histogram/kernel-full-uf4.ll'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/histogram/kernel_uf4.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nounwind uwtable
define dso_local void @_Z6kernelPiS_(i32* nocapture readonly %0, i32* nocapture %1) local_unnamed_addr #0 {
  br label %3

3:                                                ; preds = %3, %2
  %4 = phi i64 [ 0, %2 ], [ %44, %3 ]
  %5 = getelementptr inbounds i32, i32* %0, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !2
  %7 = mul i32 %6, 5
  %8 = add i32 %7, -5
  %9 = sdiv i32 %8, 18
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds i32, i32* %1, i64 %10
  %12 = load i32, i32* %11, align 4, !tbaa !2
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %11, align 4, !tbaa !2
  %14 = or i64 %4, 1
  %15 = getelementptr inbounds i32, i32* %0, i64 %14
  %16 = load i32, i32* %15, align 4, !tbaa !2
  %17 = mul i32 %16, 5
  %18 = add i32 %17, -5
  %19 = sdiv i32 %18, 18
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32* %1, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !2
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* %21, align 4, !tbaa !2
  %24 = or i64 %4, 2
  %25 = getelementptr inbounds i32, i32* %0, i64 %24
  %26 = load i32, i32* %25, align 4, !tbaa !2
  %27 = mul i32 %26, 5
  %28 = add i32 %27, -5
  %29 = sdiv i32 %28, 18
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i32, i32* %1, i64 %30
  %32 = load i32, i32* %31, align 4, !tbaa !2
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %31, align 4, !tbaa !2
  %34 = or i64 %4, 3
  %35 = getelementptr inbounds i32, i32* %0, i64 %34
  %36 = load i32, i32* %35, align 4, !tbaa !2
  %37 = mul i32 %36, 5
  %38 = add i32 %37, -5
  %39 = sdiv i32 %38, 18
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32* %1, i64 %40
  %42 = load i32, i32* %41, align 4, !tbaa !2
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %41, align 4, !tbaa !2
  %44 = add nuw nsw i64 %4, 4
  %45 = icmp ult i64 %4, 16
  br i1 %45, label %3, label %46, !llvm.loop !6

46:                                               ; preds = %3
  ret void
}

attributes #0 = { mustprogress nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 12.0.1-19ubuntu3"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C++ TBAA"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
