# Custom-LLVM for Interprocedural Dependencies Checking on RISC-V Hardware Register.

한국어 : https://github.com/rollrat/custom-llvm2/blob/master/README.md

This custom-llvm has been forked to determine the variable dependencies (Dominated, Maybe) 
of the specific register specified by llvm.annotation in the IR step. This project can help 
you to output variable dependencies of the IR level from an object file(Not yet). See Commits
for more details on the code changes. Also refer to the develop and test branches for testing
and etcs.

***

## 1. Representation in the IR stage
Please read the following article while referring to b.cpp and b.ll. [Test Folder](https://github.com/rollrat/custom-llvm2/tree/master/test/Dependency%20Test) 

### 1.1. Variable marking using llvm.annotation
`__attribute__((annotate("message")))` is an annotation feature provided by clang / llvm. This function allows you to know the annotated variables until the final stage of IR. You can also see the contents of `" message "` in an annotated variable.
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


## 2. Dependency Pass
This is the pass to mark the dependency of the variable in the Instruction. It is executed once for each function just before the SDNode generation, not the optimization step.
This [link](https://github.com/rollrat/custom-llvm2/commit/583681378edf38a3d837135f9815c621c3021590#diff-825e43e63961002d7541aec6d4d4f7a4R468)
Indicates the above procedure. You can know that `c-> runOnFunction` immediately precedes the creation of the SDNode by` SelectAllBasicBlocks`.

The source of the following links is a full source code of Dependency Pass.
```
https://github.com/rollrat/custom-llvm2/blob/master/include/llvm/DependencyInfo.h
https://github.com/rollrat/custom-llvm2/blob/master/lib/Transforms/Scalar/Dependency.cpp
```

The following link is the git link that developed the pass before creating the custom-llvm repository.
```
https://github.com/rollrat/llvm-control-pass
```

### 2.1. Instruction Marking Type
The following 4 items are marking type on Dependency Pass.
```
Annotated : Instruction to be substituted by StoreInst.
Perpect : A fully connected Instruction.
Dominated : Includes Perpect, and includes instructions to change the branch associated with the parent BasicBlock.
Maybe : Dominated, and includes all instructions that change the branch of this BB with respect to all connected BasicBlocks.
```
`Annotated` >> `Perpect` >> `Dominated` >> `Maybe` Priority is determined in that order.
For example, `Instruction` with `Annotated` marking includes `Maybe` marking.

### 2.2. Branch Map
Branch Map is Control-Flow-Graph of Function BasicBlock. This is used to distinguish between Dominated and Maybe.
Look up the Branch Map, use `Dominated` if one parent BasicBlock is one, or use `Maybe` if more than one. 
![Image](https://raw.githubusercontent.com/rollrat/custom-llvm2/master/cfg-type.png)

### 2.3. Function dependency
An `Annotated` variable can be changed inside a called function if it is a pointer to a function's arguments.
Also, if the return value of a function is `Dominated` by a variable that has been `Annotated`, the arguments of that function can affect the return value.
To exploring these two things, we use the following classes to examine the call function.
```
FunctionReturnDependencyChecker: Checks which function arguments affect the return value.
FunctionArgumentDependencyCheck: Checks which function arguments affect other function arguments.
```
If you need to check for function dependencies, use `run` function in` DependencyChecker` to check only once per function.
This checking process is independent of whether or not `Annotate` is present.

### 2.4. Marking decision
The followings are the classes and functions used for `Instruction` marking.
``` c++
  class FunctionReturnDependencyChecker;
  class FunctionArgumentDependencyCheck
  class BottomUpDependencyChecker;
```
Only `BottomUpDependencyChecker` in the above class has `Instruction` marking privilege.
```
runPerpectBottomUp: Used on Perpect marking. (This function is called once per `Annotated` variable.)
runBottomUp: Used on Dominated, Maybe marking.
runSearch: Checks for changes in value by Store and function dependency. Used for `Annotated` marking with limited conditions.
  (This function conditionally calls runBottomUp.)
processBranches: Use the Branch Map to conditionally call runSearch, runBottomUp.
```
![Image](https://raw.githubusercontent.com/rollrat/custom-llvm2/master/marking.png)

#### 2.4.1. runBottomUp Function
`Instruction` through `runBottomUp` examines `Value` related to `Instruction` obtained through `getOperand`.
`Dominated`, `Maybe` is marked, but marking distinction is not done in this function. Marking distinction through `processBranches`
Is done.
``` vb.net
runBottomUp [Instruction: I, bool: P]
  if (P == true)
    I := Dominated
  else
    I := Maybe

  for each Operand in I.getOperand
    runBottomUp(Operand, P)
    runSearch(Operand, P)

  processBranches(I)
```
This iteration is repeated until the operand is not `Instruction`.
If `Instruction` is` CallInst`, only function arguments with `ReturnDependency` are checked.

#### 2.4.2. runSearch Function
`runSearch` checks for `Instruction` which is used as argument to `StoreInst` or` CallInst`.
The `ROOT : bool` variable for `Annotated` marking is used, and this variable is only `true` in the call to marking `entry`.
``` vb.net
runSearch [Instruction: I, bool: P, bool: ROOT (= false)]
  for each Instruction in Function.BasicBlock
    if (type(Instruction) :: StoreInst)
      if (StoreInst.Pointer == I)
        if (ROOT == true)
           I := Annotated
           runPerpectBottomUp (StoreInst.Value)
        runBottomUp(StoreInst.Value, P && ROOT)
        runSearch(StoreInst.Value, P && ROOT)

    else if (type(Instruction) :: CallInst)
      for each Oprand in FunctionArgumentDependency(CallInst.CalledFunction, Instruction.getOperand)
        runBottomUp(Operand, P && ROOT)
        runSearch(Operand, P && ROOT)

  processBranches(I)
```
`P && ROOT` is exists, because we can not determine `Dominated`, `Maybe` at runSearch level.
However, if `ROOT` is `true`, `P` is also` true` and subordinate `Instruction` is marked as `Dominated`.

#### 2.4.3. processBranches Function
Using Branch Map, we tracks the Compare element that determines the branch.
If the branch is not conditional, the compare element trace is skipped.
``` vb.net
processBranches [Instruction: I]
  processBlock(getNodeFromInstruction(I))

processBlock [BlockNode: BN]
  if (BN.getFromNodes.Size == 1)
	is_perpect := true
  else
    is_perepct := false

  for each BlockNode in BN.getFromNodes
    if (BlockNode is Conditional)
      runBottomUp(BlockNode.getCondition, is_perpect)
      runSearch(BlockNode.getCondition, is_perpect)

    processBlock(BlockNode)
```
The `BlockNode` once executed with `processBlock` will not be executed again.

#### 2.4.4. runPerpectBottomUp Function
This function recursively traverses each Operand in `Instruction` to mark the `Perpect`.
``` vb.net
runPerpectBottomUp [Instruction: I]
  I := Perpect

  for each Operand in I.getOperand
    runPerpectBottomUp(Operand)
```

***

## 3. SelectionDAG Traking
When the SelectionDAG is created, the `Instruction` Dependency information is passed to the DAGNode.
The following procedure shows the code that the PassManager calls as it creates the SelectionDAG.
```
Reference: https://github.com/draperlaboratory/fracture/wiki/How-An-IR-Statement-Becomes-An-Instruction

FunctionPass
    -> MachineFunctionPass
        -> SelelctionDAGISel
            -> TargetDAGToDAGISel

include/llvm/Pass.h
-> virtual bool runOnFunction(Function &F) = 0;

lib/CodeGen/MachineFunctionPass.cpp
-> runOnMachineFunction(MF)

lib/CodeGen/SelectionDAG/SelectionDAGISel.cpp
-> bool SelectionDAGISel::runOnMachineFunction(MachineFunction &mf)
The runOnMachineFunction function runs Dependency Checking before the SelectAllBasicBlocks function is executed.

lib/CodeGen/SelectionDAG/SelectionDAGISel.cpp
-> void SelectionDAGISel::SelectAllBasicBlocks(const Function &Fn)
The SelectAllBasicBlocks function calls `FastISel` and` SelectBasicBlock`.
`FastISel` is an InstructionSelection for debugging that runs only on -O0,
`SelectBasicBlocks` generates a SelectionDAGNode by executing `DoInstructionSelection`.

lib/CodeGen/SelectionDAG/SelectionDAGISel.cpp
-> void SelectionDAGISel::CodeGenAndEmitDAG() {
In the CodeGenAndEmitDAG function, DAGCombine, DAGLegalize is executed.
Instruction Schedule is also executed.
```

***

## 4. Bugs
The current version may not run the Dependency Pass for the following functions / functions, or an error may occur.
```
* Can not determine the ArgumentDependency of the function with the variable argument.
```
