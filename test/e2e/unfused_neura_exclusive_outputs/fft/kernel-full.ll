; ModuleID = '/mnt/public/qjj/dataflow/test/benchmark/CGRA-Bench/kernels/fft/fft_int.c'
source_filename = "/mnt/public/qjj/dataflow/test/benchmark/CGRA-Bench/kernels/fft/fft_int.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@data_real = dso_local local_unnamed_addr global [256 x i32] zeroinitializer, align 16
@data_imag = dso_local local_unnamed_addr global [256 x i32] zeroinitializer, align 16
@coef_real = dso_local local_unnamed_addr global [256 x i32] zeroinitializer, align 16
@coef_imag = dso_local local_unnamed_addr global [256 x i32] zeroinitializer, align 16

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none) uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.body ]
  %arrayidx = getelementptr inbounds nuw [256 x i32], ptr @data_real, i64 0, i64 %indvars.iv
  %0 = trunc nuw nsw i64 %indvars.iv to i32
  store i32 %0, ptr %arrayidx, align 4, !tbaa !5
  %arrayidx2 = getelementptr inbounds nuw [256 x i32], ptr @data_imag, i64 0, i64 %indvars.iv
  store i32 1, ptr %arrayidx2, align 4, !tbaa !5
  %arrayidx4 = getelementptr inbounds nuw [256 x i32], ptr @coef_real, i64 0, i64 %indvars.iv
  store i32 2, ptr %arrayidx4, align 4, !tbaa !5
  %arrayidx6 = getelementptr inbounds nuw [256 x i32], ptr @coef_imag, i64 0, i64 %indvars.iv
  store i32 2, ptr %arrayidx6, align 4, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, 256
  br i1 %exitcond.not, label %for.cond1.preheader.i, label %for.body, !llvm.loop !9

for.cond1.preheader.i:                            ; preds = %for.body, %for.end76.i
  %coef_base.0145.i = phi i32 [ %add78.i, %for.end76.i ], [ 0, %for.body ]
  %buttersPerGroup.0144.i = phi i32 [ %div.i, %for.end76.i ], [ 128, %for.body ]
  %groupsPerStage.0143.i = phi i32 [ %mul77.i, %for.end76.i ], [ 1, %for.body ]
  %i.0142.i = phi i32 [ %inc80.i, %for.end76.i ], [ 0, %for.body ]
  %cmp8139.i = icmp sgt i32 %buttersPerGroup.0144.i, 0
  br i1 %cmp8139.i, label %for.body3.us.preheader.i, label %for.end76.i

for.body3.us.preheader.i:                         ; preds = %for.cond1.preheader.i
  %1 = sext i32 %coef_base.0145.i to i64
  %2 = zext nneg i32 %buttersPerGroup.0144.i to i64
  %wide.trip.count157.i = zext i32 %groupsPerStage.0143.i to i64
  br label %for.body3.us.i

for.body3.us.i:                                   ; preds = %for.cond7.for.inc74_crit_edge.us.i, %for.body3.us.preheader.i
  %indvars.iv150.i = phi i64 [ 0, %for.body3.us.preheader.i ], [ %indvars.iv.next151.i, %for.cond7.for.inc74_crit_edge.us.i ]
  %3 = add nsw i64 %indvars.iv150.i, %1
  %arrayidx.us.i = getelementptr inbounds i32, ptr @coef_real, i64 %3
  %4 = load i32, ptr %arrayidx.us.i, align 4, !tbaa !5
  %arrayidx6.us.i = getelementptr inbounds i32, ptr @coef_imag, i64 %3
  %5 = load i32, ptr %arrayidx6.us.i, align 4, !tbaa !5
  %6 = shl nuw nsw i64 %indvars.iv150.i, 1
  %7 = mul nuw nsw i64 %6, %2
  %8 = trunc i64 %7 to i32
  %9 = add i32 %buttersPerGroup.0144.i, %8
  %10 = zext i32 %9 to i64
  %11 = and i64 %7, 4294967294
  br label %for.body9.us.i

for.body9.us.i:                                   ; preds = %for.body9.us.i, %for.body3.us.i
  %indvars.iv.i = phi i64 [ 0, %for.body3.us.i ], [ %indvars.iv.next.i, %for.body9.us.i ]
  %12 = add nuw nsw i64 %indvars.iv.i, %10
  %arrayidx14.us.i = getelementptr inbounds nuw i32, ptr @data_real, i64 %12
  %13 = load i32, ptr %arrayidx14.us.i, align 4, !tbaa !5
  %mul15.us.i = mul nsw i32 %13, %4
  %arrayidx21.us.i = getelementptr inbounds nuw i32, ptr @data_imag, i64 %12
  %14 = load i32, ptr %arrayidx21.us.i, align 4, !tbaa !5
  %mul22.us.i = mul nsw i32 %14, %5
  %sub.us.i = sub nsw i32 %mul15.us.i, %mul22.us.i
  %mul29.us.i = mul nsw i32 %13, %5
  %mul36.us.i = mul nsw i32 %14, %4
  %add37.us.i = add nsw i32 %mul36.us.i, %mul29.us.i
  %15 = add nuw nsw i64 %indvars.iv.i, %11
  %arrayidx42.us.i = getelementptr inbounds nuw i32, ptr @data_real, i64 %15
  %16 = load i32, ptr %arrayidx42.us.i, align 4, !tbaa !5
  %sub43.us.i = sub nsw i32 %16, %sub.us.i
  store i32 %sub43.us.i, ptr %arrayidx14.us.i, align 4, !tbaa !5
  %add55.us.i = add nsw i32 %sub.us.i, %16
  store i32 %add55.us.i, ptr %arrayidx42.us.i, align 4, !tbaa !5
  %arrayidx60.us.i = getelementptr inbounds nuw i32, ptr @data_imag, i64 %15
  %17 = load i32, ptr %arrayidx60.us.i, align 4, !tbaa !5
  %sub61.us.i = sub nsw i32 %17, %add37.us.i
  store i32 %sub61.us.i, ptr %arrayidx21.us.i, align 4, !tbaa !5
  %add73.us.i = add nsw i32 %17, %add37.us.i
  store i32 %add73.us.i, ptr %arrayidx60.us.i, align 4, !tbaa !5
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next.i, %2
  br i1 %exitcond.not.i, label %for.cond7.for.inc74_crit_edge.us.i, label %for.body9.us.i, !llvm.loop !12

for.cond7.for.inc74_crit_edge.us.i:               ; preds = %for.body9.us.i
  %indvars.iv.next151.i = add nuw nsw i64 %indvars.iv150.i, 1
  %exitcond158.not.i = icmp eq i64 %indvars.iv.next151.i, %wide.trip.count157.i
  br i1 %exitcond158.not.i, label %for.end76.i, label %for.body3.us.i, !llvm.loop !13

for.end76.i:                                      ; preds = %for.cond7.for.inc74_crit_edge.us.i, %for.cond1.preheader.i
  %mul77.i = shl nsw i32 %groupsPerStage.0143.i, 1
  %div.i = sdiv i32 %buttersPerGroup.0144.i, 2
  %shl.i = shl i32 %coef_base.0145.i, 1
  %add78.i = or disjoint i32 %shl.i, 1
  %inc80.i = add nuw nsw i32 %i.0142.i, 1
  %exitcond159.not.i = icmp eq i32 %inc80.i, 8
  br i1 %exitcond159.not.i, label %kernel.exit, label %for.cond1.preheader.i, !llvm.loop !14

kernel.exit:                                      ; preds = %for.end76.i
  ret i32 0
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @kernel(ptr nocapture noundef %data_real, ptr nocapture noundef %data_imag, ptr nocapture noundef readonly %coef_real, ptr nocapture noundef readonly %coef_imag) local_unnamed_addr #1 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.end76
  %coef_base.0145 = phi i32 [ 0, %entry ], [ %add78, %for.end76 ]
  %buttersPerGroup.0144 = phi i32 [ 128, %entry ], [ %div, %for.end76 ]
  %groupsPerStage.0143 = phi i32 [ 1, %entry ], [ %mul77, %for.end76 ]
  %i.0142 = phi i32 [ 0, %entry ], [ %inc80, %for.end76 ]
  %cmp8139 = icmp sgt i32 %buttersPerGroup.0144, 0
  br i1 %cmp8139, label %for.body3.us.preheader, label %for.end76

for.body3.us.preheader:                           ; preds = %for.cond1.preheader
  %0 = sext i32 %coef_base.0145 to i64
  %1 = zext nneg i32 %buttersPerGroup.0144 to i64
  %wide.trip.count157 = zext i32 %groupsPerStage.0143 to i64
  %wide.trip.count = zext nneg i32 %buttersPerGroup.0144 to i64
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond7.for.inc74_crit_edge.us
  %indvars.iv150 = phi i64 [ 0, %for.body3.us.preheader ], [ %indvars.iv.next151, %for.cond7.for.inc74_crit_edge.us ]
  %2 = add nsw i64 %indvars.iv150, %0
  %arrayidx.us = getelementptr inbounds i32, ptr %coef_real, i64 %2
  %3 = load i32, ptr %arrayidx.us, align 4, !tbaa !5
  %arrayidx6.us = getelementptr inbounds i32, ptr %coef_imag, i64 %2
  %4 = load i32, ptr %arrayidx6.us, align 4, !tbaa !5
  %5 = shl nuw nsw i64 %indvars.iv150, 1
  %6 = mul i64 %5, %1
  %7 = trunc i64 %6 to i32
  %8 = add i32 %buttersPerGroup.0144, %7
  %9 = zext i32 %8 to i64
  %10 = and i64 %6, 4294967294
  br label %for.body9.us

for.body9.us:                                     ; preds = %for.body3.us, %for.body9.us
  %indvars.iv = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next, %for.body9.us ]
  %11 = add nuw nsw i64 %indvars.iv, %9
  %arrayidx14.us = getelementptr inbounds nuw i32, ptr %data_real, i64 %11
  %12 = load i32, ptr %arrayidx14.us, align 4, !tbaa !5
  %mul15.us = mul nsw i32 %12, %3
  %arrayidx21.us = getelementptr inbounds nuw i32, ptr %data_imag, i64 %11
  %13 = load i32, ptr %arrayidx21.us, align 4, !tbaa !5
  %mul22.us = mul nsw i32 %13, %4
  %sub.us = sub nsw i32 %mul15.us, %mul22.us
  %mul29.us = mul nsw i32 %12, %4
  %mul36.us = mul nsw i32 %13, %3
  %add37.us = add nsw i32 %mul36.us, %mul29.us
  %14 = add nuw nsw i64 %indvars.iv, %10
  %arrayidx42.us = getelementptr inbounds nuw i32, ptr %data_real, i64 %14
  %15 = load i32, ptr %arrayidx42.us, align 4, !tbaa !5
  %sub43.us = sub nsw i32 %15, %sub.us
  store i32 %sub43.us, ptr %arrayidx14.us, align 4, !tbaa !5
  %add55.us = add nsw i32 %15, %sub.us
  store i32 %add55.us, ptr %arrayidx42.us, align 4, !tbaa !5
  %arrayidx60.us = getelementptr inbounds nuw i32, ptr %data_imag, i64 %14
  %16 = load i32, ptr %arrayidx60.us, align 4, !tbaa !5
  %sub61.us = sub nsw i32 %16, %add37.us
  store i32 %sub61.us, ptr %arrayidx21.us, align 4, !tbaa !5
  %add73.us = add nsw i32 %16, %add37.us
  store i32 %add73.us, ptr %arrayidx60.us, align 4, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond7.for.inc74_crit_edge.us, label %for.body9.us, !llvm.loop !12

for.cond7.for.inc74_crit_edge.us:                 ; preds = %for.body9.us
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %exitcond158.not = icmp eq i64 %indvars.iv.next151, %wide.trip.count157
  br i1 %exitcond158.not, label %for.end76, label %for.body3.us, !llvm.loop !13

for.end76:                                        ; preds = %for.cond7.for.inc74_crit_edge.us, %for.cond1.preheader
  %mul77 = shl nsw i32 %groupsPerStage.0143, 1
  %div = sdiv i32 %buttersPerGroup.0144, 2
  %shl = shl i32 %coef_base.0145, 1
  %add78 = or disjoint i32 %shl, 1
  %inc80 = add nuw nsw i32 %i.0142, 1
  %exitcond159.not = icmp eq i32 %inc80, 8
  br i1 %exitcond159.not, label %for.end81, label %for.cond1.preheader, !llvm.loop !14

for.end81:                                        ; preds = %for.end76
  ret void
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 20.1.7 (https://github.com/llvm/llvm-project.git 6146a88f60492b520a36f8f8f3231e15f3cc6082)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !10, !11}
!13 = distinct !{!13, !10, !11}
!14 = distinct !{!14, !10, !11}
