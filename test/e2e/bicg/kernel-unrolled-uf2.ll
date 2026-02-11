; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/bicg/kernel-only-uf2.ll'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/bicg/bicg.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32 %1, [116 x double]* nocapture readonly %2, double* nocapture %3, double* nocapture %4, double* nocapture readonly %5, double* nocapture readonly %6) local_unnamed_addr #0 {
  %8 = bitcast double* %4 to i8*
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %10, label %15

10:                                               ; preds = %7
  %11 = bitcast double* %3 to i8*
  %12 = zext i32 %0 to i64
  %13 = shl nuw nsw i64 %12, 3
  call void @llvm.memset.p0i8.i64(i8* align 8 %11, i8 0, i64 %13, i1 false)
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %20, label %47

15:                                               ; preds = %7
  %16 = icmp sgt i32 %1, 0
  br i1 %16, label %17, label %47

17:                                               ; preds = %15
  %18 = zext i32 %1 to i64
  %19 = shl nuw nsw i64 %18, 3
  call void @llvm.memset.p0i8.i64(i8* align 8 %8, i8 0, i64 %19, i1 false)
  br label %47

20:                                               ; preds = %10
  %21 = zext i32 %1 to i64
  %22 = zext i32 %0 to i64
  br label %23

23:                                               ; preds = %44, %20
  %24 = phi i64 [ 0, %20 ], [ %45, %44 ]
  %25 = getelementptr inbounds double, double* %4, i64 %24
  store double 0.000000e+00, double* %25, align 8, !tbaa !2
  %26 = getelementptr inbounds double, double* %6, i64 %24
  br label %27

27:                                               ; preds = %27, %23
  %28 = phi i64 [ 0, %23 ], [ %42, %27 ]
  %29 = getelementptr inbounds double, double* %3, i64 %28
  %30 = load double, double* %29, align 8, !tbaa !2
  %31 = load double, double* %26, align 8, !tbaa !2
  %32 = getelementptr inbounds [116 x double], [116 x double]* %2, i64 %24, i64 %28
  %33 = load double, double* %32, align 8, !tbaa !2
  %34 = fmul double %31, %33
  %35 = fadd double %30, %34
  store double %35, double* %29, align 8, !tbaa !2
  %36 = load double, double* %25, align 8, !tbaa !2
  %37 = load double, double* %32, align 8, !tbaa !2
  %38 = getelementptr inbounds double, double* %5, i64 %28
  %39 = load double, double* %38, align 8, !tbaa !2
  %40 = fmul double %37, %39
  %41 = fadd double %36, %40
  store double %41, double* %25, align 8, !tbaa !2
  %42 = add nuw nsw i64 %28, 1
  %43 = icmp eq i64 %42, %22
  br i1 %43, label %44, label %27, !llvm.loop !6

44:                                               ; preds = %27
  %45 = add nuw nsw i64 %24, 1
  %46 = icmp eq i64 %45, %21
  br i1 %46, label %.loopexit, label %23, !llvm.loop !9

.loopexit:                                        ; preds = %44
  br label %47

47:                                               ; preds = %.loopexit, %17, %15, %10
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
!3 = !{!"double", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !7, !8}
