; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/unfused_neura_exclusive_outputs/fft/kernel-full.ll'
source_filename = "/mnt/public/qjj/dataflow/test/benchmark/CGRA-Bench/kernels/fft/fft_int.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @kernel(ptr nocapture noundef %data_real, ptr nocapture noundef %data_imag, ptr nocapture noundef readonly %coef_real, ptr nocapture noundef readonly %coef_imag) local_unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end76, %entry
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

for.body3.us:                                     ; preds = %for.cond7.for.inc74_crit_edge.us, %for.body3.us.preheader
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

for.body9.us:                                     ; preds = %for.body9.us, %for.body3.us
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
  br i1 %exitcond.not, label %for.cond7.for.inc74_crit_edge.us, label %for.body9.us, !llvm.loop !9

for.cond7.for.inc74_crit_edge.us:                 ; preds = %for.body9.us
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %exitcond158.not = icmp eq i64 %indvars.iv.next151, %wide.trip.count157
  br i1 %exitcond158.not, label %for.end76, label %for.body3.us, !llvm.loop !12

for.end76:                                        ; preds = %for.cond7.for.inc74_crit_edge.us, %for.cond1.preheader
  %mul77 = shl nsw i32 %groupsPerStage.0143, 1
  %div = sdiv i32 %buttersPerGroup.0144, 2
  %shl = shl i32 %coef_base.0145, 1
  %add78 = or disjoint i32 %shl, 1
  %inc80 = add nuw nsw i32 %i.0142, 1
  %exitcond159.not = icmp eq i32 %inc80, 8
  br i1 %exitcond159.not, label %for.end81, label %for.cond1.preheader, !llvm.loop !13

for.end81:                                        ; preds = %for.end76
  ret void
}

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
