; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/bicg/kernel_uf4.c'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/bicg/kernel_uf4.c"
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
  br i1 %14, label %20, label %89

15:                                               ; preds = %7
  %16 = icmp sgt i32 %1, 0
  br i1 %16, label %17, label %89

17:                                               ; preds = %15
  %18 = zext i32 %1 to i64
  %19 = shl nuw nsw i64 %18, 3
  call void @llvm.memset.p0i8.i64(i8* align 8 %8, i8 0, i64 %19, i1 false)
  br label %89

20:                                               ; preds = %10
  %21 = sext i32 %0 to i64
  %22 = zext i32 %1 to i64
  br label %23

23:                                               ; preds = %20, %86
  %24 = phi i64 [ 0, %20 ], [ %87, %86 ]
  %25 = getelementptr inbounds double, double* %4, i64 %24
  store double 0.000000e+00, double* %25, align 8, !tbaa !2
  %26 = getelementptr inbounds double, double* %6, i64 %24
  br label %27

27:                                               ; preds = %23, %27
  %28 = phi i64 [ 0, %23 ], [ %84, %27 ]
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
  %42 = or i64 %28, 1
  %43 = getelementptr inbounds double, double* %3, i64 %42
  %44 = load double, double* %43, align 8, !tbaa !2
  %45 = load double, double* %26, align 8, !tbaa !2
  %46 = getelementptr inbounds [116 x double], [116 x double]* %2, i64 %24, i64 %42
  %47 = load double, double* %46, align 8, !tbaa !2
  %48 = fmul double %45, %47
  %49 = fadd double %44, %48
  store double %49, double* %43, align 8, !tbaa !2
  %50 = load double, double* %25, align 8, !tbaa !2
  %51 = load double, double* %46, align 8, !tbaa !2
  %52 = getelementptr inbounds double, double* %5, i64 %42
  %53 = load double, double* %52, align 8, !tbaa !2
  %54 = fmul double %51, %53
  %55 = fadd double %50, %54
  store double %55, double* %25, align 8, !tbaa !2
  %56 = or i64 %28, 2
  %57 = getelementptr inbounds double, double* %3, i64 %56
  %58 = load double, double* %57, align 8, !tbaa !2
  %59 = load double, double* %26, align 8, !tbaa !2
  %60 = getelementptr inbounds [116 x double], [116 x double]* %2, i64 %24, i64 %56
  %61 = load double, double* %60, align 8, !tbaa !2
  %62 = fmul double %59, %61
  %63 = fadd double %58, %62
  store double %63, double* %57, align 8, !tbaa !2
  %64 = load double, double* %25, align 8, !tbaa !2
  %65 = load double, double* %60, align 8, !tbaa !2
  %66 = getelementptr inbounds double, double* %5, i64 %56
  %67 = load double, double* %66, align 8, !tbaa !2
  %68 = fmul double %65, %67
  %69 = fadd double %64, %68
  store double %69, double* %25, align 8, !tbaa !2
  %70 = or i64 %28, 3
  %71 = getelementptr inbounds double, double* %3, i64 %70
  %72 = load double, double* %71, align 8, !tbaa !2
  %73 = load double, double* %26, align 8, !tbaa !2
  %74 = getelementptr inbounds [116 x double], [116 x double]* %2, i64 %24, i64 %70
  %75 = load double, double* %74, align 8, !tbaa !2
  %76 = fmul double %73, %75
  %77 = fadd double %72, %76
  store double %77, double* %71, align 8, !tbaa !2
  %78 = load double, double* %25, align 8, !tbaa !2
  %79 = load double, double* %74, align 8, !tbaa !2
  %80 = getelementptr inbounds double, double* %5, i64 %70
  %81 = load double, double* %80, align 8, !tbaa !2
  %82 = fmul double %79, %81
  %83 = fadd double %78, %82
  store double %83, double* %25, align 8, !tbaa !2
  %84 = add nuw nsw i64 %28, 4
  %85 = icmp slt i64 %84, %21
  br i1 %85, label %27, label %86, !llvm.loop !6

86:                                               ; preds = %27
  %87 = add nuw nsw i64 %24, 1
  %88 = icmp eq i64 %87, %22
  br i1 %88, label %89, label %23, !llvm.loop !9

89:                                               ; preds = %86, %15, %17, %10
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %0, i8** nocapture readnone %1) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 14384, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 116, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 124, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 116, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 124, i32 8) #4
  %8 = bitcast i8* %3 to [116 x double]*
  %9 = bitcast i8* %6 to double*
  br label %10

10:                                               ; preds = %10, %2
  %11 = phi i64 [ 0, %2 ], [ %18, %10 ]
  %12 = phi i32 [ 0, %2 ], [ %19, %10 ]
  %13 = trunc i32 %12 to i8
  %14 = urem i8 %13, 116
  %15 = uitofp i8 %14 to double
  %16 = fdiv double %15, 1.160000e+02
  %17 = getelementptr inbounds double, double* %9, i64 %11
  store double %16, double* %17, align 8, !tbaa !2
  %18 = add nuw nsw i64 %11, 1
  %19 = add nuw nsw i32 %12, 1
  %20 = icmp eq i64 %18, 116
  br i1 %20, label %21, label %10, !llvm.loop !10

21:                                               ; preds = %10
  %22 = bitcast i8* %7 to double*
  br label %23

23:                                               ; preds = %21, %41
  %24 = phi i64 [ %42, %41 ], [ 0, %21 ]
  %25 = phi i32 [ %43, %41 ], [ 0, %21 ]
  %26 = trunc i32 %25 to i8
  %27 = urem i8 %26, 124
  %28 = uitofp i8 %27 to double
  %29 = fdiv double %28, 1.240000e+02
  %30 = getelementptr inbounds double, double* %22, i64 %24
  store double %29, double* %30, align 8, !tbaa !2
  br label %31

31:                                               ; preds = %31, %23
  %32 = phi i64 [ 0, %23 ], [ %33, %31 ]
  %33 = add nuw nsw i64 %32, 1
  %34 = mul nuw nsw i64 %33, %24
  %35 = trunc i64 %34 to i32
  %36 = urem i32 %35, 124
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 1.240000e+02
  %39 = getelementptr inbounds [116 x double], [116 x double]* %8, i64 %24, i64 %32
  store double %38, double* %39, align 8, !tbaa !2
  %40 = icmp eq i64 %33, 116
  br i1 %40, label %41, label %31, !llvm.loop !11

41:                                               ; preds = %31
  %42 = add nuw nsw i64 %24, 1
  %43 = add nuw nsw i32 %25, 1
  %44 = icmp eq i64 %42, 124
  br i1 %44, label %45, label %23, !llvm.loop !12

45:                                               ; preds = %41
  %46 = bitcast i8* %4 to double*
  %47 = bitcast i8* %5 to double*
  tail call void @kernel(i32 116, i32 124, [116 x double]* nonnull %8, double* %46, double* %47, double* %9, double* %22)
  ret i32 0
}

declare dso_local i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

attributes #0 = { nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nofree nosync nounwind willreturn writeonly }
attributes #4 = { nounwind }

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
!11 = distinct !{!11, !7, !8}
!12 = distinct !{!12, !7, !8}
