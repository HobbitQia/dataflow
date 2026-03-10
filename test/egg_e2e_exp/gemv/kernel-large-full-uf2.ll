; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/gemv/kernel_uf2_large.cpp'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/gemv/kernel_uf2_large.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable mustprogress
define dso_local void @kernel_gemv_int(i32* nocapture readonly %0, i32* nocapture readonly %1, i32* nocapture %2) local_unnamed_addr #0 {
  br label %4

4:                                                ; preds = %3, %8
  %5 = phi i64 [ 0, %3 ], [ %10, %8 ]
  %6 = shl nsw i64 %5, 9
  br label %12

7:                                                ; preds = %8
  ret void

8:                                                ; preds = %12
  %9 = getelementptr inbounds i32, i32* %2, i64 %5
  store i32 %29, i32* %9, align 4, !tbaa !2
  %10 = add nuw nsw i64 %5, 1
  %11 = icmp eq i64 %10, 512
  br i1 %11, label %7, label %4, !llvm.loop !6

12:                                               ; preds = %4, %12
  %13 = phi i64 [ 0, %4 ], [ %30, %12 ]
  %14 = phi i32 [ 0, %4 ], [ %29, %12 ]
  %15 = add nuw nsw i64 %13, %6
  %16 = getelementptr inbounds i32, i32* %0, i64 %15
  %17 = load i32, i32* %16, align 4, !tbaa !2
  %18 = getelementptr inbounds i32, i32* %1, i64 %13
  %19 = load i32, i32* %18, align 4, !tbaa !2
  %20 = mul nsw i32 %19, %17
  %21 = add nsw i32 %20, %14
  %22 = or i64 %15, 1
  %23 = getelementptr inbounds i32, i32* %0, i64 %22
  %24 = load i32, i32* %23, align 4, !tbaa !2
  %25 = or i64 %13, 1
  %26 = getelementptr inbounds i32, i32* %1, i64 %25
  %27 = load i32, i32* %26, align 4, !tbaa !2
  %28 = mul nsw i32 %27, %24
  %29 = add nsw i32 %21, %28
  %30 = add nuw nsw i64 %13, 2
  %31 = icmp ult i64 %13, 510
  br i1 %31, label %12, label %8, !llvm.loop !9
}

; Function Attrs: nofree norecurse nounwind uwtable mustprogress
define dso_local i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %3, %0
  %2 = phi i64 [ 0, %0 ], [ %4, %3 ]
  br label %6

3:                                                ; preds = %6
  %4 = add nuw nsw i64 %2, 1
  %5 = icmp eq i64 %4, 512
  br i1 %5, label %10, label %1, !llvm.loop !6

6:                                                ; preds = %6, %1
  %7 = phi i64 [ 0, %1 ], [ %8, %6 ]
  %8 = add nuw nsw i64 %7, 2
  %9 = icmp ult i64 %7, 510
  br i1 %9, label %6, label %3, !llvm.loop !9

10:                                               ; preds = %3
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
!9 = distinct !{!9, !7, !8}
