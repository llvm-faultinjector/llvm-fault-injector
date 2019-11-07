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
opt_addr = "../opt"
llc_addr = "../llc"

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
