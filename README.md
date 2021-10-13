# LLVM(8.0.0) for Fault Injection

This custom-llvm has been forked for implementing fault-injector.

## Sub-Links

[Dependency Checker](https://github.com/rollrat/runnable-llvm/blob/master/DependencyChecker.md)

[Fault Injection](https://github.com/rollrat/runnable-llvm/blob/master/FaultInjector.md)

[Register Tracing](https://github.com/rollrat/runnable-llvm/blob/master/TraceRegister.md)

[Sample Codes](https://github.com/rollrat/runnable-llvm/tree/master/1samples)

## Build

```
git clone https://github.com/HPCL-INHA/fault-injector
cd fault-injector
mkdir build
cd build
cmake ../
cmake --build tools/opt -- -j32
cmake --build tools/llc -- -j32
```

## How to use

### Fault Injector Legacy

```
Copy files in test directory to your test codes

clang -S -emit-llvm test.c
./opt -faultinjectlegacy test.ll -S -o test-injected.ll
llc -filetype=obj test-injected.ll -o test-injected.obj

clang -S -emit-llvm rtl-core.c
llc -filetype=obj rtl-core.ll -o rtl-core.obj

clang rtl-core.obj test-injected.obj
```

#### Test

Sample: https://github.com/HPCL-INHA/fault-injector/releases/download/binary/x86_64-linux.tar.xz

##### Profile Mode

1. Set `setting` file like this

```
run_fault_injection 0
count_of_determine 54
```

If `run_fault_injection` set to zero, then faultinjected binary is run as profile mode.
`count_of_determine` is used to faultinjection processing

2. Run `./a.out`

3. You can get outputs from `result` file

```
[Fault Injector] RTL-Core Init!
[Fault Injector] trace: f_index=00, index=01, reg_num=-1, dependency=-1, opcode=   load, size=32, value=00000001
[Fault Injector] trace: f_index=00, index=00, reg_num=-1, dependency=-1, opcode=   load, size=32, value=00000000
  .
  .
  .
[Fault Injector] trace: f_index=00, index=00, reg_num=-1, dependency=-1, opcode=   load, size=32, value=00000001
[Fault Injector] trace: f_index=00, index=08, reg_num=-1, dependency=-1, opcode=   load, size=32, value=00000000
[Fault Injector] RTL-Core Finish!
[Fault Injector] determine=14
```

##### Fault Injection Mode

1. Set `run_fault_injection` to `1`

2. Set `count_of_determine` to `determine` that can get from profile mode

You can get the `determine` from the result in profile mode.
`determine` is a list of all variables that can be specified at program execution time.
By setting `count_of_determine`, you can specify the probability of a bitflip occurring.

### Fault Injector to Minimize the Impact of Binary Code

```
import sys
import os
import os.path
from subprocess import Popen, PIPE


if len(sys.argv) == 1:
  print "LLVM Based FaultInjector"
  print "run.py <Code File .c or .cpp>"
  exit(1)

if os.path.isfile(sys.argv[1]) == False:
  print "no such file or directory: " + sys.argv[1]
  exit(1)
  
clang_addr = "clang"
opt_addr = "../opt"              <= Set your opt binary path
llc_addr = "../llc"                 <= Set your llc binary path

filename = os.path.splitext(sys.argv[1])[0]
clang_result = filename + "-1-clang.ll"
process = Popen([clang_addr, sys.argv[1], "-S", "-emit-llvm", "-o", clang_result, "-mllvm", "-disable-llvm-optzns", "-disable-llvm-passes", "-O1"])
process.wait()

# Run faultinject pass
opt_faultinject = filename + "-2-faultinject.ll"
process = Popen([opt_addr, "-S", clang_result, "-o", opt_faultinject, "-faultinject"])
process.wait()

# Run O2 optimizing
o2_result = filename + "-3-o2.ll"
process = Popen([opt_addr, "-S", opt_faultinject, "-o", o2_result, "-O2"])
process.wait()

# 1. Run injectfault
if_result = filename + "-4-injectfault.ll"
process = Popen([opt_addr, "-S", o2_result, "-o", if_result, "-injectfault"])
process.wait()

# 2. Run deleteinjectfunc
dif_result = filename + "-4-deleteinjectfault.ll"
process = Popen([opt_addr, "-S", o2_result, "-o", dif_result, "-deleteinjectfunc"])
process.wait()

# 1-1. Run llc
llc_1 = filename + "-5-llc-injectfault.s"
process = Popen([llc_addr, if_result, "-o", llc_1])
process.wait()

# 2-1. Run llc
llc_2 = filename + "-5-llc-none.s"
process = Popen([llc_addr, dif_result, "-o", llc_2])
process.wait()

# 1-3. Extract binary
obj_name1 = filename + "-6-bin-injectfault.obj"
bin_name1 = filename + "-6-bin-injectfault"
process = Popen([llc_addr, "-filetype=obj", if_result, "-o", obj_name1])
process.wait()
process = Popen([clang_addr, obj_name1, "-o", bin_name1])
process.wait()

# 2-3. Extract binary
obj_name2 = filename + "-6-bin-none.obj"
bin_name2 = filename + "-6-bin-none"
process = Popen([llc_addr, "-filetype=obj", dif_result, "-o", obj_name2])
process.wait()
process = Popen([clang_addr, obj_name2, "-o", bin_name2])
process.wait()
```
