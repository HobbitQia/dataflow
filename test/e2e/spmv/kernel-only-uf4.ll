; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/spmv/kernel-full-uf4.ll'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/spmv/kernel_uf4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32* nocapture readonly %1, i32* nocapture readonly %2, i32* nocapture readonly %3, i32* nocapture readonly %4, i32* nocapture %5) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %8, label %73

8:                                                ; preds = %6
  %9 = zext i32 %0 to i64
  br label %10

10:                                               ; preds = %10, %8
  %11 = phi i64 [ 0, %8 ], [ %71, %10 ]
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
  %26 = or i64 %11, 1
  %27 = getelementptr inbounds i32, i32* %1, i64 %26
  %28 = load i32, i32* %27, align 4, !tbaa !2
  %29 = getelementptr inbounds i32, i32* %2, i64 %26
  %30 = load i32, i32* %29, align 4, !tbaa !2
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32* %4, i64 %31
  %33 = load i32, i32* %32, align 4, !tbaa !2
  %34 = mul nsw i32 %33, %28
  %35 = getelementptr inbounds i32, i32* %3, i64 %26
  %36 = load i32, i32* %35, align 4, !tbaa !2
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i32, i32* %5, i64 %37
  %39 = load i32, i32* %38, align 4, !tbaa !2
  %40 = add nsw i32 %39, %34
  store i32 %40, i32* %38, align 4, !tbaa !2
  %41 = or i64 %11, 2
  %42 = getelementptr inbounds i32, i32* %1, i64 %41
  %43 = load i32, i32* %42, align 4, !tbaa !2
  %44 = getelementptr inbounds i32, i32* %2, i64 %41
  %45 = load i32, i32* %44, align 4, !tbaa !2
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32* %4, i64 %46
  %48 = load i32, i32* %47, align 4, !tbaa !2
  %49 = mul nsw i32 %48, %43
  %50 = getelementptr inbounds i32, i32* %3, i64 %41
  %51 = load i32, i32* %50, align 4, !tbaa !2
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32* %5, i64 %52
  %54 = load i32, i32* %53, align 4, !tbaa !2
  %55 = add nsw i32 %54, %49
  store i32 %55, i32* %53, align 4, !tbaa !2
  %56 = or i64 %11, 3
  %57 = getelementptr inbounds i32, i32* %1, i64 %56
  %58 = load i32, i32* %57, align 4, !tbaa !2
  %59 = getelementptr inbounds i32, i32* %2, i64 %56
  %60 = load i32, i32* %59, align 4, !tbaa !2
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32* %4, i64 %61
  %63 = load i32, i32* %62, align 4, !tbaa !2
  %64 = mul nsw i32 %63, %58
  %65 = getelementptr inbounds i32, i32* %3, i64 %56
  %66 = load i32, i32* %65, align 4, !tbaa !2
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32* %5, i64 %67
  %69 = load i32, i32* %68, align 4, !tbaa !2
  %70 = add nsw i32 %69, %64
  store i32 %70, i32* %68, align 4, !tbaa !2
  %71 = add nuw nsw i64 %11, 4
  %72 = icmp ult i64 %71, %9
  br i1 %72, label %10, label %73, !llvm.loop !6

73:                                               ; preds = %10, %6
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
