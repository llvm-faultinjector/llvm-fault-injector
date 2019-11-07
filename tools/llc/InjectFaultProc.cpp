//===----------------------------------------------------------------------===//
//
//                       LLVM Fault Injection Tool
//
//===----------------------------------------------------------------------===//
//
//  Copyright (C) 2019. rollrat. All Rights Reserved.
//
//===----------------------------------------------------------------------===//

#include "llvm/ADT/SmallVector.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Demangle/Demangle.h"
#include "llvm/IR/CFG.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/DebugInfoMetadata.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Pass.h"
#include "llvm/Support/Casting.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/InjectFault.h"
#include <map>
#include <random>
#include <set>
#include <sstream>
#include <string>

#define MARK_FUNCTION_NAME "faultinjectmarked"
#define IGNORE_ZERO_SIZE 1
#define USE_RAW_INJECT 1

using namespace llvm;

std::map<int, std::string> mgrs;
std::string llvm::getInformation(int index)
{
  return mgrs[index];
}

namespace {

static LLVMContext cnt;
static MDNode *md;

class DependencyDebugLocHelper {
public:
  static void Initialize() {
    md = MDNode::get(
      cnt, DILocation::get(cnt, 100, 100, DIScope::get(cnt, nullptr)));
  }

  static DebugLoc getDebugLoc(int magic) {
    return DebugLoc::get(magic, (uint16_t)-1, md);
  }

  static void setDebugLoc(Instruction *I) {
    //if (I->getDebugLoc()) {
      int magic = mgrs.size() + 30000;
      I->setDebugLoc(getDebugLoc(magic));
      mgrs.insert({ magic, "### FAULT INJECTED" });
    //}
  }
};

struct LLVMInjectFaultPass : public FunctionPass {
  static char ID;

  LLVMInjectFaultPass() : FunctionPass(ID) {
    DependencyDebugLocHelper::Initialize();
  }

  ~LLVMInjectFaultPass() {}

  bool runOnFunction(Function &F) override {

    //DependencyDebugLocHelper::setDebugLoc(resetter);
    std::vector<CallInst *> cis;
    for (auto &bb : F)
      for (auto &inst : bb)
      {
        if (CallInst *CI = dyn_cast<CallInst>(&inst))
        {
          CallInst *call = (CallInst *)(void *)&inst;
          if (call->getCalledFunction() && 
              call->getCalledFunction()->getName().contains(MARK_FUNCTION_NAME))
          {
            DependencyDebugLocHelper::setDebugLoc(cast<Instruction>(call->getOperand(0)));
            cis.push_back(call);
          }
        }
      }

    for (auto &CI : cis)
      CI->eraseFromParent();

    return true;
  }
};

}

char LLVMInjectFaultPass::ID = 0;

static RegisterPass<LLVMInjectFaultPass> X("injectfault",
                                              "Inject Fault Pass",
                                              false /* Only looks at CFG */,
                                              false /* Analysis Pass */);

FunctionPass *myPassx = nullptr;

FunctionPass *llvm::createInjectFaultProcPass() {
  if (myPassx == nullptr)
    myPassx = new LLVMInjectFaultPass();
  return myPassx;
}