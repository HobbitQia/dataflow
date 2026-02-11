; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/gemm/kernel-full-uf4.ll'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/gemm/kernel_uf4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32 %1, i32 %2, [1100 x double]* nocapture %3, [1200 x double]* nocapture readonly %4, [1100 x double]* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %8, label %61

8:                                                ; preds = %6
  %9 = icmp slt i32 %2, 1
  %10 = icmp slt i32 %1, 1
  %11 = sext i32 %1 to i64
  %12 = zext i32 %0 to i64
  %13 = zext i32 %2 to i64
  br label %14

14:                                               ; preds = %58, %8
  %15 = phi i64 [ 0, %8 ], [ %59, %58 ]
  %16 = or i1 %9, %10
  br i1 %16, label %58, label %17

17:                                               ; preds = %55, %14
  %18 = phi i64 [ %56, %55 ], [ 0, %14 ]
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %15, i64 %18
  br label %20

20:                                               ; preds = %20, %17
  %21 = phi i64 [ 0, %17 ], [ %53, %20 ]
  %22 = load double, double* %19, align 8, !tbaa !2
  %23 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %18, i64 %21
  %24 = load double, double* %23, align 8, !tbaa !2
  %25 = fmul double %22, %24
  %26 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %15, i64 %21
  %27 = load double, double* %26, align 8, !tbaa !2
  %28 = fadd double %27, %25
  store double %28, double* %26, align 8, !tbaa !2
  %29 = load double, double* %19, align 8, !tbaa !2
  %30 = or i64 %21, 1
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %18, i64 %30
  %32 = load double, double* %31, align 8, !tbaa !2
  %33 = fmul double %29, %32
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %15, i64 %30
  %35 = load double, double* %34, align 8, !tbaa !2
  %36 = fadd double %35, %33
  store double %36, double* %34, align 8, !tbaa !2
  %37 = load double, double* %19, align 8, !tbaa !2
  %38 = or i64 %21, 2
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %18, i64 %38
  %40 = load double, double* %39, align 8, !tbaa !2
  %41 = fmul double %37, %40
  %42 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %15, i64 %38
  %43 = load double, double* %42, align 8, !tbaa !2
  %44 = fadd double %43, %41
  store double %44, double* %42, align 8, !tbaa !2
  %45 = load double, double* %19, align 8, !tbaa !2
  %46 = or i64 %21, 3
  %47 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %18, i64 %46
  %48 = load double, double* %47, align 8, !tbaa !2
  %49 = fmul double %45, %48
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %15, i64 %46
  %51 = load double, double* %50, align 8, !tbaa !2
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8, !tbaa !2
  %53 = add nuw nsw i64 %21, 4
  %54 = icmp slt i64 %53, %11
  br i1 %54, label %20, label %55, !llvm.loop !6

55:                                               ; preds = %20
  %56 = add nuw nsw i64 %18, 1
  %57 = icmp eq i64 %56, %13
  br i1 %57, label %58, label %17, !llvm.loop !9

58:                                               ; preds = %55, %14
  %59 = add nuw nsw i64 %15, 1
  %60 = icmp eq i64 %59, %12
  br i1 %60, label %61, label %14, !llvm.loop !10

61:                                               ; preds = %58, %6
  ret void
}

attributes #0 = { nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 12.0.1-19ubuntu3"}
!2 = !{!3, !3, i64 0}
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
