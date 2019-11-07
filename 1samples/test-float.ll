; ModuleID = 'test-float.c'
source_filename = "test-float.c"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.14.26431"

; Function Attrs: nounwind uwtable
define dso_local float @test(float) local_unnamed_addr #0 {
  %2 = alloca float, align 4
  store float %0, float* %2, align 4, !tbaa !3
  br label %4

; <label>:3:                                      ; preds = %4
  ret float %10

; <label>:4:                                      ; preds = %4, %1
  %5 = phi i32 [ 0, %1 ], [ %11, %4 ]
  call void @__marking_faultinject_float(float* nonnull %2) #3
  %6 = load float, float* %2, align 4, !tbaa !3
  %7 = fadd float %6, 1.000000e+01
  %8 = fcmp ogt float %7, 1.000000e+02
  %9 = fdiv float %7, 1.000000e+01
  %10 = select i1 %8, float %9, float %7
  store float %10, float* %2, align 4, !tbaa !3
  %11 = add nuw nsw i32 %5, 1
  %12 = icmp eq i32 %11, 1000
  br i1 %12, label %3, label %4
}

declare dso_local void @__marking_faultinject_float(float*) local_unnamed_addr #1

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local float @cast(float) local_unnamed_addr #2 {
  %2 = bitcast float %0 to i32
  %3 = xor i32 %2, 1
  %4 = bitcast i32 %3 to float
  ret float %4
}

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @main() local_unnamed_addr #2 {
  ret i32 0
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 7.0.1 (tags/RELEASE_701/final)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
