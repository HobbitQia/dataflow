; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/gemm/kernel_uf2.c'
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

15:                                               ; preds = %11, %17
  %16 = phi i64 [ 0, %11 ], [ %18, %17 ]
  br i1 %9, label %20, label %17

17:                                               ; preds = %23, %15
  %18 = add nuw nsw i64 %16, 1
  %19 = icmp eq i64 %18, %13
  br i1 %19, label %45, label %15, !llvm.loop !2

20:                                               ; preds = %15, %23
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

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %0, i8** nocapture readnone %1) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #3
  %6 = bitcast i8* %3 to [1100 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  br label %8

8:                                                ; preds = %20, %2
  %9 = phi i64 [ 0, %2 ], [ %21, %20 ]
  br label %10

10:                                               ; preds = %10, %8
  %11 = phi i64 [ 0, %8 ], [ %18, %10 ]
  %12 = mul nuw nsw i64 %11, %9
  %13 = trunc i64 %12 to i32
  %14 = urem i32 %13, 1000
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.000000e+03
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %9, i64 %11
  store double %16, double* %17, align 8, !tbaa !6
  %18 = add nuw nsw i64 %11, 1
  %19 = icmp eq i64 %18, 1100
  br i1 %19, label %20, label %10, !llvm.loop !11

20:                                               ; preds = %10
  %21 = add nuw nsw i64 %9, 1
  %22 = icmp eq i64 %21, 1000
  br i1 %22, label %23, label %8, !llvm.loop !12

23:                                               ; preds = %20
  %24 = bitcast i8* %5 to [1100 x double]*
  br label %25

25:                                               ; preds = %23, %37
  %26 = phi i64 [ %38, %37 ], [ 0, %23 ]
  br label %27

27:                                               ; preds = %27, %25
  %28 = phi i64 [ 0, %25 ], [ %29, %27 ]
  %29 = add nuw nsw i64 %28, 1
  %30 = mul nuw nsw i64 %29, %26
  %31 = trunc i64 %30 to i32
  %32 = urem i32 %31, 1200
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 1.200000e+03
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %26, i64 %28
  store double %34, double* %35, align 8, !tbaa !6
  %36 = icmp eq i64 %29, 1200
  br i1 %36, label %37, label %27, !llvm.loop !13

37:                                               ; preds = %27
  %38 = add nuw nsw i64 %26, 1
  %39 = icmp eq i64 %38, 1000
  br i1 %39, label %40, label %25, !llvm.loop !14

40:                                               ; preds = %37, %53
  %41 = phi i64 [ %54, %53 ], [ 0, %37 ]
  br label %42

42:                                               ; preds = %42, %40
  %43 = phi i64 [ 0, %40 ], [ %51, %42 ]
  %44 = add nuw nsw i64 %43, 2
  %45 = mul nuw nsw i64 %44, %41
  %46 = trunc i64 %45 to i32
  %47 = urem i32 %46, 1100
  %48 = sitofp i32 %47 to double
  %49 = fdiv double %48, 1.100000e+03
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %24, i64 %41, i64 %43
  store double %49, double* %50, align 8, !tbaa !6
  %51 = add nuw nsw i64 %43, 1
  %52 = icmp eq i64 %51, 1100
  br i1 %52, label %53, label %42, !llvm.loop !15

53:                                               ; preds = %42
  %54 = add nuw nsw i64 %41, 1
  %55 = icmp eq i64 %54, 1200
  br i1 %55, label %56, label %40, !llvm.loop !16

56:                                               ; preds = %53, %58
  %57 = phi i64 [ %59, %58 ], [ 0, %53 ]
  br label %61

58:                                               ; preds = %64
  %59 = add nuw nsw i64 %57, 1
  %60 = icmp eq i64 %59, 1000
  br i1 %60, label %86, label %56, !llvm.loop !2

61:                                               ; preds = %64, %56
  %62 = phi i64 [ %65, %64 ], [ 0, %56 ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %57, i64 %62
  br label %67

64:                                               ; preds = %67
  %65 = add nuw nsw i64 %62, 1
  %66 = icmp eq i64 %65, 1200
  br i1 %66, label %58, label %61, !llvm.loop !5

67:                                               ; preds = %67, %61
  %68 = phi i64 [ %84, %67 ], [ 0, %61 ]
  %69 = load double, double* %63, align 8, !tbaa !6
  %70 = getelementptr inbounds [1100 x double], [1100 x double]* %24, i64 %62, i64 %68
  %71 = load double, double* %70, align 8, !tbaa !6
  %72 = fmul double %69, %71
  %73 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %57, i64 %68
  %74 = load double, double* %73, align 8, !tbaa !6
  %75 = fadd double %74, %72
  store double %75, double* %73, align 8, !tbaa !6
  %76 = load double, double* %63, align 8, !tbaa !6
  %77 = or i64 %68, 1
  %78 = getelementptr inbounds [1100 x double], [1100 x double]* %24, i64 %62, i64 %77
  %79 = load double, double* %78, align 8, !tbaa !6
  %80 = fmul double %76, %79
  %81 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %57, i64 %77
  %82 = load double, double* %81, align 8, !tbaa !6
  %83 = fadd double %82, %80
  store double %83, double* %81, align 8, !tbaa !6
  %84 = add nuw nsw i64 %68, 2
  %85 = icmp ult i64 %68, 1098
  br i1 %85, label %67, label %64, !llvm.loop !10

86:                                               ; preds = %58
  ret i32 0
}

declare dso_local i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

attributes #0 = { nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

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
!11 = distinct !{!11, !3, !4}
!12 = distinct !{!12, !3, !4}
!13 = distinct !{!13, !3, !4}
!14 = distinct !{!14, !3, !4}
!15 = distinct !{!15, !3, !4}
!16 = distinct !{!16, !3, !4}
