; ModuleID = 'test-float-3-o2.ll'
source_filename = "test-float.c"
target datalayout = "e-m:w-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc19.14.26431"

@0 = internal global i32 8388608

; Function Attrs: nounwind uwtable
define dso_local float @test(float) local_unnamed_addr #0 {
  br label %3

; <label>:2:                                      ; preds = %3
  ret float %.1

; <label>:3:                                      ; preds = %3, %1
  %.08 = phi i32 [ 0, %1 ], [ %10, %3 ]
  %.067 = phi float [ %0, %1 ], [ %.1, %3 ]
  %4 = fadd float %.067, 1.000000e+01
  %xor_val = load i32, i32* @0
  call void @faultinjectmarked(i32 %xor_val)
  %5 = bitcast float %4 to i32
  %6 = xor i32 %5, %xor_val
  %7 = bitcast i32 %6 to float
  call void @faultinjectmarked_floatingpoint(float %7)
  store i32 0, i32* @0
  %8 = fcmp ogt float %7, 1.000000e+02
  %9 = fdiv float %4, 1.000000e+01
  %.1 = select i1 %8, float %9, float %4
  %10 = add nuw nsw i32 %.08, 1
  %exitcond = icmp eq i32 %10, 1000
  br i1 %exitcond, label %2, label %3
}

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local float @cast(float) local_unnamed_addr #1 {
  %2 = bitcast float %0 to i32
  %3 = xor i32 %2, 1
  %4 = bitcast i32 %3 to float
  ret float %4
}

; Function Attrs: norecurse nounwind readnone uwtable
define dso_local i32 @main() local_unnamed_addr #1 {
  ret i32 0
}

declare float @__faultinject_selected_target(float) local_unnamed_addr

declare void @faultinjectmarked(i32)

declare void @faultinjectmarked_floatingpoint(float)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 2}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"clang version 7.0.1 (tags/RELEASE_701/final)"}
