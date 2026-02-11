; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/gemm/kernel_uf4.c'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/gemm/kernel_uf4.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32 %0, i32 %1, i32 %2, [1100 x double]* nocapture %3, [1200 x double]* nocapture readonly %4, [1100 x double]* nocapture readonly %5) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %8, label %61

8:                                                ; preds = %6
  %9 = icmp slt i32 %2, 1
  %10 = icmp slt i32 %1, 1
  %11 = sext i32 %1 to i64
  %12 = zext i32 %0 to i64
  %13 = zext i32 %2 to i64
  br label %14

14:                                               ; preds = %8, %58
  %15 = phi i64 [ 0, %8 ], [ %59, %58 ]
  %16 = or i1 %9, %10
  br i1 %16, label %58, label %17

17:                                               ; preds = %14, %55
  %18 = phi i64 [ %56, %55 ], [ 0, %14 ]
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %15, i64 %18
  br label %20

20:                                               ; preds = %17, %20
  %21 = phi i64 [ 0, %17 ], [ %53, %20 ]
  %22 = load double, double* %19, align 8, !tbaa !2
  %23 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %18, i64 %21
  %24 = load double, double* %23, align 8, !tbaa !2
  %25 = fmul double %22, %24
  %26 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %15, i64 %21
  %27 = load double, double* %26, align 8, !tbaa !2
  %28 = fadd double %27, %25
  store double %28, double* %26, align 8, !tbaa !2
  %29 = load double, double* %19, align 8, !tbaa !2
  %30 = or i64 %21, 1
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %18, i64 %30
  %32 = load double, double* %31, align 8, !tbaa !2
  %33 = fmul double %29, %32
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %15, i64 %30
  %35 = load double, double* %34, align 8, !tbaa !2
  %36 = fadd double %35, %33
  store double %36, double* %34, align 8, !tbaa !2
  %37 = load double, double* %19, align 8, !tbaa !2
  %38 = or i64 %21, 2
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %18, i64 %38
  %40 = load double, double* %39, align 8, !tbaa !2
  %41 = fmul double %37, %40
  %42 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %15, i64 %38
  %43 = load double, double* %42, align 8, !tbaa !2
  %44 = fadd double %43, %41
  store double %44, double* %42, align 8, !tbaa !2
  %45 = load double, double* %19, align 8, !tbaa !2
  %46 = or i64 %21, 3
  %47 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %18, i64 %46
  %48 = load double, double* %47, align 8, !tbaa !2
  %49 = fmul double %45, %48
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %15, i64 %46
  %51 = load double, double* %50, align 8, !tbaa !2
  %52 = fadd double %51, %49
  store double %52, double* %50, align 8, !tbaa !2
  %53 = add nuw nsw i64 %21, 4
  %54 = icmp slt i64 %53, %11
  br i1 %54, label %20, label %55, !llvm.loop !6

55:                                               ; preds = %20
  %56 = add nuw nsw i64 %18, 1
  %57 = icmp eq i64 %56, %13
  br i1 %57, label %58, label %17, !llvm.loop !9

58:                                               ; preds = %55, %14
  %59 = add nuw nsw i64 %15, 1
  %60 = icmp eq i64 %59, %12
  br i1 %60, label %61, label %14, !llvm.loop !10

61:                                               ; preds = %58, %6
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
  store double %16, double* %17, align 8, !tbaa !2
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
  store double %34, double* %35, align 8, !tbaa !2
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
  store double %49, double* %50, align 8, !tbaa !2
  %51 = add nuw nsw i64 %43, 1
  %52 = icmp eq i64 %51, 1100
  br i1 %52, label %53, label %42, !llvm.loop !15

53:                                               ; preds = %42
  %54 = add nuw nsw i64 %41, 1
  %55 = icmp eq i64 %54, 1200
  br i1 %55, label %56, label %40, !llvm.loop !16

56:                                               ; preds = %53, %99
  %57 = phi i64 [ %100, %99 ], [ 0, %53 ]
  br label %58

58:                                               ; preds = %96, %56
  %59 = phi i64 [ %97, %96 ], [ 0, %56 ]
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %57, i64 %59
  br label %61

61:                                               ; preds = %61, %58
  %62 = phi i64 [ 0, %58 ], [ %94, %61 ]
  %63 = load double, double* %60, align 8, !tbaa !2
  %64 = getelementptr inbounds [1100 x double], [1100 x double]* %24, i64 %59, i64 %62
  %65 = load double, double* %64, align 8, !tbaa !2
  %66 = fmul double %63, %65
  %67 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %57, i64 %62
  %68 = load double, double* %67, align 8, !tbaa !2
  %69 = fadd double %68, %66
  store double %69, double* %67, align 8, !tbaa !2
  %70 = load double, double* %60, align 8, !tbaa !2
  %71 = or i64 %62, 1
  %72 = getelementptr inbounds [1100 x double], [1100 x double]* %24, i64 %59, i64 %71
  %73 = load double, double* %72, align 8, !tbaa !2
  %74 = fmul double %70, %73
  %75 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %57, i64 %71
  %76 = load double, double* %75, align 8, !tbaa !2
  %77 = fadd double %76, %74
  store double %77, double* %75, align 8, !tbaa !2
  %78 = load double, double* %60, align 8, !tbaa !2
  %79 = or i64 %62, 2
  %80 = getelementptr inbounds [1100 x double], [1100 x double]* %24, i64 %59, i64 %79
  %81 = load double, double* %80, align 8, !tbaa !2
  %82 = fmul double %78, %81
  %83 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %57, i64 %79
  %84 = load double, double* %83, align 8, !tbaa !2
  %85 = fadd double %84, %82
  store double %85, double* %83, align 8, !tbaa !2
  %86 = load double, double* %60, align 8, !tbaa !2
  %87 = or i64 %62, 3
  %88 = getelementptr inbounds [1100 x double], [1100 x double]* %24, i64 %59, i64 %87
  %89 = load double, double* %88, align 8, !tbaa !2
  %90 = fmul double %86, %89
  %91 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %57, i64 %87
  %92 = load double, double* %91, align 8, !tbaa !2
  %93 = fadd double %92, %90
  store double %93, double* %91, align 8, !tbaa !2
  %94 = add nuw nsw i64 %62, 4
  %95 = icmp ult i64 %62, 1096
  br i1 %95, label %61, label %96, !llvm.loop !6

96:                                               ; preds = %61
  %97 = add nuw nsw i64 %59, 1
  %98 = icmp eq i64 %97, 1200
  br i1 %98, label %99, label %58, !llvm.loop !9

99:                                               ; preds = %96
  %100 = add nuw nsw i64 %57, 1
  %101 = icmp eq i64 %100, 1000
  br i1 %101, label %102, label %56, !llvm.loop !10

102:                                              ; preds = %99
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
!13 = distinct !{!13, !7, !8}
!14 = distinct !{!14, !7, !8}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
