; ModuleID = 'qsort-2-faultinject.ll'
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

.lr.ph38:                                         ; preds = %.lr.ph38.preheader, %tailrecurse
  %.tr3136 = phi i32 [ %45, %tailrecurse ], [ %1, %.lr.ph38.preheader ]
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
  %14 = tail call i32 @__faultinject_selected_target(i32 %.tr3136) #4
  %15 = icmp slt i32 %14, %2
  br i1 %15, label %.lr.ph.preheader, label %tailrecurse

.lr.ph.preheader:                                 ; preds = %.lr.ph38
  %16 = sext i32 %14 to i64
  %17 = sub nsw i64 %wide.trip.count, %16
  %18 = xor i64 %16, -1
  %xtraiter = and i64 %17, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %indvars.iv.next.prol = add nsw i64 %16, 1
  %19 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.prol
  %20 = load i32, i32* %19, align 4, !tbaa !2
  %21 = load i32, i32* %9, align 4, !tbaa !2
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %.lr.ph.prol.loopexit

; <label>:23:                                     ; preds = %.lr.ph.prol
  %24 = add nsw i32 %.tr3136, 1
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32* %0, i64 %25
  %27 = load i32, i32* %26, align 4, !tbaa !2
  store i32 %20, i32* %26, align 4, !tbaa !2
  store i32 %27, i32* %19, align 4, !tbaa !2
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %23, %.lr.ph.prol
  %.1.lcssa.unr.ph = phi i32 [ undef, %.lr.ph.preheader ], [ %24, %23 ], [ %.tr3136, %.lr.ph.prol ]
  %indvars.iv.unr.ph = phi i64 [ %16, %.lr.ph.preheader ], [ %indvars.iv.next.prol, %23 ], [ %indvars.iv.next.prol, %.lr.ph.prol ]
  %.034.unr.ph = phi i32 [ %.tr3136, %.lr.ph.preheader ], [ %24, %23 ], [ %.tr3136, %.lr.ph.prol ]
  %28 = icmp eq i64 %18, %5
  br i1 %28, label %tailrecurse.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.prol.loopexit, %52
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %52 ], [ %indvars.iv.unr.ph, %.lr.ph.prol.loopexit ]
  %.034 = phi i32 [ %.1.1, %52 ], [ %.034.unr.ph, %.lr.ph.prol.loopexit ]
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next
  %30 = load i32, i32* %29, align 4, !tbaa !2
  %31 = load i32, i32* %9, align 4, !tbaa !2
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %33, label %.lr.ph.141

; <label>:33:                                     ; preds = %.lr.ph
  %34 = add nsw i32 %.034, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32* %0, i64 %35
  %37 = load i32, i32* %36, align 4, !tbaa !2
  store i32 %30, i32* %36, align 4, !tbaa !2
  store i32 %37, i32* %29, align 4, !tbaa !2
  br label %.lr.ph.141

.lr.ph.141:                                       ; preds = %.lr.ph, %33
  %.1 = phi i32 [ %34, %33 ], [ %.034, %.lr.ph ]
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %38 = getelementptr inbounds i32, i32* %0, i64 %indvars.iv.next.1
  %39 = load i32, i32* %38, align 4, !tbaa !2
  %40 = load i32, i32* %9, align 4, !tbaa !2
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %47, label %52

tailrecurse.loopexit:                             ; preds = %52, %.lr.ph.prol.loopexit
  %.1.lcssa = phi i32 [ %.1.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %.1.1, %52 ]
  %.pre = sext i32 %.1.lcssa to i64
  %.pre39 = getelementptr inbounds i32, i32* %0, i64 %.pre
  br label %tailrecurse

tailrecurse:                                      ; preds = %tailrecurse.loopexit, %.lr.ph38
  %.pre-phi40 = phi i32* [ %.pre39, %tailrecurse.loopexit ], [ %9, %.lr.ph38 ]
  %.0.lcssa = phi i32 [ %.1.lcssa, %tailrecurse.loopexit ], [ %.tr3136, %.lr.ph38 ]
  %42 = load i32, i32* %9, align 4, !tbaa !2
  %43 = load i32, i32* %.pre-phi40, align 4, !tbaa !2
  store i32 %43, i32* %9, align 4, !tbaa !2
  store i32 %42, i32* %.pre-phi40, align 4, !tbaa !2
  %44 = add nsw i32 %.0.lcssa, -1
  tail call void @qsort(i32* nonnull %0, i32 %.tr3136, i32 %44)
  %45 = add nsw i32 %.0.lcssa, 1
  %46 = icmp slt i32 %45, %2
  br i1 %46, label %.lr.ph38, label %tailrecurse._crit_edge

tailrecurse._crit_edge:                           ; preds = %tailrecurse, %3
  ret void

; <label>:47:                                     ; preds = %.lr.ph.141
  %48 = add nsw i32 %.1, 1
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds i32, i32* %0, i64 %49
  %51 = load i32, i32* %50, align 4, !tbaa !2
  store i32 %39, i32* %50, align 4, !tbaa !2
  store i32 %51, i32* %38, align 4, !tbaa !2
  br label %52

; <label>:52:                                     ; preds = %47, %.lr.ph.141
  %.1.1 = phi i32 [ %48, %47 ], [ %.1, %.lr.ph.141 ]
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
