; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/fft/kernel_uf2.c'
source_filename = "/mnt/public/qjj/dataflow/test/e2e/fft/kernel_uf2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@data_real = dso_local global [256 x i32] zeroinitializer, align 16
@data_imag = dso_local global [256 x i32] zeroinitializer, align 16
@coef_real = dso_local global [256 x i32] zeroinitializer, align 16
@coef_imag = dso_local global [256 x i32] zeroinitializer, align 16

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  br label %1

1:                                                ; preds = %0, %1
  %2 = phi i64 [ 0, %0 ], [ %8, %1 ]
  %3 = getelementptr inbounds [256 x i32], [256 x i32]* @data_real, i64 0, i64 %2
  %4 = trunc i64 %2 to i32
  store i32 %4, i32* %3, align 4, !tbaa !2
  %5 = getelementptr inbounds [256 x i32], [256 x i32]* @data_imag, i64 0, i64 %2
  store i32 1, i32* %5, align 4, !tbaa !2
  %6 = getelementptr inbounds [256 x i32], [256 x i32]* @coef_real, i64 0, i64 %2
  store i32 2, i32* %6, align 4, !tbaa !2
  %7 = getelementptr inbounds [256 x i32], [256 x i32]* @coef_imag, i64 0, i64 %2
  store i32 2, i32* %7, align 4, !tbaa !2
  %8 = add nuw nsw i64 %2, 1
  %9 = icmp eq i64 %8, 256
  br i1 %9, label %10, label %1, !llvm.loop !6

10:                                               ; preds = %1
  tail call void @kernel(i32* getelementptr inbounds ([256 x i32], [256 x i32]* @data_real, i64 0, i64 0), i32* getelementptr inbounds ([256 x i32], [256 x i32]* @data_imag, i64 0, i64 0), i32* getelementptr inbounds ([256 x i32], [256 x i32]* @coef_real, i64 0, i64 0), i32* getelementptr inbounds ([256 x i32], [256 x i32]* @coef_imag, i64 0, i64 0))
  ret i32 0
}

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @kernel(i32* nocapture %0, i32* nocapture %1, i32* nocapture readonly %2, i32* nocapture readonly %3) local_unnamed_addr #0 {
  br label %5

5:                                                ; preds = %4, %80
  %6 = phi i32 [ 0, %4 ], [ %85, %80 ]
  %7 = phi i32 [ 0, %4 ], [ %84, %80 ]
  %8 = phi i32 [ 128, %4 ], [ %82, %80 ]
  %9 = phi i32 [ 1, %4 ], [ %81, %80 ]
  %10 = icmp ne i32 %9, 0
  %11 = icmp sgt i32 %8, 0
  %12 = and i1 %10, %11
  br i1 %12, label %13, label %80

13:                                               ; preds = %5
  %14 = zext i32 %8 to i64
  %15 = sext i32 %7 to i64
  %16 = zext i32 %9 to i64
  br label %17

17:                                               ; preds = %13, %77
  %18 = phi i64 [ 0, %13 ], [ %78, %77 ]
  %19 = add nsw i64 %18, %15
  %20 = getelementptr inbounds i32, i32* %2, i64 %19
  %21 = load i32, i32* %20, align 4, !tbaa !2
  %22 = getelementptr inbounds i32, i32* %3, i64 %19
  %23 = load i32, i32* %22, align 4, !tbaa !2
  %24 = shl nuw nsw i64 %18, 1
  %25 = mul nsw i64 %24, %14
  br label %26

26:                                               ; preds = %17, %26
  %27 = phi i64 [ 0, %17 ], [ %75, %26 ]
  %28 = add nuw nsw i64 %27, %25
  %29 = trunc i64 %28 to i32
  %30 = add i32 %8, %29
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32* %0, i64 %31
  %33 = load i32, i32* %32, align 4, !tbaa !2
  %34 = mul nsw i32 %33, %21
  %35 = getelementptr inbounds i32, i32* %1, i64 %31
  %36 = load i32, i32* %35, align 4, !tbaa !2
  %37 = mul nsw i32 %36, %23
  %38 = sub nsw i32 %34, %37
  %39 = mul nsw i32 %33, %23
  %40 = mul nsw i32 %36, %21
  %41 = add nsw i32 %40, %39
  %42 = getelementptr inbounds i32, i32* %0, i64 %28
  %43 = load i32, i32* %42, align 4, !tbaa !2
  %44 = sub nsw i32 %43, %38
  store i32 %44, i32* %32, align 4, !tbaa !2
  %45 = load i32, i32* %42, align 4, !tbaa !2
  %46 = add nsw i32 %45, %38
  store i32 %46, i32* %42, align 4, !tbaa !2
  %47 = getelementptr inbounds i32, i32* %1, i64 %28
  %48 = load i32, i32* %47, align 4, !tbaa !2
  %49 = sub nsw i32 %48, %41
  store i32 %49, i32* %35, align 4, !tbaa !2
  %50 = load i32, i32* %47, align 4, !tbaa !2
  %51 = add nsw i32 %50, %41
  store i32 %51, i32* %47, align 4, !tbaa !2
  %52 = add nsw i32 %30, 1
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i32, i32* %0, i64 %53
  %55 = load i32, i32* %54, align 4, !tbaa !2
  %56 = mul nsw i32 %55, %21
  %57 = getelementptr inbounds i32, i32* %1, i64 %53
  %58 = load i32, i32* %57, align 4, !tbaa !2
  %59 = mul nsw i32 %58, %23
  %60 = sub nsw i32 %56, %59
  %61 = mul nsw i32 %55, %23
  %62 = mul nsw i32 %58, %21
  %63 = add nsw i32 %62, %61
  %64 = or i64 %28, 1
  %65 = getelementptr inbounds i32, i32* %0, i64 %64
  %66 = load i32, i32* %65, align 4, !tbaa !2
  %67 = sub nsw i32 %66, %60
  store i32 %67, i32* %54, align 4, !tbaa !2
  %68 = load i32, i32* %65, align 4, !tbaa !2
  %69 = add nsw i32 %68, %60
  store i32 %69, i32* %65, align 4, !tbaa !2
  %70 = getelementptr inbounds i32, i32* %1, i64 %64
  %71 = load i32, i32* %70, align 4, !tbaa !2
  %72 = sub nsw i32 %71, %63
  store i32 %72, i32* %57, align 4, !tbaa !2
  %73 = load i32, i32* %70, align 4, !tbaa !2
  %74 = add nsw i32 %73, %63
  store i32 %74, i32* %70, align 4, !tbaa !2
  %75 = add nuw nsw i64 %27, 2
  %76 = icmp ult i64 %75, %14
  br i1 %76, label %26, label %77, !llvm.loop !9

77:                                               ; preds = %26
  %78 = add nuw nsw i64 %18, 1
  %79 = icmp eq i64 %78, %16
  br i1 %79, label %80, label %17, !llvm.loop !10

80:                                               ; preds = %77, %5
  %81 = shl nsw i32 %9, 1
  %82 = sdiv i32 %8, 2
  %83 = shl i32 %7, 1
  %84 = or i32 %83, 1
  %85 = add nuw nsw i32 %6, 1
  %86 = icmp eq i32 %85, 8
  br i1 %86, label %87, label %5, !llvm.loop !11

87:                                               ; preds = %80
  ret void
}

attributes #0 = { nofree norecurse nounwind uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }

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
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !7, !8}
!11 = distinct !{!11, !7, !8}
