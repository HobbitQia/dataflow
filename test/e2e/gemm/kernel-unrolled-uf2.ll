; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/gemm/kernel-only-uf2.ll'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/gemm/gemm.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32 %1, i32 %2, [1100 x double]* nocapture %3, [1200 x double]* nocapture readonly %4, [1100 x double]* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %2, 0
  %9 = icmp sgt i32 %1, 0
  %10 = and i1 %7, %8
  br i1 %10, label %11, label %53

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

.loopexit:                                        ; preds = %32
  br label %18

18:                                               ; preds = %.loopexit, %16
  %19 = add nuw nsw i64 %17, 1
  %20 = icmp eq i64 %19, %12
  br i1 %20, label %.loopexit1, label %16, !llvm.loop !2

21:                                               ; preds = %.preheader, %32
  %22 = phi i64 [ %33, %32 ], [ 0, %.preheader ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %17, i64 %22
  %xtraiter = and i64 %14, 1
  %24 = icmp ult i64 %15, 1
  br i1 %24, label %.unr-lcssa, label %.new

.new:                                             ; preds = %21
  %unroll_iter = sub i64 %14, %xtraiter
  br label %35

.unr-lcssa.loopexit:                              ; preds = %35
  %.unr.ph = phi i64 [ %52, %35 ]
  br label %.unr-lcssa

.unr-lcssa:                                       ; preds = %.unr-lcssa.loopexit, %21
  %.unr = phi i64 [ 0, %21 ], [ %.unr.ph, %.unr-lcssa.loopexit ]
  %lcmp.mod = icmp ne i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.epil.preheader, label %32

.epil.preheader:                                  ; preds = %.unr-lcssa
  br label %.epilog-lcssa

.epilog-lcssa:                                    ; preds = %.epil.preheader
  %25 = load double, double* %23, align 8, !tbaa !5
  %26 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %22, i64 %.unr
  %27 = load double, double* %26, align 8, !tbaa !5
  %28 = fmul double %25, %27
  %29 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %17, i64 %.unr
  %30 = load double, double* %29, align 8, !tbaa !5
  %31 = fadd double %30, %28
  store double %31, double* %29, align 8, !tbaa !5
  br label %32

32:                                               ; preds = %.unr-lcssa, %.epilog-lcssa
  %33 = add nuw nsw i64 %22, 1
  %34 = icmp eq i64 %33, %13
  br i1 %34, label %.loopexit, label %21, !llvm.loop !9

35:                                               ; preds = %35, %.new
  %36 = phi i64 [ 0, %.new ], [ %52, %35 ]
  %niter = phi i64 [ 0, %.new ], [ %niter.next.1, %35 ]
  %37 = load double, double* %23, align 8, !tbaa !5
  %38 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %22, i64 %36
  %39 = load double, double* %38, align 8, !tbaa !5
  %40 = fmul double %37, %39
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %17, i64 %36
  %42 = load double, double* %41, align 8, !tbaa !5
  %43 = fadd double %42, %40
  store double %43, double* %41, align 8, !tbaa !5
  %44 = add nuw nsw i64 %36, 1
  %niter.next = add nuw nsw i64 %niter, 1
  %45 = load double, double* %23, align 8, !tbaa !5
  %46 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %22, i64 %44
  %47 = load double, double* %46, align 8, !tbaa !5
  %48 = fmul double %45, %47
  %49 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %17, i64 %44
  %50 = load double, double* %49, align 8, !tbaa !5
  %51 = fadd double %50, %48
  store double %51, double* %49, align 8, !tbaa !5
  %52 = add nuw nsw i64 %44, 1
  %niter.next.1 = add i64 %niter.next, 1
  %niter.ncmp.1 = icmp eq i64 %niter.next.1, %unroll_iter
  br i1 %niter.ncmp.1, label %.unr-lcssa.loopexit, label %35, !llvm.loop !10

.loopexit1:                                       ; preds = %18
  br label %53

53:                                               ; preds = %.loopexit1, %6
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
!9 = distinct !{!9, !3, !4}
!10 = distinct !{!10, !3, !11, !12, !4}
!11 = !{!"llvm.loop.vectorize.width", i32 1}
!12 = !{!"llvm.loop.vectorize.followup_all", !13}
!13 = distinct !{!13, !3, !14, !15}
!14 = !{!"llvm.loop.isvectorized"}
!15 = !{!"llvm.loop.unroll.count", i32 2}
