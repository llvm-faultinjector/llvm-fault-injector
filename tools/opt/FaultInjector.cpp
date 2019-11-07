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

#define MARK_FUNCTION_NAME "__marking_faultinject"
#define IGNORE_ZERO_SIZE 1

using namespace llvm;
namespace {

///---------------------------------------------------------
///
///                    Insert Machine
///
///---------------------------------------------------------

class FaultInjectionInsertMachine {
 public:

  static void insertSelectFaultInjectionTarget(Module &M, Function &F,
                                               Instruction *I) {
    std::vector<Value *> args(1);
    args[0] = I;
    ArrayRef<Value *> args_arr(args);

    CallInst *CI =
        CallInst::Create(getSelectFaultInjectionTargetFunc(M, I->getType()), args_arr, "", I->getNextNode());

    std::list<User *> inst_uses;
    for (Value::user_iterator user_it = I->user_begin();
         user_it != I->user_end(); ++user_it) {
      User *user = *user_it;
      if (user != I && user != CI)
        inst_uses.push_back(user);
    }
    for (std::list<User *>::iterator use_it = inst_uses.begin();
         use_it != inst_uses.end(); ++use_it) {
      User *user = *use_it;
      user->replaceUsesOfWith(I, CI);
    }
    //F.print(errs());
  }

 private:
  static Constant *getSelectFaultInjectionTargetFunc(Module &M, Type *type) {
    std::vector<Type *> func_param_types(1);
    func_param_types[0] = type;
    ArrayRef<Type *> param_arr ( func_param_types);
    FunctionType *func_type = FunctionType::get(type, param_arr, false);
    return M.getOrInsertFunction("__faultinject_selected_target", func_type);
  }

};

///---------------------------------------------------------
///
///                   Profile Collector
///
///---------------------------------------------------------

#pragma region Dependency Checker

/// Dependency check�������� Ȯ�ε� inst�� �ֿܼ�
/// ����� ���� ���θ� �����մϴ�.
#define IDC_PRINT_INSTRUCTION 0

/// Dependency check ����� ����� ���� ���θ� �����մϴ�.
#define IDC_PRINT_RESULT 1

/// Annotate�� ������ �ִ� �Լ��� ����մϴ�.
#define IDC_PRINT_NONCONDITIONAL 1

/// �Լ��� ���ǵ��� ���� ���, �ֿܼ� �޽����� ����մϴ�.
#define IDC_PRINT_MSG_EMPTY_FUNCTION 1

/// �Լ��� ���ǵ��� ���� ���, �ش� �Լ��� �Լ����ڰ�
/// ���ϰ��� ������ ��ġ���� ���θ� �����մϴ�.
#define IDC_EMPTY_FUNCTION_PARAM_AFFECT_RETURN 1

/// branch map�� �̿��� �˻縦 �� ���� ���θ� �����մϴ�.
#define IDC_SCAN_CONTROL_FLOW 1

class DependencyInstrInfo
{
public:

  typedef enum {
    Annotated = 0,
    Perpect = 1,
    Dominated = 2,
    Maybe = 3,
  } DependencyInstrType;

  DependencyInstrInfo(Instruction *I, Value *S,
    DependencyInstrType T) : target(I), type(T), source(S) { }

  Instruction *getInstruction() const {
    return target;
  }

  Value *getSource() const {
    return source;
  }

  void setSource(Value *source) {
    this->source = source;
  }

  DependencyInstrType getType() const {
    return type;
  }

  void setType(DependencyInstrType type) {
    this->type = type;
  }

  std::string getInfo() const
  {
    std::string ret;
    ret.push_back('[');
    if (type == DependencyInstrType::Annotated)
      ret.append("Annotated");
    else if (type == DependencyInstrType::Perpect)
      ret.append("Perpect");
    else if (type == DependencyInstrType::Dominated)
      ret.append("Dominated");
    else
      ret.append("Maybe");
    ret.append(", Source: ");
    ret.append(source->getName());
    ret.push_back(']');
    return ret;
  }

private:

  Value * source;
  Instruction *target;
  DependencyInstrType type;
};

class DependencyInstrInfoManager
{
  using InfoType = std::vector<DependencyInstrInfo *>;
  InfoType vec;
public:

  void doFolding() {
    InfoType tmp;
    for (auto DI : vec) {
      for (auto TDI : tmp) {
        if (TDI->getSource() == DI->getSource()) {
          if ((unsigned)DI->getType() < (unsigned)TDI->getType()) {
            TDI->setType(DI->getType());
          }
          goto NEXT;
        }
      }
      tmp.push_back(DI);
    NEXT:
      ;
    }
    vec = tmp;
  }

  void addInfo(DependencyInstrInfo *info)
  {
    vec.push_back(info);
  }

  InfoType::const_iterator begin() const {
    return vec.begin();
  }

  InfoType::const_iterator end() const {
    return vec.end();
  }
};

DependencyInstrInfoManager *mgr;

class DependencyDebugLocHelper {
public:
  static void setDebugLoc(Instruction *I, Value *S,
    DependencyInstrInfo::DependencyInstrType T) {

    mgr->addInfo(new DependencyInstrInfo(I, S, T));
  }
};


///---------------------------------------------------------
///
///          Branch Map
///
///---------------------------------------------------------

class BlockNode {
  BasicBlock *basic_block;
  BranchInst *branch_inst;
  SmallVector<BlockNode *, 4> from_node;
  SmallVector<BlockNode *, 4> to_node;

public:
  BlockNode(BasicBlock *BB) : basic_block(BB), branch_inst(nullptr) {}

  void addFromNode(BlockNode *BN) { from_node.push_back(BN); }
  SmallVector<BlockNode *, 4> &getFromNodes() { return from_node; }
  void addToNode(BlockNode *BN) { to_node.push_back(BN); }
  SmallVector<BlockNode *, 4> &getToNodes() { return to_node; }

  void setBranchInst(BranchInst *BI) { branch_inst = BI; }
  BranchInst *getBranchInst() { return branch_inst; }

  BasicBlock *getBasicBlock() { return basic_block; }
};

class BranchManager {
  Function *function;
  BlockNode *start;
  std::vector<BlockNode *> nodes;

public:
  BranchManager(Function *F) : function(F) {
    if (!F->isIntrinsic()) {
      start = new BlockNode(&F->getEntryBlock());
      nodes.push_back(start);
      if (BranchInst *bi =
        dyn_cast<BranchInst>(&start->getBasicBlock()->back())) {
        start->setBranchInst(bi);
        for (size_t i = 0; i < bi->getNumSuccessors(); i++)
          start->addToNode(run(bi->getSuccessor(i), start));
      }
    }
  }

  BlockNode *getNodeFromInstruction(Instruction *inst) {
    for (BlockNode *bn : nodes)
      for (Instruction &i : *bn->getBasicBlock())
        if (&i == inst)
          return bn;
    return nullptr;
  }

private:
  BlockNode * run(BasicBlock *BB, BlockNode *P) {
    BlockNode *node = new BlockNode(BB);
    node->addFromNode(P);
    nodes.push_back(node);
    Instruction *last = &BB->back();
    if (BranchInst *bi = dyn_cast<BranchInst>(last)) {
      node->setBranchInst(bi);
      for (size_t i = 0; i < bi->getNumSuccessors(); i++) {
        for (size_t j = 0; j < nodes.size(); j++)
          if (nodes[j]->getBasicBlock() == bi->getSuccessor(i)) {
            node->addToNode(nodes[j]);
            nodes[j]->addFromNode(node);
            goto FINISH;
          }
        node->addToNode(run(bi->getSuccessor(i), node));
      FINISH:;
      }
    }
    return node;
  }
};

///---------------------------------------------------------
///
///                    Pass Tools
///
///---------------------------------------------------------

class InstructionDependency {
  using PairType = std::pair<Instruction *, bool>;
  using InstsType = std::vector<PairType>;
  InstsType insts;

public:
  bool hasInstructoin(Instruction *I, bool P = true) {
    for (auto &pair : insts)
      if (pair.first == I && (pair.second == P || pair.second))
        return true;
    return false;
  }
  void addInstruction(Instruction *I, bool P = true) {
    for (auto &pair : insts)
      if (pair.first == I) {
        if (P)
          pair.second = true;
        return;
      }
    insts.push_back(PairType(I, P));
  }

  InstsType::iterator begin() { return insts.begin(); }
  InstsType::const_iterator begin() const { return insts.begin(); }
  InstsType::iterator end() { return insts.end(); }
  InstsType::const_iterator end() const { return insts.end(); }
};

class InstructionDependencyMap {
  using ValueMap = std::map<Value *, InstructionDependency *>;
  ValueMap value_map;

public:
  InstructionDependencyMap() : value_map() {}
  ~InstructionDependencyMap() {
    for (auto &id : value_map)
      delete id.second;
  }
  bool hasDependency(Value *V) { return value_map.find(V) != value_map.end(); }
  InstructionDependency *getDependency(Value *V) { return value_map[V]; }
  void addDependency(Value *V, InstructionDependency *ID) { value_map[V] = ID; }

  ValueMap::iterator begin() { return value_map.begin(); }
  ValueMap::const_iterator begin() const { return value_map.begin(); }
  ValueMap::iterator end() { return value_map.end(); }
  ValueMap::const_iterator end() const { return value_map.end(); }
};

class ArgumentInstructionDependencyMap {
  using IndexMap = std::map<int, InstructionDependency *>;
  IndexMap index_map;

public:
  ArgumentInstructionDependencyMap() : index_map() {}
  bool hasDependency(int ArgNo) {
    return index_map.find(ArgNo) != index_map.end();
  }
  InstructionDependency *getDependency(int ArgNo) { return index_map[ArgNo]; }
  void addDependency(int ArgNo, InstructionDependency *ID) {
    index_map[ArgNo] = ID;
  }

  IndexMap::iterator begin() { return index_map.begin(); }
  IndexMap::const_iterator begin() const { return index_map.begin(); }
  IndexMap::iterator end() { return index_map.end(); }
  IndexMap::const_iterator end() const { return index_map.end(); }
};

class FunctionArgumentDependency {
  Argument *argument;
  std::vector<bool> argument_dependency;

public:
  FunctionArgumentDependency(Argument *A, size_t argc)
    : argument(A), argument_dependency(argc) {}
  Argument *getArgument() { return argument; }
  bool hasArgumentDependency(int ix) { return argument_dependency[ix]; }
  void setArgumentDependency(int ix) { argument_dependency[ix] = true; }
};

/// �� Ŭ������ ������ ���� �� ���� ������ ������ �ֽ��ϴ�.
/// 1. �Լ����ڰ� ��ȯ���� ��ġ�� ����
/// 2. �Լ����ڰ� � �Լ����ڿ� ��ġ�� ����
/// 3. �� �ΰ��� �� �� �� �̻��� ��쿡�� ������ ��ġ��
///    ȣ��Ǵ� �Լ����� ���
class FunctionDependency {
  Function *function;
  std::vector<bool> return_dependency;
  SmallVector<FunctionArgumentDependency *, 8> arg_dependency;
  SmallVector<FunctionDependency *, 8> call_dependency;
  InstructionDependencyMap *insts_map = nullptr;
  InstructionDependency *return_instruction_dependency = nullptr;
  ArgumentInstructionDependencyMap *arg_map = nullptr;
  BranchManager *branch_manager;

public:
  FunctionDependency(Function *F)
    : function(F), return_dependency(F->arg_size()),
    arg_dependency(F->arg_size()) {
    branch_manager = new BranchManager(F);
    for (size_t i = 0; i < F->arg_size(); i++) {
      Argument *arg = F->arg_begin() + i;
      arg_dependency[i] = new FunctionArgumentDependency(arg, F->arg_size());
    }
  }

  ~FunctionDependency() {
    if (insts_map)
      delete insts_map;
    if (return_instruction_dependency)
      delete return_instruction_dependency;
    if (arg_map)
      delete arg_map;
    delete branch_manager;
  }

  Function *getFunction() { return function; }

  /// ��ȯ���� ������ ��ġ�� �Լ����ڸ� �˾ƺ� �� �ֽ��ϴ�.
  bool hasReturnDependency(int ix) { return return_dependency[ix]; }
  void setReturnDependency(int ix) { return_dependency[ix] = true; }

  /// � �Լ����ڰ� Ư�� �Լ����ڿ� ������ ��ġ���� �˾ƺ� �� �ֽ��ϴ�.
  FunctionArgumentDependency *getFunctionArgumentDependency(size_t i) {
    return arg_dependency[i];
  }

  void addFunctionDependency(FunctionDependency *FD) {
    call_dependency.push_back(FD);
  }
  size_t getFunctionDependencyNum() { return call_dependency.size(); }
  FunctionDependency *getFunctionDependency(size_t i) {
    return call_dependency[i];
  }

  /// annotated variables instruction dependency
  void setInstructionDependencyMap(InstructionDependencyMap *IDM) {
    insts_map = IDM;
  }
  InstructionDependencyMap *getInstrctionDependencyMap() { return insts_map; }

  /// return instruction dependency
  void setReturnInstructionDependency(InstructionDependency *ID) {
    return_instruction_dependency = ID;
  }
  InstructionDependency *getReturnInstructionDependency() {
    return return_instruction_dependency;
  }

  /// argument instruction dependency
  void
    setArgumentInstructionDependencyMap(ArgumentInstructionDependencyMap *AIDM) {
    arg_map = AIDM;
  }
  ArgumentInstructionDependencyMap *getArgumentInstructionDependencyMap() {
    return arg_map;
  }

  BranchManager *getBranchManager() { return branch_manager; }
};

class DependencyMap {
  using FunctionMap = std::map<Function *, FunctionDependency *>;
  FunctionMap function_map;

public:
  DependencyMap() : function_map() {}
  ~DependencyMap() {
    for (auto &fd : function_map)
      delete fd.second;
  }
  bool hasDependency(Function *F) {
    return function_map.find(F) != function_map.end();
  }
  FunctionDependency *getDependency(Function *F) { return function_map[F]; }
  void addDependency(Function *F, FunctionDependency *FD) {
    function_map[F] = FD;
  }
};

///---------------------------------------------------------
///
///          Dependency Check Routine
///
///---------------------------------------------------------

static DependencyMap *recursion_map;

class DependencyChecker {
public:
  static void run(FunctionDependency *FD, DependencyMap *DM) {
    if (FD->getFunction()->isIntrinsic())
      return;
    if (FD->getFunction()->empty()) {
#if IDC_PRINT_MSG_EMPTY_FUNCTION
      errs() << FD->getFunction()->getName() << " Function is not defined!\n";
#endif
#if IDC_EMPTY_FUNCTION_PARAM_AFFECT_RETURN
      for (size_t argc = 0; argc < FD->getFunction()->arg_size(); argc++)
        FD->setReturnDependency(argc);
#endif
      return;
    }

    /// � �Լ����ڰ� ��ȯ���� ������ ��ġ���� �˻��մϴ�.
    FunctionReturnDependencyChecker return_checker(FD, DM);

    /// � �Լ����ڰ� Ư�� �Լ����ڿ� ��ġ�� ������ �˻��մϴ�.
    FunctionArgumentDependencyCheck argument_checker(FD, DM);
  }

  class FunctionReturnDependencyChecker {
    Function *function;
    DependencyMap *dependency_map;
    FunctionDependency *function_dependency;
    InstructionDependency *inst_dependency; // used only checking overlapping
    std::vector<BlockNode *> block_nodes;

  public:
    FunctionReturnDependencyChecker(FunctionDependency *FD, DependencyMap *DM)
      : function_dependency(FD), dependency_map(DM) {
      function = function_dependency->getFunction();
      recursion_map->addDependency(function, nullptr);

      for (BasicBlock &basic_block : *function)
        for (Instruction &inst : basic_block)
          if (ReturnInst *ri = dyn_cast<ReturnInst>(&inst))

            // ��ȯ���� ���� �Լ��� ��� getReturnValue�� void(nullptr)�Դϴ�.
            //   ret void
            if (ri->getReturnValue()) {

              // ��ȯ�Ǵ� ������ �ݵ�� ReturnInst�� ���ľߵ˴ϴ�. ����
              // ReturnInst�� Operand�� ������ ��ġ�� �͵��� ���ʷ� �����մϴ�.
              // �� ������ �Լ� ���ο� ��� ReturnInst�� �����մϴ�.
              inst_dependency = new InstructionDependency();
              runBottomUp(ri->getReturnValue());
              delete inst_dependency;
            }
    }

  private:
    /// [����]
    /// � �Լ����ڰ� V�� ������ ��ġ���� �˻��մϴ�. �� ������
    /// ��������� ����˴ϴ�.
    void runBottomUp(Value *V, bool P = true) {
      if (Argument *arg = dyn_cast<Argument>(V)) {
        function_dependency->setReturnDependency(arg->getArgNo());
        return;
      }

      if (Instruction *inst = dyn_cast<Instruction>(V)) {
        if (inst_dependency->hasInstructoin(inst, P))
          return;

#if IDC_PRINT_INSTRUCTION
        errs() << "    (" << function->getName() << ")" << *inst << "\n";
#endif

        inst_dependency->addInstruction(inst, P);

        // PHINode�� ��Ÿ Instruction�� Operand�� �����ϴ� ����� �ٸ��ϴ�.
        // ���� �� ���� �и��Ͽ� �˻��Ͽ����ϴ�.
        // �ٸ� ���� ����� ���� Instruction�� ���⼭ Ư��ȭ �ؾ��մϴ�.
        if (PHINode *phi = dyn_cast<PHINode>(inst)) {
          for (unsigned i = 0; i < phi->getNumIncomingValues(); i++) {
            Value *target_value = phi->getIncomingValue(i);
            runBottomUp(target_value, P);
            runSearch(target_value, P);
          }
        }
        else if (CallInst *ci = dyn_cast<CallInst>(inst)) {

          // � �Լ����ڰ� ��ȯ���� ������ ��Ĩ�ϱ�?
          FunctionDependency *depends;
          if (!(depends = processCallInst(ci)))
            return;

          // ��ȯ���� ������ ��ġ�� ��� �Լ����ڵ��� V�� ������ ��ġ�� �˴ϴ�.
          for (size_t i = 0; i < ci->getCalledFunction()->arg_size(); i++)
            if (depends->hasReturnDependency(i) == true) {
              runBottomUp(ci->getOperand(i), P);
              runSearch(ci->getOperand(i), P);
            }

        }
        else {

          for (unsigned i = 0; i < inst->getNumOperands(); i++) {
            Value *target_value = inst->getOperand(i);
            runBottomUp(target_value, P);
            runSearch(target_value, P);
          }
        }

        processBranches(V);
      }
    }

    /// [����]
    /// CallInst�� ���� ȣ��� �Լ��� Dependency�� �����ɴϴ�.
    ///
    /// [����]
    /// - callinst�� ������ ��� ������ ���� �� ���� ������ �м��մϴ�.
    ///   1. ��ȯ���� ������ ��ġ�� �Լ����ڵ��� ���
    ///   2. ������ �Լ����ڿ� ������ ��ġ�� �Լ����ڵ��� ���
    /// - �� �Լ��� ������ �̸��� ���� �Լ��� ��� ���� ����� �����ϴ�.
    FunctionDependency *processCallInst(CallInst *CI) {
      FunctionDependency *depends = nullptr;
      Function *target_function = CI->getCalledFunction();

      if (dependency_map->hasDependency(target_function)) {
        depends = dependency_map->getDependency(target_function);
      }
      else {
        if (recursion_map->hasDependency(target_function))
          return nullptr;
        depends = new FunctionDependency(target_function);
        run(depends, dependency_map);
        dependency_map->addDependency(target_function, depends);
      }

      function_dependency->addFunctionDependency(depends);

      return depends;
    }

    /// [����]
    /// V�� ���� ��Ͽ� ������ ��ġ�� ����� ã���ϴ�.
    void processBranches(Value *V) {
#if IDC_SCAN_CONTROL_FLOW
      if (Instruction *inst = dyn_cast<Instruction>(V)) {
        BranchManager *bm = function_dependency->getBranchManager();
        BlockNode *this_node = bm->getNodeFromInstruction(inst);
        processBlock(this_node);
      }
#endif
    }

    void processBlock(BlockNode *BN) {
      bool is_perpect = BN->getFromNodes().size() == 1;
      for (BlockNode *bn : BN->getFromNodes()) {
        for (BlockNode *x : block_nodes)
          if (x == bn)
            return;
        block_nodes.push_back(bn);
        if (bn->getBranchInst()->isConditional()) {
          runBottomUp(bn->getBranchInst()->getCondition(), is_perpect);
          runSearch(bn->getBranchInst()->getCondition(), is_perpect);
        }
        processBlock(bn);
      }
    }

    /// [����]
    /// Node���󰡱⿡�� ã�����ϴ� Ư�� ������ Dependency�� �м��ϱ� ����
    /// �� ���� ������ �˻��մϴ�. �� �ܰ迡�� [����]��쿡���� Dependency��
    /// ������ �� Ȯ���� �� ���� �����ϴ�.
    ///
    /// [����]
    /// - ������� ������ ���� �� ���� ��쿡���� ������ ����� �� ������
    ///   Ȯ���߽��ϴ�.
    ///   1. StoreInst: StoreInst�� register�� ���� ���� ������ ����մϴ�.
    ///      ���� StoreInst�� Pointer�� ã������ ������ ��츦 Ȯ���մϴ�.
    ///   2. LoadInst: LoadInst�� Pointer�� ã������ ������ ���, LoadInst
    ///      �� ��ü�� �ش� ������ ����� �� �ֽ��ϴ�.
    ///   3. CallInst: ã������ ������ ������������ �Լ����ڷ� � �Լ���
    ///   �Ѱ�����
    ///      ��� �ش� �Լ��� �ٸ� �Լ����ڵ��� �� ������ ������ ��ĥ ��
    ///      �ֽ��ϴ�.
    void runSearch(Value *V, bool P = true) {
      for (BasicBlock &basic_block : *function)
        for (Instruction &inst : basic_block) {
          if (StoreInst *si = dyn_cast<StoreInst>(&inst)) {
            if (si->getPointerOperand() == V)
              runBottomUp(si->getValueOperand());
          }
          else if (CallInst *ci = dyn_cast<CallInst>(&inst)) {
            FunctionDependency *depends;
            if (!(depends = processCallInst(ci)))
              continue;
            for (size_t i = 0; i < depends->getFunction()->arg_size(); i++)
              if (depends->getFunctionArgumentDependency(i)->getArgument() == V)
                for (size_t j = 0; j < depends->getFunction()->arg_size(); j++)
                  if (depends->getFunctionArgumentDependency(i)
                    ->hasArgumentDependency(j))
                    runBottomUp(depends->getFunctionArgumentDependency(j)
                      ->getArgument(),
                      P);
          }
        }
      processBranches(V);
    }
  };

  class FunctionArgumentDependencyCheck {
    Function *function;
    DependencyMap *dependency_map;
    FunctionDependency *function_dependency;
    std::vector<Value *> overlap;
    std::vector<BlockNode *> block_nodes;

  public:
    FunctionArgumentDependencyCheck(FunctionDependency *FD, DependencyMap *DM)
      : function_dependency(FD), dependency_map(DM) {
      function = function_dependency->getFunction();
      recursion_map->addDependency(function, nullptr);

      for (Argument *arg = function->arg_begin(); arg != function->arg_end();
        arg++)
        if (arg->getType()->isPointerTy())
          for (Argument *arg2 = function->arg_begin();
            arg2 != function->arg_end(); arg2++)
            if (arg != arg2) {
              overlap.clear();
              runChecker(arg, arg2);
            }
    }

  private:
    FunctionDependency * processCallInst(CallInst *CI) {
      FunctionDependency *depends = nullptr;
      Function *target_function = CI->getCalledFunction();

      if (dependency_map->hasDependency(target_function)) {
        depends = dependency_map->getDependency(target_function);
      }
      else {
        if (recursion_map->hasDependency(target_function))
          return nullptr;
        depends = new FunctionDependency(target_function);
        run(depends, dependency_map);
        dependency_map->addDependency(target_function, depends);
      }

      function_dependency->addFunctionDependency(depends);

      return depends;
    }

    void processBlock(Argument *A, BlockNode *BN) {
      bool is_perpect = BN->getFromNodes().size() == 1;
      for (BlockNode *bn : BN->getFromNodes()) {
        for (BlockNode *x : block_nodes)
          if (x == bn)
            return;
        block_nodes.push_back(bn);
        if (bn->getBranchInst()->isConditional()) {
          runChecker(A, bn->getBranchInst()->getCondition(), is_perpect);
        }
        processBlock(A, bn);
      }
    }

    /// [����]
    /// �˻��Ϸ��� �Լ����� A�� ���� V�� �ִ��� ��������� �˻��մϴ�.
    /// �� �Լ��� runBottomUp�� runSearch�� ���� ���¸� �����ϴ�.
    ///
    /// [����]
    ///
    void runChecker(Argument *A, Value *V, bool P = true) {
      if (Argument *arg = dyn_cast<Argument>(V)) {
        function_dependency->getFunctionArgumentDependency(A->getArgNo())
          ->setArgumentDependency(arg->getArgNo());
        return;
      }

#if IDC_PRINT_INSTRUCTION
      errs() << "    (" << function->getName() << ")" << *V << "\n";
#endif

      // �� �Լ��� ������� ������ �����Ƿ� �ߺ��˻縦 �����մϴ�.
      if (std::find(overlap.begin(), overlap.end(), V) != overlap.end())
        return;
      overlap.push_back(V);

      // runSearch �˰���
      for (BasicBlock &basic_block : *function)
        for (Instruction &inst : basic_block) {
          if (StoreInst *si = dyn_cast<StoreInst>(&inst)) {
            if (si->getPointerOperand() == V)
              runChecker(A, si->getValueOperand(), P);
            else if (si->getValueOperand() == V)
              runChecker(A, si->getPointerOperand(), P);
          }
          else if (LoadInst *li = dyn_cast<LoadInst>(&inst)) {
            if (si->getPointerOperand() == V)
              runChecker(A, li, P);
          }
          else if (CallInst *ci = dyn_cast<CallInst>(&inst)) {
            FunctionDependency *depends;
            if (!(depends = processCallInst(ci)))
              continue;
            for (size_t i = 0; i < depends->getFunction()->arg_size(); i++)
              if (depends->getFunctionArgumentDependency(i)->getArgument() == V)
                for (size_t j = 0; j < depends->getFunction()->arg_size(); j++)
                  if (depends->getFunctionArgumentDependency(i)
                    ->hasArgumentDependency(j))
                    runChecker(A,
                      depends->getFunctionArgumentDependency(j)
                      ->getArgument(),
                      P);
          }
        }

      // runBottomUp �˰���
      if (Instruction *inst = dyn_cast<Instruction>(V)) {
#if IDC_SCAN_CONTROL_FLOW
        BranchManager *bm = function_dependency->getBranchManager();
        BlockNode *this_node = bm->getNodeFromInstruction(inst);
        processBlock(A, this_node);
#endif

        if (PHINode *phi = dyn_cast<PHINode>(inst)) {
          for (unsigned i = 0; i < phi->getNumIncomingValues(); i++) {
            Value *target_value = phi->getIncomingValue(i);
            runChecker(A, target_value, P);
          }
        }
        else if (CallInst *ci = dyn_cast<CallInst>(inst)) {
          FunctionDependency *depends;
          if (!(depends = processCallInst(ci)))
            return;
          for (size_t i = 0; i < ci->getCalledFunction()->arg_size(); i++)
            if (depends->hasReturnDependency(i) == true) {
              runChecker(A, ci->getOperand(i), P);
            }
        }
        else {
          for (unsigned i = 0; i < inst->getNumOperands(); i++) {
            Value *target_value = inst->getOperand(i);
            runChecker(A, target_value, P);
          }
        }
      }
    }
  };
};

/// This class must be called only once by each target-function.
class BottomUpDependencyChecker {
  Value *value;
  Function *function;
  DependencyMap *dependency_map;
  FunctionDependency *function_dependency;
  InstructionDependency *inst_dependency;
  std::vector<BlockNode *> block_nodes;

public:
  BottomUpDependencyChecker(Function *F, SmallVector<Value *, 16> V,
    DependencyMap *DM, FunctionDependency *FD,
    InstructionDependencyMap *IDM)
    : function(F), dependency_map(DM), function_dependency(FD) {
    for (Value *value : V) {
      this->value = value;
      inst_dependency = new InstructionDependency();
      runSearch(value, true, true);
      IDM->addDependency(value, inst_dependency);
      inst_dependency = nullptr;
    }
  }

private:
  void runBottomUp(Value *V, bool P = true) {
    if (Instruction *inst = dyn_cast<Instruction>(V)) {
      if (inst_dependency->hasInstructoin(inst, P))
        return;

#if IDC_PRINT_INSTRUCTION
      errs() << "    (" << function->getName() << ")" << *inst << "\n";
#endif

      DependencyDebugLocHelper::setDebugLoc(inst, this->value,
        P ? DependencyInstrInfo::Dominated
        : DependencyInstrInfo::Maybe);

      inst_dependency->addInstruction(inst, P);

      if (PHINode *phi = dyn_cast<PHINode>(inst)) {
        for (unsigned i = 0; i < phi->getNumIncomingValues(); i++) {
          Value *target_value = phi->getIncomingValue(i);
          runBottomUp(target_value, P);
          runSearch(target_value, P);
        }
      }
      else if (CallInst *ci = dyn_cast<CallInst>(inst)) {
        FunctionDependency *depends = processCallInst(ci);
        for (size_t i = 0; i < ci->getCalledFunction()->arg_size(); i++)
          if (depends->hasReturnDependency(i) == true) {
            runBottomUp(ci->getOperand(i), P);
            runSearch(ci->getOperand(i), P);
          }
      }
      else {
        for (unsigned i = 0; i < inst->getNumOperands(); i++) {
          Value *target_value = inst->getOperand(i);
          runBottomUp(target_value, P);
          runSearch(target_value, P);
        }
      }
      processBranches(V);
    }
  }

  FunctionDependency *processCallInst(CallInst *CI) {
    FunctionDependency *depends = nullptr;
    Function *target_function = CI->getCalledFunction();

    if (dependency_map->hasDependency(target_function)) {
      depends = dependency_map->getDependency(target_function);
    }
    else {
      depends = new FunctionDependency(target_function);
      DependencyChecker::run(depends, dependency_map);
      dependency_map->addDependency(target_function, depends);
    }

    function_dependency->addFunctionDependency(depends);

    return depends;
  }

  void processBranches(Value *V) {
#if IDC_SCAN_CONTROL_FLOW
    if (Instruction *inst = dyn_cast<Instruction>(V)) {
      BranchManager *bm = function_dependency->getBranchManager();
      BlockNode *this_node = bm->getNodeFromInstruction(inst);
      processBlock(this_node);
    }
#endif
  }

  void processBlock(BlockNode *BN) {
    bool is_perpect = BN->getFromNodes().size() == 1;
    for (BlockNode *bn : BN->getFromNodes()) {
      for (BlockNode *x : block_nodes)
        if (x == bn)
          return;
      block_nodes.push_back(bn);
      if (bn->getBranchInst()->isConditional()) {
        runBottomUp(bn->getBranchInst()->getCondition(), is_perpect);
        runSearch(bn->getBranchInst()->getCondition(), is_perpect);
      }
      processBlock(bn);
    }
  }

  void runSearch(Value *V, bool P = true, bool ROOT = false) {
    for (BasicBlock &basic_block : *function)
      for (Instruction &inst : basic_block) {
        if (StoreInst *si = dyn_cast<StoreInst>(&inst)) {
          if (si->getPointerOperand() == V) {
            if (ROOT) {
              if (Instruction *I = dyn_cast<Instruction>(si->getValueOperand()))
                DependencyDebugLocHelper::setDebugLoc(
                  I, V, DependencyInstrInfo::Annotated);
              runPerpectBottomUp(si->getValueOperand());
            }
            runBottomUp(si->getValueOperand(), P && ROOT);
            runSearch(si->getValueOperand(), P && ROOT);
          }
        }
        else if (CallInst *ci = dyn_cast<CallInst>(&inst)) {
          FunctionDependency *depends = processCallInst(ci);
          for (size_t i = 0; i < depends->getFunction()->arg_size(); i++)
            if (depends->getFunctionArgumentDependency(i)->getArgument() == V)
              for (size_t j = 0; j < depends->getFunction()->arg_size(); j++)
                if (depends->getFunctionArgumentDependency(i)
                  ->hasArgumentDependency(j)) {
                  runBottomUp(
                    depends->getFunctionArgumentDependency(j)->getArgument(),
                    P && ROOT);
                  runSearch(
                    depends->getFunctionArgumentDependency(j)->getArgument(),
                    P && ROOT);
                }
        }
      }
    processBranches(V);
  }

  void runPerpectBottomUp(Value *V) {
    if (Instruction *inst = dyn_cast<Instruction>(V)) {
      if (inst_dependency->hasInstructoin(inst, true))
        return;

      DependencyDebugLocHelper::setDebugLoc(inst, this->value,
        DependencyInstrInfo::Perpect);

      inst_dependency->addInstruction(inst, true);

      if (PHINode *phi = dyn_cast<PHINode>(inst)) {
        for (unsigned i = 0; i < phi->getNumIncomingValues(); i++) {
          Value *target_value = phi->getIncomingValue(i);
          runPerpectBottomUp(target_value);
        }
      }
      else if (CallInst *ci = dyn_cast<CallInst>(inst)) {
        FunctionDependency *depends = processCallInst(ci);
        for (size_t i = 0; i < ci->getCalledFunction()->arg_size(); i++)
          if (depends->hasReturnDependency(i) == true) {
            runPerpectBottomUp(ci->getOperand(i));
          }
      }
      else {
        for (unsigned i = 0; i < inst->getNumOperands(); i++) {
          Value *target_value = inst->getOperand(i);
          runPerpectBottomUp(target_value);
        }
      }
    }
  }
};

class DependencyManager {
public:
  using AnnotatedTuple = std::tuple<Value *, StringRef>;
  using AnnotatedVector = SmallVector<AnnotatedTuple, 8>;

private:
  DependencyMap * map;
  DependencyMap *annotated_map;
  Function *target_function;
  AnnotatedVector annotated_value;
  SmallVector<Value *, 16> annotated_target;

public:
  DependencyManager(Function *TargetFunction, DependencyMap *Map,
    DependencyMap *AnnotatedMap)
    : target_function(TargetFunction), map(Map), annotated_map(AnnotatedMap) {
    calAnnotatedValue();
  }

  void run() {
    FunctionDependency *fd = new FunctionDependency(target_function);
    InstructionDependencyMap *idm = new InstructionDependencyMap();

    recursion_map = new DependencyMap();
    BottomUpDependencyChecker checker(target_function, annotated_target, map,
      fd, idm);
    delete recursion_map;

    fd->setInstructionDependencyMap(idm);
    annotated_map->addDependency(target_function, fd);
  }

  AnnotatedVector &getAnnotatedVariableList() { return annotated_value; }

private:
  bool isAnnotated(Value *v) {
    for (AnnotatedTuple at : annotated_value) {
      if (std::get<0>(at) == v)
        return true;
    }
    return false;
  }

  /// get all annotated-variable in target-function
  void calAnnotatedValue() {
    std::vector<CallInst *> marker;
    for (BasicBlock &basic_block : *target_function)
      for (Instruction &inst : basic_block) {
        if (CallInst *ci = dyn_cast<CallInst>(&inst)) {

          // ??? �Լ������ͷ� �����Ǵ� ������ CalledFunction�� ���� ����
          //  %5 = tail call i32 bitcast (i32 (...)* @__CxxFrameHandler3 to i32
          //       (i8*, i8*, i8*, i8*, i8*)*)(i8* inreg %4, i8* %0, i8* %1, i8*
          //       %2, i8* %3)
          if (!ci->getCalledFunction()) {
            continue;
          }

          if (ci->getCalledFunction()->getName().contains(MARK_FUNCTION_NAME)) {
            annotated_value.push_back(AnnotatedTuple(
              ci->getOperand(0), ci->getCalledFunction()->getName()));
            annotated_target.push_back(
              ci->getOperand(0));

            marker.push_back(ci);
          }
        }
      }
    for (auto ci : marker)
      ci->eraseFromParent();
  }
};

class DependencyPrinter {
  Function *target_function;
  DependencyMap *annotated_map;
  std::string tab;

public:
  DependencyPrinter(DependencyMap *AnnotatedMap)
    : annotated_map(AnnotatedMap) {}

  void setTargetFunction(Function *F) { target_function = F; }

  void printTargetFunctionName() {
    out() << "Function - " << target_function->getName() << "\n";
  }

  void printTargetFunctionAnnotatedVariable(DependencyManager *DM) {
    DependencyManager::AnnotatedVector vec = DM->getAnnotatedVariableList();
    increaseTab();
    if (vec.size() == 0) {
      out() << "Annotated Variable is not found.\n\n";
      decreaseTab();
      return;
    }
    out() << "Annotated Variable List :\n";
    increaseTab();
    for (DependencyManager::AnnotatedTuple &tu : vec) {
      StringRef message = std::get<1>(tu);
      out() << "- Annotated : " << std::get<0>(tu)->getName()
        << "(message: " << message << ")\n";
    }
    out() << "\n";
    decreaseTab();
    decreaseTab();
  }

  void printTargetFunctionDependencyInstruction() {
    FunctionDependency *dependency =
      annotated_map->getDependency(target_function);
    InstructionDependencyMap *inst_map =
      dependency->getInstrctionDependencyMap();

    increaseTab();
    for (auto element : *inst_map) {
      out() << "Annotated-Variable : " << element.first->getName() << "\n";
      increaseTab();
      InstructionDependency *inst_dependency = element.second;
      for (auto inst : *inst_dependency) {
        out() << (inst.second ? "(Perpect)" : "(Maybe)") << *inst.first << "\n";
      }
      out() << "\n";
      decreaseTab();
    }
    decreaseTab();
  }

private:
  void increaseTab() { tab += "    "; }
  void decreaseTab() { tab.erase(0, 4); }

  raw_ostream &out() { return errs() << tab; }
};

#pragma endregion

class FaultInjectionTargetSelector {
  Function *target_function;
  std::vector<std::pair<Instruction *, int>> selected;

 public:
  FaultInjectionTargetSelector(Function *TargetFunction)
      : target_function(TargetFunction) {}

  void selectInstructions() {
    std::vector<CallInst *> marker;
    for (auto &bb : *target_function) {
      for (auto &inst : bb) {
        if (CallInst *call = dyn_cast<CallInst>(&inst)) {
          if (call->getCalledFunction()->getName().startswith(MARK_FUNCTION_NAME)) {
            auto target = cast<Instruction>(call->getOperand(0));
            selected.push_back({ target, 0 });
            std::list<User *> inst_uses;
            for (Value::user_iterator user_it = target->user_begin();
              user_it != target->user_end(); ++user_it) {
              User *user = *user_it;
              if (user != call) inst_uses.push_back(user);
            }
            for (std::list<User *>::iterator use_it = inst_uses.begin();
              use_it != inst_uses.end(); ++use_it) {
              if (!isa<PHINode>(*use_it)) {
                if (isa<StoreInst>(*use_it))
                  if (cast<StoreInst>(*use_it)->getPointerOperand() == target)
                    continue;
                if (!isa<LoadInst>(*use_it))
                  continue;
                selected.push_back({ cast<Instruction>(*use_it),-1 });
                errs() << "SELECT : " << *cast<Instruction>(*use_it) << '\n';
              }
            }
            marker.push_back(call);
          }
        }
      }
    }
    //for (auto ci : marker)
    //  ci->eraseFromParent();
  }

  std::vector<std::pair<Instruction *, int>> getSelectedInsts() {
    return selected;
  }

};

///---------------------------------------------------------
///
///               LLVM Fault Injection Pass
///
///---------------------------------------------------------

struct LLVMFaultInjectionPass : public ModulePass {
  static char ID;

  LLVMFaultInjectionPass() : ModulePass(ID) {
    dependency_map = new DependencyMap();
    annotated_map = new DependencyMap();
  }

  ~LLVMFaultInjectionPass() {}

  bool runOnModule(Module &M) override {
    if (!M.getFunction("main")) {
      errs() << "Error: main function not found.";
      exit(1);
    }

    std::mt19937 rng;
    rng.seed(std::random_device()());

    for (Module::iterator m_it = M.begin(); m_it != M.end();
         ++m_it) {
      //FaultInjectionTargetSelector selector(&*m_it);
      //selector.selectInstructions();
      //if (selector.getSelectedInsts().size() == 0) continue;

      DependencyManager *dm =
        new DependencyManager(&*m_it, dependency_map, annotated_map);
      mgr = new DependencyInstrInfoManager();
      dm->run();
      if (dm->getAnnotatedVariableList().size() == 0) continue;
      function_map[&*m_it] = dm;

#if IDC_PRINT_RESULT
      print(&*m_it);
#endif

      std::vector<Instruction *> selector;
      
      for (auto DI : *mgr)
      {
        auto inst = DI->getInstruction();
        if (isa<StoreInst>(inst))
          if (cast<StoreInst>(inst)->getPointerOperand() == inst)
            continue;
        if (!isa<LoadInst>(inst))
          continue;
        //if (!cast<LoadInst>(inst)->getType()->isIntegerTy())
        //  continue;
        selector.push_back(inst);
      }

      std::uniform_int_distribution<std::mt19937::result_type> dist(0, selector.size() - 1);
      auto selected = selector[dist(rng)];

      errs() << "SELECTED: " << *selected << "\r\n";

      FaultInjectionInsertMachine::insertSelectFaultInjectionTarget(M, *m_it, selected);

      delete mgr;
      break;
    }

    return true;
  }

  DependencyMap *dependency_map;
  DependencyMap *annotated_map;
  std::map<Function *, DependencyManager *> function_map;

  void print(Function *F) {
#if IDC_PRINT_NONCONDITIONAL
    if (function_map[F]->getAnnotatedVariableList().size() == 0)
      return;
#endif
    DependencyPrinter printer(annotated_map);
    printer.setTargetFunction(F);

    printer.printTargetFunctionName();
    printer.printTargetFunctionAnnotatedVariable(function_map[F]);
    printer.printTargetFunctionDependencyInstruction();
  }

};

}  // namespace

char LLVMFaultInjectionPass::ID = 0;

static RegisterPass<LLVMFaultInjectionPass> X("faultinject",
                                              "Fault Injection Pass",
                                              false /* Only looks at CFG */,
                                              false /* Analysis Pass */);