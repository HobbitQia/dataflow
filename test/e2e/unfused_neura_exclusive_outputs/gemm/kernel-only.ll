; ModuleID = '/mnt/public/qjj/dataflow/test/e2e/unfused_neura_exclusive_outputs/gemm/kernel-full.ll'
source_filename = "/mnt/public/qjj/dataflow/test/benchmark/CGRA-Bench/kernels/gemm/gemm_int.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: readwrite) uwtable
define dso_local void @kernel_int(i32 noundef %ni, i32 noundef %nj, i32 noundef %nk, ptr nocapture noundef %C, ptr nocapture noundef readonly %A, ptr nocapture noundef readonly %B) local_unnamed_addr #0 {
entry:
  %cmp36 = icmp sgt i32 %ni, 0
  %cmp234 = icmp sgt i32 %nk, 0
  %or.cond = and i1 %cmp36, %cmp234
  %cmp532 = icmp sgt i32 %nj, 0
  %or.cond57 = and i1 %or.cond, %cmp532
  br i1 %or.cond57, label %for.cond1.preheader.us.us.preheader, label %for.end22

for.cond1.preheader.us.us.preheader:              ; preds = %entry
  %wide.trip.count55 = zext nneg i32 %ni to i64
  %wide.trip.count50 = zext nneg i32 %nk to i64
  %wide.trip.count = zext nneg i32 %nj to i64
  br label %for.cond1.preheader.us.us

for.cond1.preheader.us.us:                        ; preds = %for.cond1.for.inc20_crit_edge.split.us.us.us, %for.cond1.preheader.us.us.preheader
  %indvars.iv52 = phi i64 [ 0, %for.cond1.preheader.us.us.preheader ], [ %indvars.iv.next53, %for.cond1.for.inc20_crit_edge.split.us.us.us ]
  br label %for.cond4.preheader.us.us.us

for.cond4.preheader.us.us.us:                     ; preds = %for.cond4.for.inc17_crit_edge.us.us.us, %for.cond1.preheader.us.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.cond4.for.inc17_crit_edge.us.us.us ], [ 0, %for.cond1.preheader.us.us ]
  %arrayidx8.us.us.us = getelementptr inbounds nuw [1200 x i32], ptr %A, i64 %indvars.iv52, i64 %indvars.iv47
  br label %for.body6.us.us.us

for.body6.us.us.us:                               ; preds = %for.body6.us.us.us, %for.cond4.preheader.us.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body6.us.us.us ], [ 0, %for.cond4.preheader.us.us.us ]
  %0 = load i32, ptr %arrayidx8.us.us.us, align 4, !tbaa !5
  %arrayidx12.us.us.us = getelementptr inbounds nuw [1100 x i32], ptr %B, i64 %indvars.iv47, i64 %indvars.iv
  %1 = load i32, ptr %arrayidx12.us.us.us, align 4, !tbaa !5
  %mul.us.us.us = mul nsw i32 %1, %0
  %arrayidx16.us.us.us = getelementptr inbounds nuw [1100 x i32], ptr %C, i64 %indvars.iv52, i64 %indvars.iv
  %2 = load i32, ptr %arrayidx16.us.us.us, align 4, !tbaa !5
  %add.us.us.us = add nsw i32 %2, %mul.us.us.us
  store i32 %add.us.us.us, ptr %arrayidx16.us.us.us, align 4, !tbaa !5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.cond4.for.inc17_crit_edge.us.us.us, label %for.body6.us.us.us, !llvm.loop !9

for.cond4.for.inc17_crit_edge.us.us.us:           ; preds = %for.body6.us.us.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond51.not = icmp eq i64 %indvars.iv.next48, %wide.trip.count50
  br i1 %exitcond51.not, label %for.cond1.for.inc20_crit_edge.split.us.us.us, label %for.cond4.preheader.us.us.us, !llvm.loop !16

for.cond1.for.inc20_crit_edge.split.us.us.us:     ; preds = %for.cond4.for.inc17_crit_edge.us.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond56.not = icmp eq i64 %indvars.iv.next53, %wide.trip.count55
  br i1 %exitcond56.not, label %for.end22, label %for.cond1.preheader.us.us, !llvm.loop !18

for.end22:                                        ; preds = %for.cond1.for.inc20_crit_edge.split.us.us.us, %entry
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
!9 = distinct !{!9, !10, !11, !12}
!10 = !{!"llvm.loop.mustprogress"}
!11 = !{!"llvm.loop.vectorize.width", i32 1}
!12 = !{!"llvm.loop.vectorize.followup_all", !13}
!13 = distinct !{!13, !10, !14, !15}
!14 = !{!"llvm.loop.isvectorized"}
!15 = !{!"llvm.loop.unroll.count", i32 4}
!16 = distinct !{!16, !10, !17}
!17 = !{!"llvm.loop.unroll.disable"}
!18 = distinct !{!18, !10, !17}
