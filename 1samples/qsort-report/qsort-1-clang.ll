; ModuleID = 'qsort.c'
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
  call void @__marking_faultinject_intptr(i32* %8)
  %12 = load i32, i32* %5, align 4, !tbaa !6
  %13 = load i32, i32* %6, align 4, !tbaa !6
  %14 = icmp sge i32 %12, %13
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %3
  store i32 1, i32* %9, align 4
  br label %63

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
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %7, align 4, !tbaa !6
  br label %26

; <label>:26:                                     ; preds = %48, %16
  %27 = load i32, i32* %7, align 4, !tbaa !6
  %28 = load i32, i32* %6, align 4, !tbaa !6
  %29 = icmp sle i32 %27, %28
  br i1 %29, label %30, label %51

; <label>:30:                                     ; preds = %26
  %31 = load i32*, i32** %4, align 8, !tbaa !2
  %32 = load i32, i32* %7, align 4, !tbaa !6
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i32, i32* %31, i64 %33
  %35 = load i32, i32* %34, align 4, !tbaa !6
  %36 = load i32*, i32** %4, align 8, !tbaa !2
  %37 = load i32, i32* %5, align 4, !tbaa !6
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i32, i32* %36, i64 %38
  %40 = load i32, i32* %39, align 4, !tbaa !6
  %41 = icmp slt i32 %35, %40
  br i1 %41, label %42, label %47

; <label>:42:                                     ; preds = %30
  %43 = load i32*, i32** %4, align 8, !tbaa !2
  %44 = load i32, i32* %8, align 4, !tbaa !6
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %8, align 4, !tbaa !6
  %46 = load i32, i32* %7, align 4, !tbaa !6
  call void @swap(i32* %43, i32 %45, i32 %46)
  br label %47

; <label>:47:                                     ; preds = %42, %30
  br label %48

; <label>:48:                                     ; preds = %47
  %49 = load i32, i32* %7, align 4, !tbaa !6
  %50 = add nsw i32 %49, 1
  store i32 %50, i32* %7, align 4, !tbaa !6
  br label %26

; <label>:51:                                     ; preds = %26
  %52 = load i32*, i32** %4, align 8, !tbaa !2
  %53 = load i32, i32* %5, align 4, !tbaa !6
  %54 = load i32, i32* %8, align 4, !tbaa !6
  call void @swap(i32* %52, i32 %53, i32 %54)
  %55 = load i32*, i32** %4, align 8, !tbaa !2
  %56 = load i32, i32* %5, align 4, !tbaa !6
  %57 = load i32, i32* %8, align 4, !tbaa !6
  %58 = sub nsw i32 %57, 1
  call void @qsort(i32* %55, i32 %56, i32 %58)
  %59 = load i32*, i32** %4, align 8, !tbaa !2
  %60 = load i32, i32* %8, align 4, !tbaa !6
  %61 = add nsw i32 %60, 1
  %62 = load i32, i32* %6, align 4, !tbaa !6
  call void @qsort(i32* %59, i32 %61, i32 %62)
  store i32 0, i32* %9, align 4
  br label %63

; <label>:63:                                     ; preds = %51, %15
  %64 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %64) #3
  %65 = bitcast i32* %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %65) #3
  %66 = load i32, i32* %9, align 4
  switch i32 %66, label %68 [
    i32 0, label %67
    i32 1, label %67
  ]

; <label>:67:                                     ; preds = %63, %63
  ret void

; <label>:68:                                     ; preds = %63
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
