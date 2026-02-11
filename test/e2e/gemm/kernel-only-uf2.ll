; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/gemm/kernel-full-uf2.ll'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/gemm/kernel_uf2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32 %1, i32 %2, [1100 x double]* nocapture %3, [1200 x double]* nocapture readonly %4, [1100 x double]* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %2, 0
  %9 = icmp sgt i32 %1, 0
  %10 = and i1 %7, %8
  br i1 %10, label %11, label %45

11:                                               ; preds = %6
  %12 = sext i32 %1 to i64
  %13 = zext i32 %0 to i64
  %14 = zext i32 %2 to i64
  br label %15

15:                                               ; preds = %17, %11
  %16 = phi i64 [ 0, %11 ], [ %18, %17 ]
  br i1 %9, label %20, label %17

17:                                               ; preds = %23, %15
  %18 = add nuw nsw i64 %16, 1
  %19 = icmp eq i64 %18, %13
  br i1 %19, label %45, label %15, !llvm.loop !2

20:                                               ; preds = %23, %15
  %21 = phi i64 [ %24, %23 ], [ 0, %15 ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %16, i64 %21
  br label %26

23:                                               ; preds = %26
  %24 = add nuw nsw i64 %21, 1
  %25 = icmp eq i64 %24, %14
  br i1 %25, label %17, label %20, !llvm.loop !5

26:                                               ; preds = %26, %20
  %27 = phi i64 [ %43, %26 ], [ 0, %20 ]
  %28 = load double, double* %22, align 8, !tbaa !6
  %29 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %21, i64 %27
  %30 = load double, double* %29, align 8, !tbaa !6
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %16, i64 %27
  %33 = load double, double* %32, align 8, !tbaa !6
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8, !tbaa !6
  %35 = load double, double* %22, align 8, !tbaa !6
  %36 = or i64 %27, 1
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %21, i64 %36
  %38 = load double, double* %37, align 8, !tbaa !6
  %39 = fmul double %35, %38
  %40 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %16, i64 %36
  %41 = load double, double* %40, align 8, !tbaa !6
  %42 = fadd double %41, %39
  store double %42, double* %40, align 8, !tbaa !6
  %43 = add nuw nsw i64 %27, 2
  %44 = icmp slt i64 %43, %12
  br i1 %44, label %26, label %23, !llvm.loop !10

45:                                               ; preds = %17, %6
  ret void
}

attributes #0 = { nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"Ubuntu clang version 12.0.1-19ubuntu3"}
!2 = distinct !{!2, !3, !4}
!3 = !{!"llvm.loop.mustprogress"}
!4 = !{!"llvm.loop.unroll.disable"}
!5 = distinct !{!5, !3, !4}
!6 = !{!7, !7, i64 0}
!7 = !{!"double", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = distinct !{!10, !3, !4}
