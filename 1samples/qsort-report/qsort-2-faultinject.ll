; ModuleID = 'qsort-1-clang.ll'
source_filename = "qsort.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.arr = private unnamed_addr constant [97 x i32] [i32 7, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0, i32 8, i32 0, i32 5, i32 4, i32 1, i32 2, i32 4, i32 3, i32 10, i32 99, i32 55, i32 10, i32 0, i32 1, i32 9, i32 8, i32 7, i32 6, i32 5, i32 4, i32 3, i32 2, i32 1, i32 0], align 16
@.str = private unnamed_addr constant [4 x i8] c"%d \00", align 1

; Function Attrs: nounwind uwtable
define dso_local void @qsort(i32*, i32, i32) #0 {
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store i32* %0, i32** %4, align 8, !tbaa !2
  store i32 %1, i32* %5, align 4, !tbaa !6
  store i32 %2, i32* %6, align 4, !tbaa !6
  %10 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #3
  %11 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #3
  %12 = load i32, i32* %5, align 4, !tbaa !6
  %13 = load i32, i32* %6, align 4, !tbaa !6
  %14 = icmp sge i32 %12, %13
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %3
  store i32 1, i32* %9, align 4
  br label %64

; <label>:16:                                     ; preds = %3
  %17 = load i32*, i32** %4, align 8, !tbaa !2
  %18 = load i32, i32* %5, align 4, !tbaa !6
  %19 = load i32, i32* %5, align 4, !tbaa !6
  %20 = load i32, i32* %6, align 4, !tbaa !6
  %21 = add nsw i32 %19, %20
  %22 = sdiv i32 %21, 2
  call void @swap(i32* %17, i32 %18, i32 %22)
  %23 = load i32, i32* %5, align 4, !tbaa !6
  store i32 %23, i32* %8, align 4, !tbaa !6
  %24 = load i32, i32* %5, align 4, !tbaa !6
  %25 = call i32 @__faultinject_selected_target(i32 %24)
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %7, align 4, !tbaa !6
  br label %27

; <label>:27:                                     ; preds = %49, %16
  %28 = load i32, i32* %7, align 4, !tbaa !6
  %29 = load i32, i32* %6, align 4, !tbaa !6
  %30 = icmp sle i32 %28, %29
  br i1 %30, label %31, label %52

; <label>:31:                                     ; preds = %27
  %32 = load i32*, i32** %4, align 8, !tbaa !2
  %33 = load i32, i32* %7, align 4, !tbaa !6
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i32, i32* %32, i64 %34
  %36 = load i32, i32* %35, align 4, !tbaa !6
  %37 = load i32*, i32** %4, align 8, !tbaa !2
  %38 = load i32, i32* %5, align 4, !tbaa !6
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i32, i32* %37, i64 %39
  %41 = load i32, i32* %40, align 4, !tbaa !6
  %42 = icmp slt i32 %36, %41
  br i1 %42, label %43, label %48

; <label>:43:                                     ; preds = %31
  %44 = load i32*, i32** %4, align 8, !tbaa !2
  %45 = load i32, i32* %8, align 4, !tbaa !6
  %46 = add nsw i32 %45, 1
  store i32 %46, i32* %8, align 4, !tbaa !6
  %47 = load i32, i32* %7, align 4, !tbaa !6
  call void @swap(i32* %44, i32 %46, i32 %47)
  br label %48

; <label>:48:                                     ; preds = %43, %31
  br label %49

; <label>:49:                                     ; preds = %48
  %50 = load i32, i32* %7, align 4, !tbaa !6
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %7, align 4, !tbaa !6
  br label %27

; <label>:52:                                     ; preds = %27
  %53 = load i32*, i32** %4, align 8, !tbaa !2
  %54 = load i32, i32* %5, align 4, !tbaa !6
  %55 = load i32, i32* %8, align 4, !tbaa !6
  call void @swap(i32* %53, i32 %54, i32 %55)
  %56 = load i32*, i32** %4, align 8, !tbaa !2
  %57 = load i32, i32* %5, align 4, !tbaa !6
  %58 = load i32, i32* %8, align 4, !tbaa !6
  %59 = sub nsw i32 %58, 1
  call void @qsort(i32* %56, i32 %57, i32 %59)
  %60 = load i32*, i32** %4, align 8, !tbaa !2
  %61 = load i32, i32* %8, align 4, !tbaa !6
  %62 = add nsw i32 %61, 1
  %63 = load i32, i32* %6, align 4, !tbaa !6
  call void @qsort(i32* %60, i32 %62, i32 %63)
  store i32 0, i32* %9, align 4
  br label %64

; <label>:64:                                     ; preds = %52, %15
  %65 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %65) #3
  %66 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %66) #3
  %67 = load i32, i32* %9, align 4
  switch i32 %67, label %69 [
    i32 0, label %68
    i32 1, label %68
  ]

; <label>:68:                                     ; preds = %64, %64
  ret void

; <label>:69:                                     ; preds = %64
  unreachable
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.start.p0i8(i64, i8* nocapture) #1

declare dso_local void @__marking_faultinject_intptr(i32*) #2

; Function Attrs: nounwind uwtable
define dso_local void @swap(i32*, i32, i32) #0 {
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32* %0, i32** %4, align 8, !tbaa !2
  store i32 %1, i32* %5, align 4, !tbaa !6
  store i32 %2, i32* %6, align 4, !tbaa !6
  %8 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %8) #3
  %9 = load i32*, i32** %4, align 8, !tbaa !2
  %10 = load i32, i32* %5, align 4, !tbaa !6
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i32, i32* %9, i64 %11
  %13 = load i32, i32* %12, align 4, !tbaa !6
  store i32 %13, i32* %7, align 4, !tbaa !6
  %14 = load i32*, i32** %4, align 8, !tbaa !2
  %15 = load i32, i32* %6, align 4, !tbaa !6
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i32, i32* %14, i64 %16
  %18 = load i32, i32* %17, align 4, !tbaa !6
  %19 = load i32*, i32** %4, align 8, !tbaa !2
  %20 = load i32, i32* %5, align 4, !tbaa !6
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32* %19, i64 %21
  store i32 %18, i32* %22, align 4, !tbaa !6
  %23 = load i32, i32* %7, align 4, !tbaa !6
  %24 = load i32*, i32** %4, align 8, !tbaa !2
  %25 = load i32, i32* %6, align 4, !tbaa !6
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i32, i32* %24, i64 %26
  store i32 %23, i32* %27, align 4, !tbaa !6
  %28 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #3
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.lifetime.end.p0i8(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [97 x i32], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, i32* %1, align 4
  %5 = bitcast [97 x i32]* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 388, i8* %5) #3
  %6 = bitcast [97 x i32]* %2 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %6, i8* align 16 bitcast ([97 x i32]* @main.arr to i8*), i64 388, i1 false)
  %7 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #3
  store i32 97, i32* %3, align 4, !tbaa !6
  %8 = getelementptr inbounds [97 x i32], [97 x i32]* %2, i32 0, i32 0
  %9 = load i32, i32* %3, align 4, !tbaa !6
  %10 = sub nsw i32 %9, 1
  call void @qsort(i32* %8, i32 0, i32 %10)
  %11 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %11) #3
  store i32 0, i32* %4, align 4, !tbaa !6
  br label %12

; <label>:12:                                     ; preds = %24, %0
  %13 = load i32, i32* %4, align 4, !tbaa !6
  %14 = load i32, i32* %3, align 4, !tbaa !6
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %12
  %17 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %17) #3
  br label %27

; <label>:18:                                     ; preds = %12
  %19 = load i32, i32* %4, align 4, !tbaa !6
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [97 x i32], [97 x i32]* %2, i64 0, i64 %20
  %22 = load i32, i32* %21, align 4, !tbaa !6
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %22)
  br label %24

; <label>:24:                                     ; preds = %18
  %25 = load i32, i32* %4, align 4, !tbaa !6
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %4, align 4, !tbaa !6
  br label %12

; <label>:27:                                     ; preds = %16
  %28 = bitcast i32* %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %28) #3
  %29 = bitcast [97 x i32]* %2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 388, i8* %29) #3
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #1

declare dso_local i32 @printf(i8*, ...) #2

declare i32 @__faultinject_selected_target(i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 7.0.0-3 (tags/RELEASE_700/final)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"any pointer", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !4, i64 0}
