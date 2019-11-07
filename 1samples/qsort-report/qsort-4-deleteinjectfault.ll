; ModuleID = 'qsort-3-o2.ll'
source_filename = "qsort.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.arr = private unnamed_addr constant [97 x i32] [i32 7, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @qsort(i32*, i32, i32) local_unnamed_addr #0 {
  %4 = icmp slt i32 %1, %2
  br i1 %4, label %.lr.ph38.preheader, label %tailrecurse._crit_edge

.lr.ph38.preheader:                               ; preds = %3
  %wide.trip.count = sext i32 %2 to i64
  %5 = sub nsw i64 0, %wide.trip.count
  br label %.lr.ph38

.lr.ph38:                                         ; preds = %tailrecurse, %.lr.ph38.preheader
  %.tr3136 = phi i32 [ %44, %tailrecurse ], [ %1, %.lr.ph38.preheader ]
  %6 = add nsw i32 %.tr3136, %2
  %7 = sdiv i32 %6, 2
  %8 = sext i32 %.tr3136 to i64
  %9 = getelementptr inbounds i32, i32* %0, i64 %8
  %10 = load i32, i32* %9, align 4, !tbaa !2
  %11 = sext i32 %7 to i64
  %12 = getelementptr inbounds i32, i32* %0, i64 %11
  %13 = load i32, i32* %12, align 4, !tbaa !2
  store i32 %13, i32* %9, align 4, !tbaa !2
  store i32 %10, i32* %12, align 4, !tbaa !2
  %14 = icmp slt i32 %.tr3136, %2
  br i1 %14, label %.lr.ph.preheader, label %tailrecurse

.lr.ph.preheader:                                 ; preds = %.lr.ph38
  %15 = sext i32 %.tr3136 to i64
  %16 = sub nsw i64 %wide.trip.count, %15
  %17 = xor i64 %15, -1
  %xtraiter = and i64 %16, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %indvars.iv.next.prol = add nsw i64 %15, 1
  %18 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.prol
  %19 = load i32, i32* %18, align 4, !tbaa !2
  %20 = load i32, i32* %9, align 4, !tbaa !2
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %22, label %.lr.ph.prol.loopexit

; <label>:22:                                     ; preds = %.lr.ph.prol
  %23 = add nsw i32 %.tr3136, 1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds i32, i32* %0, i64 %24
  %26 = load i32, i32* %25, align 4, !tbaa !2
  store i32 %19, i32* %25, align 4, !tbaa !2
  store i32 %26, i32* %18, align 4, !tbaa !2
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %22, %.lr.ph.prol, %.lr.ph.preheader
  %.1.lcssa.unr.ph = phi i32 [ undef, %.lr.ph.preheader ], [ %23, %22 ], [ %.tr3136, %.lr.ph.prol ]
  %indvars.iv.unr.ph = phi i64 [ %15, %.lr.ph.preheader ], [ %indvars.iv.next.prol, %22 ], [ %indvars.iv.next.prol, %.lr.ph.prol ]
  %.034.unr.ph = phi i32 [ %.tr3136, %.lr.ph.preheader ], [ %23, %22 ], [ %.tr3136, %.lr.ph.prol ]
  %27 = icmp eq i64 %17, %5
  br i1 %27, label %tailrecurse.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %51, %.lr.ph.prol.loopexit
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %51 ], [ %indvars.iv.unr.ph, %.lr.ph.prol.loopexit ]
  %.034 = phi i32 [ %.1.1, %51 ], [ %.034.unr.ph, %.lr.ph.prol.loopexit ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next
  %29 = load i32, i32* %28, align 4, !tbaa !2
  %30 = load i32, i32* %9, align 4, !tbaa !2
  %31 = icmp slt i32 %29, %30
  br i1 %31, label %32, label %.lr.ph.141

; <label>:32:                                     ; preds = %.lr.ph
  %33 = add nsw i32 %.034, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32* %0, i64 %34
  %36 = load i32, i32* %35, align 4, !tbaa !2
  store i32 %29, i32* %35, align 4, !tbaa !2
  store i32 %36, i32* %28, align 4, !tbaa !2
  br label %.lr.ph.141

.lr.ph.141:                                       ; preds = %32, %.lr.ph
  %.1 = phi i32 [ %33, %32 ], [ %.034, %.lr.ph ]
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %37 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.1
  %38 = load i32, i32* %37, align 4, !tbaa !2
  %39 = load i32, i32* %9, align 4, !tbaa !2
  %40 = icmp slt i32 %38, %39
  br i1 %40, label %46, label %51

tailrecurse.loopexit:                             ; preds = %51, %.lr.ph.prol.loopexit
  %.1.lcssa = phi i32 [ %.1.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %.1.1, %51 ]
  %.pre = sext i32 %.1.lcssa to i64
  %.pre39 = getelementptr inbounds i32, i32* %0, i64 %.pre
  br label %tailrecurse

tailrecurse:                                      ; preds = %tailrecurse.loopexit, %.lr.ph38
  %.pre-phi40 = phi i32* [ %.pre39, %tailrecurse.loopexit ], [ %9, %.lr.ph38 ]
  %.0.lcssa = phi i32 [ %.1.lcssa, %tailrecurse.loopexit ], [ %.tr3136, %.lr.ph38 ]
  %41 = load i32, i32* %9, align 4, !tbaa !2
  %42 = load i32, i32* %.pre-phi40, align 4, !tbaa !2
  store i32 %42, i32* %9, align 4, !tbaa !2
  store i32 %41, i32* %.pre-phi40, align 4, !tbaa !2
  %43 = add nsw i32 %.0.lcssa, -1
  tail call void @qsort(i32* nonnull %0, i32 %.tr3136, i32 %43)
  %44 = add nsw i32 %.0.lcssa, 1
  %45 = icmp slt i32 %44, %2
  br i1 %45, label %.lr.ph38, label %tailrecurse._crit_edge

tailrecurse._crit_edge:                           ; preds = %tailrecurse, %3
  ret void

; <label>:46:                                     ; preds = %.lr.ph.141
  %47 = add nsw i32 %.1, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32* %0, i64 %48
  %50 = load i32, i32* %49, align 4, !tbaa !2
  store i32 %38, i32* %49, align 4, !tbaa !2
  store i32 %50, i32* %37, align 4, !tbaa !2
  br label %51

; <label>:51:                                     ; preds = %46, %.lr.ph.141
  %.1.1 = phi i32 [ %47, %46 ], [ %.1, %.lr.ph.141 ]
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %tailrecurse.loopexit, label %.lr.ph
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

; Function Attrs: norecurse nounwind uwtable
define dso_local void @swap(i32* nocapture, i32, i32) local_unnamed_addr #2 {
  %4 = sext i32 %1 to i64
  %5 = getelementptr inbounds i32, i32* %0, i64 %4
  %6 = load i32, i32* %5, align 4, !tbaa !2
  %7 = sext i32 %2 to i64
  %8 = getelementptr inbounds i32, i32* %0, i64 %7
  %9 = load i32, i32* %8, align 4, !tbaa !2
  store i32 %9, i32* %5, align 4, !tbaa !2
  store i32 %6, i32* %8, align 4, !tbaa !2
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() local_unnamed_addr #0 {
  %1 = alloca [97 x i32], align 16
  %2 = bitcast [97 x i32]* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 388, i8* nonnull %2) #4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull align 16 %2, i8* align 16 bitcast ([97 x i32]* @main.arr to i8*), i64 388, i1 false)
  %3 = getelementptr inbounds [97 x i32], [97 x i32]* %1, i64 0, i64 0
  call void @qsort(i32* nonnull %3, i32 0, i32 96)
  br label %5

; <label>:4:                                      ; preds = %5
  call void @llvm.lifetime.end.p0i8(i64 388, i8* nonnull %2) #4
  ret i32 0

; <label>:5:                                      ; preds = %5, %0
  %indvars.iv = phi i64 [ 0, %0 ], [ %indvars.iv.next, %5 ]
  %6 = getelementptr inbounds [97 x i32], [97 x i32]* %1, i64 0, i64 %indvars.iv
  %7 = load i32, i32* %6, align 4, !tbaa !2
  %8 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i64 0, i64 0), i32 %7)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 97
  br i1 %exitcond, label %4, label %5
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #1

; Function Attrs: nounwind
declare dso_local i32 @printf(i8* nocapture readonly, ...) local_unnamed_addr #3

declare i32 @__faultinject_selected_target(i32) local_unnamed_addr

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0-3 (tags/RELEASE_700/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
