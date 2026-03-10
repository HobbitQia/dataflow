; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/axpy/kernel-large-full-uf1.ll'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/axpy/axpy_large.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable mustprogress
define dso_local void @kernel_axpy_int(i32* nocapture readonly %0, i32* nocapture %1) local_unnamed_addr #0 {
  br label %4

3:                                                ; preds = %4
  ret void

4:                                                ; preds = %4, %2
  %5 = phi i64 [ 0, %2 ], [ %12, %4 ]
  %6 = getelementptr inbounds i32, i32* %0, i64 %5
  %7 = load i32, i32* %6, align 4, !tbaa !2
  %8 = mul nsw i32 %7, 3
  %9 = getelementptr inbounds i32, i32* %1, i64 %5
  %10 = load i32, i32* %9, align 4, !tbaa !2
  %11 = add nsw i32 %8, %10
  store i32 %11, i32* %9, align 4, !tbaa !2
  %12 = add nuw nsw i64 %5, 1
  %13 = icmp eq i64 %12, 1024
  br i1 %13, label %3, label %4, !llvm.loop !6
}

attributes #0 = { nofree norecurse nounwind uwtable mustprogress "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

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
