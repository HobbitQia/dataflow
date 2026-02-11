; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/gemm/kernel-only-uf4.ll'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/gemm/gemm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32 %1, i32 %2, [1100 x double]* nocapture %3, [1200 x double]* nocapture readonly %4, [1100 x double]* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %2, 0
  %9 = icmp sgt i32 %1, 0
  %10 = and i1 %7, %8
  br i1 %10, label %11, label %73

11:                                               ; preds = %6
  %12 = zext i32 %0 to i64
  %13 = zext i32 %2 to i64
  %14 = zext i32 %1 to i64
  %15 = add nsw i64 %14, -1
  br label %16

16:                                               ; preds = %18, %11
  %17 = phi i64 [ 0, %11 ], [ %19, %18 ]
  br i1 %9, label %.preheader, label %18

.preheader:                                       ; preds = %16
  br label %21

.loopexit:                                        ; preds = %36
  br label %18

18:                                               ; preds = %.loopexit, %16
  %19 = add nuw nsw i64 %17, 1
  %20 = icmp eq i64 %19, %12
  br i1 %20, label %.loopexit1, label %16, !llvm.loop !2

21:                                               ; preds = %.preheader, %36
  %22 = phi i64 [ %37, %36 ], [ 0, %.preheader ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %17, i64 %22
  %xtraiter = and i64 %14, 3
  %24 = icmp ult i64 %15, 3
  br i1 %24, label %.unr-lcssa, label %.new

.new:                                             ; preds = %21
  %unroll_iter = sub i64 %14, %xtraiter
  br label %39

.unr-lcssa.loopexit:                              ; preds = %39
  %.unr.ph = phi i64 [ %72, %39 ]
  br label %.unr-lcssa

.unr-lcssa:                                       ; preds = %.unr-lcssa.loopexit, %21
  %.unr = phi i64 [ 0, %21 ], [ %.unr.ph, %.unr-lcssa.loopexit ]
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.epil.preheader, label %36

.epil.preheader:                                  ; preds = %.unr-lcssa
  br label %25

25:                                               ; preds = %25, %.epil.preheader
  %26 = phi i64 [ %34, %25 ], [ %.unr, %.epil.preheader ]
  %epil.iter = phi i64 [ 0, %.epil.preheader ], [ %epil.iter.next, %25 ]
  %27 = load double, double* %23, align 8, !tbaa !5
  %28 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %22, i64 %26
  %29 = load double, double* %28, align 8, !tbaa !5
  %30 = fmul double %27, %29
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %17, i64 %26
  %32 = load double, double* %31, align 8, !tbaa !5
  %33 = fadd double %32, %30
  store double %33, double* %31, align 8, !tbaa !5
  %34 = add nuw nsw i64 %26, 1
  %35 = icmp eq i64 %34, %14
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp = icmp ne i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp, label %25, label %.epilog-lcssa, !llvm.loop !9

.epilog-lcssa:                                    ; preds = %25
  br label %36

36:                                               ; preds = %.unr-lcssa, %.epilog-lcssa
  %37 = add nuw nsw i64 %22, 1
  %38 = icmp eq i64 %37, %13
  br i1 %38, label %.loopexit, label %21, !llvm.loop !10

39:                                               ; preds = %39, %.new
  %40 = phi i64 [ 0, %.new ], [ %72, %39 ]
  %niter = phi i64 [ 0, %.new ], [ %niter.next.3, %39 ]
  %41 = load double, double* %23, align 8, !tbaa !5
  %42 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %22, i64 %40
  %43 = load double, double* %42, align 8, !tbaa !5
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %17, i64 %40
  %46 = load double, double* %45, align 8, !tbaa !5
  %47 = fadd double %46, %44
  store double %47, double* %45, align 8, !tbaa !5
  %48 = add nuw nsw i64 %40, 1
  %niter.next = add nuw nsw i64 %niter, 1
  %49 = load double, double* %23, align 8, !tbaa !5
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %22, i64 %48
  %51 = load double, double* %50, align 8, !tbaa !5
  %52 = fmul double %49, %51
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %17, i64 %48
  %54 = load double, double* %53, align 8, !tbaa !5
  %55 = fadd double %54, %52
  store double %55, double* %53, align 8, !tbaa !5
  %56 = add nuw nsw i64 %48, 1
  %niter.next.1 = add nuw nsw i64 %niter.next, 1
  %57 = load double, double* %23, align 8, !tbaa !5
  %58 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %22, i64 %56
  %59 = load double, double* %58, align 8, !tbaa !5
  %60 = fmul double %57, %59
  %61 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %17, i64 %56
  %62 = load double, double* %61, align 8, !tbaa !5
  %63 = fadd double %62, %60
  store double %63, double* %61, align 8, !tbaa !5
  %64 = add nuw nsw i64 %56, 1
  %niter.next.2 = add nuw nsw i64 %niter.next.1, 1
  %65 = load double, double* %23, align 8, !tbaa !5
  %66 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %22, i64 %64
  %67 = load double, double* %66, align 8, !tbaa !5
  %68 = fmul double %65, %67
  %69 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %17, i64 %64
  %70 = load double, double* %69, align 8, !tbaa !5
  %71 = fadd double %70, %68
  store double %71, double* %69, align 8, !tbaa !5
  %72 = add nuw nsw i64 %64, 1
  %niter.next.3 = add i64 %niter.next.2, 1
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %.unr-lcssa.loopexit, label %39, !llvm.loop !11

.loopexit1:                                       ; preds = %18
  br label %73

73:                                               ; preds = %.loopexit1, %6
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
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !4}
!10 = distinct !{!10, !3, !4}
!11 = distinct !{!11, !3, !12, !13, !4}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.vectorize.followup_all", !14}
!14 = distinct !{!14, !3, !15, !16}
!15 = !{!"llvm.loop.isvectorized"}
!16 = !{!"llvm.loop.unroll.count", i32 2}
