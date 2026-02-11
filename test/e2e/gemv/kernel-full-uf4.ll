; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/gemv/kernel_uf4.cpp'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/gemv/kernel_uf4.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable mustprogress
define dso_local void @kernel_gemv_int(i32* nocapture readonly %0, i32* nocapture readonly %1, i32* nocapture %2) local_unnamed_addr #0 {
  %4 = getelementptr inbounds i32, i32* %1, i64 1
  %5 = getelementptr inbounds i32, i32* %1, i64 2
  %6 = getelementptr inbounds i32, i32* %1, i64 3
  br label %7

7:                                                ; preds = %3, %7
  %8 = phi i64 [ 0, %3 ], [ %33, %7 ]
  %9 = shl nsw i64 %8, 2
  %10 = getelementptr inbounds i32, i32* %0, i64 %9
  %11 = load i32, i32* %10, align 4, !tbaa !2
  %12 = load i32, i32* %1, align 4, !tbaa !2
  %13 = mul nsw i32 %12, %11
  %14 = or i64 %9, 1
  %15 = getelementptr inbounds i32, i32* %0, i64 %14
  %16 = load i32, i32* %15, align 4, !tbaa !2
  %17 = load i32, i32* %4, align 4, !tbaa !2
  %18 = mul nsw i32 %17, %16
  %19 = add nsw i32 %13, %18
  %20 = or i64 %9, 2
  %21 = getelementptr inbounds i32, i32* %0, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !2
  %23 = load i32, i32* %5, align 4, !tbaa !2
  %24 = mul nsw i32 %23, %22
  %25 = add nsw i32 %19, %24
  %26 = or i64 %9, 3
  %27 = getelementptr inbounds i32, i32* %0, i64 %26
  %28 = load i32, i32* %27, align 4, !tbaa !2
  %29 = load i32, i32* %6, align 4, !tbaa !2
  %30 = mul nsw i32 %29, %28
  %31 = add nsw i32 %25, %30
  %32 = getelementptr inbounds i32, i32* %2, i64 %8
  store i32 %31, i32* %32, align 4, !tbaa !2
  %33 = add nuw nsw i64 %8, 1
  %34 = icmp eq i64 %33, 4
  br i1 %34, label %35, label %7, !llvm.loop !6

35:                                               ; preds = %7
  ret void
}

; Function Attrs: nofree norecurse nounwind uwtable mustprogress
define dso_local i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %1, %0
  %2 = phi i64 [ 0, %0 ], [ %3, %1 ]
  %3 = add nuw nsw i64 %2, 1
  %4 = icmp eq i64 %3, 4
  br i1 %4, label %5, label %1, !llvm.loop !6

5:                                                ; preds = %1
  ret i32 0
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
