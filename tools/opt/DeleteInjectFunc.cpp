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
#include <map>
#include <random>
#include <set>
#include <sstream>
#include <string>

#define DEBUG_TYPE "fault-injection"

#define MARK_FUNCTION_NAME "__faultinject_selected_target"
#define IGNORE_ZERO_SIZE 1
#define USE_RAW_INJECT 1

using namespace llvm;

namespace {

  struct LLVMDeleteInjectionPass : public ModulePass {
    static char ID;

    LLVMDeleteInjectionPass() : ModulePass(ID) {}

    ~LLVMDeleteInjectionPass() {}

    bool runOnModule(Module &M) override {
      for (Module::iterator m_it = M.begin(); m_it != M.end();
        ++m_it) {
        std::vector<CallInst *> mm;
        for (auto &bb : *m_it)
          for (auto &inst : bb)
            if (CallInst *call = dyn_cast<CallInst>(&inst))
              if (call->getCalledFunction() && call->getCalledFunction()->getName().contains("__faultinject_selected_target"))
                mm.push_back(call);

        for (auto &ci : mm) {
          std::list<User *> inst_uses;
          for (Value::user_iterator user_it = ci->user_begin();
            user_it != ci->user_end(); ++user_it) {
            User *user = *user_it;
            if (user != ci)
              inst_uses.push_back(user);
          }
          auto uu = ci->getOperand(0);
          for (std::list<User *>::iterator use_it = inst_uses.begin();
            use_it != inst_uses.end(); ++use_it) {
            User *user = *use_it;
            user->replaceUsesOfWith(ci, uu);
          }
          ci->eraseFromParent();
        }
      }

      return true;
    }
  };

}

char LLVMDeleteInjectionPass::ID = 0;

static RegisterPass<LLVMDeleteInjectionPass> X("deleteinjectfunc",
  "Delete Fault injection target marking function.",
  false /* Only looks at CFG */,
  false /* Analysis Pass */);