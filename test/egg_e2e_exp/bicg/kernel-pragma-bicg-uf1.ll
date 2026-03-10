; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/bicg/kernel-pragma-bicg-uf1-full.ll'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/bicg/bicg_standalone_uf1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel([256 x i32]* nocapture readonly %0, i32* nocapture %1, i32* nocapture %2, i32* nocapture readonly %3, i32* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = bitcast i32* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull align 4 dereferenceable(1024) %6, i8 0, i64 1024, i1 false)
  br label %7

7:                                                ; preds = %28, %5
  %8 = phi i64 [ 0, %5 ], [ %29, %28 ]
  %9 = getelementptr inbounds i32, i32* %2, i64 %8
  store i32 0, i32* %9, align 4, !tbaa !2
  %10 = getelementptr inbounds i32, i32* %4, i64 %8
  br label %11

11:                                               ; preds = %11, %7
  %12 = phi i64 [ 0, %7 ], [ %26, %11 ]
  %13 = getelementptr inbounds i32, i32* %1, i64 %12
  %14 = load i32, i32* %13, align 4, !tbaa !2
  %15 = load i32, i32* %10, align 4, !tbaa !2
  %16 = getelementptr inbounds [256 x i32], [256 x i32]* %0, i64 %8, i64 %12
  %17 = load i32, i32* %16, align 4, !tbaa !2
  %18 = mul nsw i32 %17, %15
  %19 = add nsw i32 %18, %14
  store i32 %19, i32* %13, align 4, !tbaa !2
  %20 = load i32, i32* %9, align 4, !tbaa !2
  %21 = load i32, i32* %16, align 4, !tbaa !2
  %22 = getelementptr inbounds i32, i32* %3, i64 %12
  %23 = load i32, i32* %22, align 4, !tbaa !2
  %24 = mul nsw i32 %23, %21
  %25 = add nsw i32 %24, %20
  store i32 %25, i32* %9, align 4, !tbaa !2
  %26 = add nuw nsw i64 %12, 1
  %27 = icmp eq i64 %26, 256
  br i1 %27, label %28, label %11, !llvm.loop !6

28:                                               ; preds = %11
  %29 = add nuw nsw i64 %8, 1
  %30 = icmp eq i64 %29, 256
  br i1 %30, label %31, label %7, !llvm.loop !9

31:                                               ; preds = %28
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #1

attributes #0 = { nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nofree nounwind willreturn writeonly }

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
!8 = !{!"llvm.loop.unroll.count", i32 1}
!9 = distinct !{!9, !7, !10}
!10 = !{!"llvm.loop.unroll.disable"}
