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

#define DEBUG_TYPE "fault-injection"

#define MARK_FUNCTION_NAME "__marking_faultinject"
#define IGNORE_ZERO_SIZE 1
#define USE_RAW_INJECT 1

using namespace llvm;


std::string llvm::getInformation(int index) { return nullptr; }

FunctionPass *llvm::createInjectFaultProcPass() { return nullptr; }

namespace {

class FaultInjectionMachine {
public:

  static GlobalVariable * insertInjectFault(Module &M, Function &F, CallInst *CI, GlobalVariable *AI) {
    if (CI->getOperand(0)->getType()->isIntegerTy())
      return insertInjectFaultInteger(M, F, CI, AI);
    else if (CI->getOperand(0)->getType()->isFloatingPointTy())
      return insertInjectFaultFloatingPoint(M, F, CI, AI);
  }

private:

  template<typename location_type>
  static GlobalVariable *createXorMarker(Module &M, Type * type, location_type value)
  {
    return new GlobalVariable(M, type, false, GlobalValue::LinkageTypes::InternalLinkage, ConstantInt::get(type, value, true));
  }

  static GlobalVariable * insertInjectFaultInteger(Module &M, Function &F, CallInst *CI, GlobalVariable *AI) {
    IntegerType *type = cast<IntegerType>(CI->getOperand(0)->getType()); //Type::getInt32Ty(M.getContext());
    GlobalVariable *xor_marker = AI;

    if (xor_marker == nullptr)
    {
      //xor_marker = new AllocaInst(type, M.getDataLayout().getProgramAddressSpace(),
      //  "xor_marker", &*F.getEntryBlock().begin());
      //Value *num = ConstantInt::get(type, loc, true);
      //new StoreInst(num, xor_marker, &*++F.getEntryBlock().begin());

      //insert(M, xor_marker, &*++F.getEntryBlock().begin());

      int type_size = type->getBitWidth();

      std::mt19937 rng;
      rng.seed(std::random_device()());
      std::uniform_int_distribution<std::mt19937::result_type> dist(0, type_size);
      unsigned long long int loc = 1ULL << dist(rng);

      xor_marker = createXorMarker(M, type, loc);
    }

    Value *num_zero = ConstantInt::get(type, 0, true);
    StoreInst *resetter = new StoreInst(num_zero, xor_marker, CI->getNextNode());
    LoadInst *val = new LoadInst(xor_marker, "xor_val", resetter);
    BinaryOperator *fi =
      BinaryOperator::CreateXor(CI->getOperand(0), val, "rfi", val->getNextNode());

    //insert(M, resetter, resetter->getNextNode());
    insert(M, val, val->getNextNode(), type);
    insert(M, fi, fi->getNextNode(), type);

    std::list<User *> inst_uses;
    for (Value::user_iterator user_it = CI->user_begin();
      user_it != CI->user_end(); ++user_it) {
      User *user = *user_it;
      if (user != CI && user != fi)
        inst_uses.push_back(user);
    }
    for (std::list<User *>::iterator use_it = inst_uses.begin();
      use_it != inst_uses.end(); ++use_it) {
      User *user = *use_it;
      user->replaceUsesOfWith(CI, fi);
    }

    CI->eraseFromParent();

    return xor_marker;
  }

  static GlobalVariable * insertInjectFaultFloatingPoint(Module &M, Function &F, CallInst *CI, GlobalVariable *AI) {
    Type *type = CI->getOperand(0)->getType();
    GlobalVariable *xor_marker = AI;

    if (xor_marker == nullptr)
    {
      int type_size = 0;

      if (type->isDoubleTy())
        type_size = 64;
      else if (type->isHalfTy())
        type_size = 16;
      else if (type->isFloatTy())
        type_size = 32;
        
      std::mt19937 rng;
      rng.seed(std::random_device()());
      std::uniform_int_distribution<std::mt19937::result_type> dist(0, type_size);
      unsigned long long int loc = 1ULL << dist(rng);

      if (type->isDoubleTy())
        xor_marker = createXorMarker(M, Type::getInt64Ty(M.getContext()), loc);
      else if (type->isFloatTy())
        xor_marker = createXorMarker(M, Type::getInt32Ty(M.getContext()), loc);
    }

    CastInst *fi;

    if (type->isDoubleTy())
    {
      Value *num_zero = ConstantInt::get(Type::getInt64Ty(M.getContext()), 0, true);
      StoreInst *resetter = new StoreInst(num_zero, xor_marker, CI->getNextNode());
      LoadInst *val = new LoadInst(xor_marker, "xor_val", resetter);
      CastInst *double2i64 = BitCastInst::Create(Instruction::CastOps::BitCast, CI->getOperand(0), Type::getInt64Ty(M.getContext()), "", val->getNextNode());
      BinaryOperator *xfi =
        BinaryOperator::CreateXor(double2i64, val, "", double2i64->getNextNode());
      fi = BitCastInst::Create(Instruction::CastOps::BitCast, xfi, Type::getDoubleTy(M.getContext()), "", xfi->getNextNode());
      insert(M, val, val->getNextNode(), Type::getInt64Ty(M.getContext()));
    }
    else if (type->isFloatTy())
    {
      Value *num_zero = ConstantInt::get(Type::getInt32Ty(M.getContext()), 0, true);
      StoreInst *resetter = new StoreInst(num_zero, xor_marker, CI->getNextNode());
      LoadInst *val = new LoadInst(xor_marker, "xor_val", resetter);
      CastInst *float2i32 = BitCastInst::Create(Instruction::CastOps::BitCast, CI->getOperand(0), Type::getInt32Ty(M.getContext()), "", val->getNextNode());
      BinaryOperator *xfi =
        BinaryOperator::CreateXor(float2i32, val, "", float2i32->getNextNode());
      fi = BitCastInst::Create(Instruction::CastOps::BitCast, xfi, Type::getFloatTy(M.getContext()), "", xfi->getNextNode());
      insert(M, val, val->getNextNode(), Type::getInt32Ty(M.getContext()));
    }

    insert(M, fi, fi->getNextNode(), type, "_floatingpoint");

    std::list<User *> inst_uses;
    for (Value::user_iterator user_it = CI->user_begin();
      user_it != CI->user_end(); ++user_it) {
      User *user = *user_it;
      if (user != CI && user != fi)
        inst_uses.push_back(user);
    }
    for (std::list<User *>::iterator use_it = inst_uses.begin();
      use_it != inst_uses.end(); ++use_it) {
      User *user = *use_it;
      user->replaceUsesOfWith(CI, fi);
    }

    CI->eraseFromParent();

    return xor_marker;
  }

  static CallInst *insert(Module &M, Instruction * I, Instruction * B, Type *Ty, std::string postfix = "")
  {
    std::vector<Value *> args(1);
    args[0] = I;
    ArrayRef<Value *> args_arr(args);
    return CallInst::Create(getSelectFaultInjectionTargetFunc(M, I, Ty, postfix), args_arr, "", B);
  }

  static Constant *getSelectFaultInjectionTargetFunc(Module &M, Instruction *T, Type *Ty, std::string postfix) {
    std::vector<Type *> func_param_types(1);
    func_param_types[0] = Ty;
    ArrayRef<Type *> param_arr(func_param_types);
    FunctionType *func_type = FunctionType::get( Type::getVoidTy(M.getContext()), param_arr, false);
      //Type::getInt32Ty(M.getContext()), param_arr, false);
    //FunctionType *func_type = FunctionType::get(Type::getVoidTy(M.getContext()), false);
    return M.getOrInsertFunction("faultinjectmarked" + postfix, func_type);
  }
};

struct LLVMInjectFaultPass : public ModulePass {
  static char ID;

  LLVMInjectFaultPass() : ModulePass(ID) {}

  ~LLVMInjectFaultPass() {}

  bool runOnModule(Module &M) override {
    for (Module::iterator m_it = M.begin(); m_it != M.end();
         ++m_it) {
      std::vector<CallInst *> mm;
      for (auto &bb : *m_it)
        for (auto &inst : bb)
          if (CallInst *call = dyn_cast<CallInst>(&inst))
          {
            if (call->getCalledFunction() && call->getCalledFunction()->getName().contains("__faultinject_selected_target"))
              mm.push_back(call);
          }
      GlobalVariable *ai = nullptr;
      for (auto& CI : mm)
        ai = FaultInjectionMachine::insertInjectFault(M, *m_it, CI, ai);
    }
    return true;
  }
};

}

char LLVMInjectFaultPass::ID = 0;

static RegisterPass<LLVMInjectFaultPass> X("injectfault",
                                              "Inject Fault Pass",
                                              false /* Only looks at CFG */,
                                              false /* Analysis Pass */);
