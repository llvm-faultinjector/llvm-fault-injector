# Custom-LLVM for Interprocedural Dependencies Checking on RISC-V Hardware Register.

This custom-llvm has been forked to determine the variable dependencies (Dominated, Maybe) 
of the specific register specified by llvm.annotation in the IR step. This project can help 
you to output variable dependencies of the IR level from an object file(Not yet). See Commits
for more details on the code changes. Also refer to the develop and test branches for testing
and etcs.

***

## 1. Representation in the IR stage
Please read the following article while referring to b.cpp and b.ll. [Test Folder](test/Dependency%20Test) 

### 1.1. Variable marking using llvm.annotation
`__attribute __ ((annotate (" message ")))` is an annotation feature provided by clang / llvm. This function allows you to know the annotated variables until the final stage of IR. You can also see the contents of `" message "` in an annotated variable.
``` c++
  int __attribute__((annotate("a"))) a = 0;
```
``` llvm
@.str.2 = private unnamed_addr constant [2 x i8] c"a\00", section "llvm.metadata"

  %a = alloca i32, align 4
  %1 = bitcast i32* %a to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %1) #2
  call void @llvm.var.annotation(i8* nonnull %1, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i32 10)
```
The variable `a` has been annotated via the above C ++ syntax. The following IR representation shows that the function `@ llvm.var.annotation` calls `%1` and that `%1` bitcasts`%a`. `%a` points to the annotated variable a. With the llvm annotation function, `StoreInst` tells which values are assigned to`%a`.
``` llvm
  %add4 = add nsw i32 %4, %call
  store i32 %add4, i32* %a, align 4, !tbaa !3
```
The above statement shows that the value of `%add4` is stored in `%a`. This function works on all annotated variables and does not disappear in the optimization phase.

### 1.2. Variable marking via extern function
When variable marking using `llvm.annotation`, I found that marking disappears in some situations during maximum optimization on testing.
We could not find another way to mark the variable itself, but we could find the virtual register used in the process of changing the variable by calling the bodyless function.
``` c++
#define ANNORATE(msg) __attribute__((annotate(msg)))
extern void __my__annotate(void *);

void SHA256_Mixing(SHA_PULONG indexs, SHA_PULONG outdexs)
{
   SHA_ULONG w[64];
   SHA_ULONG i, a, b, c, d, e, f, g, h,  ANNORATE("t1") t1, ANNORATE("t2") t2;
   
   for (i = 0; i < 16; i++)
      w[i] = CONVERT_TO_LITTLE_ENDIAN(indexs[i]);
   
   for (i = 16; i < 64; i++)
      w[i] = SHA_256_s0(w[i - 15]) + w[i - 16] + w[i - 7] + SHA_256_s1(w[i - 2]);

  for (i = 0; i < 64; i++) {

    __my__annotate(t1);
    SHA_256_LOOP(a, b, c, d, e, f, g, h, i, t1, t2);
    SHA_256_XROLL(a, b, c, d, e, f, g, h, t1, t2);
  }
```
The above t1 is marked, but no annotation is left in -O2 optimization. With the extern function, you can get the following results from the .ll file:
``` llvm
  ; Before
for.body73:                                       ; preds = %for.body73, %for.end62
  %add112215 = phi i32 [ %26, %for.end62 ], [ %add112, %for.body73 ]
  %i.2214 = phi i32 [ 0, %for.end62 ], [ %inc114, %for.body73 ]
  %h.0213 = phi i32 [ %35, %for.end62 ], [ %g.0212, %for.body73 ]
  %g.0212 = phi i32 [ %34, %for.end62 ], [ %f.0211, %for.body73 ]
  %f.0211 = phi i32 [ %33, %for.end62 ], [ %e.0210, %for.body73 ]
  %e.0210 = phi i32 [ %32, %for.end62 ], [ %add111, %for.body73 ]
  %d.0209 = phi i32 [ %31, %for.end62 ], [ %c.0208, %for.body73 ]
  %c.0208 = phi i32 [ %30, %for.end62 ], [ %b.0207, %for.body73 ]
  %b.0207 = phi i32 [ %29, %for.end62 ], [ %add112215, %for.body73 ]
  %shr74 = lshr i32 %e.0210, 6
  %shl75 = shl i32 %e.0210, 26
  %or76 = or i32 %shr74, %shl75
  %shr77 = lshr i32 %e.0210, 11
  %shl78 = shl i32 %e.0210, 21
  ...

  ; After
for.body73:                                       ; preds = %for.body73, %for.end62
  %t1.0216 = phi i32 [ undef, %for.end62 ], [ %add93, %for.body73 ]
  %h.0215 = phi i32 [ %31, %for.end62 ], [ %g.0214, %for.body73 ]
  %g.0214 = phi i32 [ %30, %for.end62 ], [ %f.0213, %for.body73 ]
  %f.0213 = phi i32 [ %29, %for.end62 ], [ %e.0212, %for.body73 ]
  %e.0212 = phi i32 [ %28, %for.end62 ], [ %add111, %for.body73 ]
  %d.0211 = phi i32 [ %27, %for.end62 ], [ %c.0210, %for.body73 ]
  %c.0210 = phi i32 [ %26, %for.end62 ], [ %b.0209, %for.body73 ]
  %b.0209 = phi i32 [ %25, %for.end62 ], [ %35, %for.body73 ]
  %i.2208 = phi i32 [ 0, %for.end62 ], [ %inc114, %for.body73 ]
  %32 = inttoptr i32 %t1.0216 to i8*
  ; extern function called
  call void @__my__annotate(i8* %32) #2
  %shr74 = lshr i32 %e.0212, 6
  %shl75 = shl i32 %e.0212, 26
  %or76 = or i32 %shr74, %shl75
  %shr77 = lshr i32 %e.0212, 11
  %shl78 = shl i32 %e.0212, 21
```
Like this, when marking with extern function, the kind of marking of argument of function is marked as `Annotated` which will be described below.
The extern function used is removed from llc processing via `eraseFromParent`.

***
