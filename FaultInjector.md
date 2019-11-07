# LLVM Based Fault Injector

LLVM Based Fault Injector to Minimize the Impact of Binary Code.

## Run sample code

Reference: https://github.com/rollrat/runnable-llvm/blob/master/1samples/run.py

Type2 Model

```
target file: test.c

1. Compile with no optimizer options.
clang test.c -S -emit-llvm -o test-1-clang.ll -mllvm -disable-llvm-optzns -disable-llvm-passes -O1

2. Run faultinject pass
This pass just selects target instruction using dependency checker and marking using fake extern function.
opt -S test-1-clang.ll -o test-2-faultinject.ll -faultinject

3. Run O2 optimizing
opt -S test-2-faultinject.ll -o test-3-o2.ll -O2

4-1. Run injectfault pass
opt -S test-3-o2.ll -o test-4-injectfault.ll -injectfault

4-2. Run deleteinjectfunc pass
opt -S test-3-o2.ll -o test-4-deleteinjectfault.ll -deleteinjectfunc

5. Run llc
llc test-4-injectfault.ll -o test-5-injectfault.s
llc test-4-deleteinjectfault.ll -o test-5-none.s
```