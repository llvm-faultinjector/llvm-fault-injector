//===----------------------------------------------------------------------===//
//
//                LLVM Register Level Dominate Checker for X86
//
//===----------------------------------------------------------------------===//
//
//  Copyright (C) 2019. rollrat. All Rights Reserved.
//
//===----------------------------------------------------------------------===//

#ifndef ROLLRAT_REGISTER_LEVEL_DOM_H
#define ROLLRAT_REGISTER_LEVEL_DOM_H

#include <vector>
#include <map>
#include "llvm/CodeGen/MachineFunction.h"

namespace llvm {

typedef enum class _sign_ {
    None,
    Gen,
    Kill,
    Dead,
}   RegisterLevelSign;

class InstructionRegisterInfo {
public:
    using child_type = std::vector<std::pair<unsigned, RegisterLevelSign>>;
    using return_type = std::vector<unsigned>;
private:
    child_type ChildInfo;
public:
    return_type getRegisters(RegisterLevelSign sign) const {
        return_type result;
        for (auto e : ChildInfo) {
            if (e.second == sign)
                result.push_back(e.first); 
        }
        return result;
    }

    return_type getGenRegisters() const {
        return getRegisters(RegisterLevelSign::Gen);
    }

    return_type getKillRegisters() const {
        return getRegisters(RegisterLevelSign::Kill);
    }

    return_type getDeadRegisters() const {
        return getRegisters(RegisterLevelSign::Dead);
    }
};

class BasicBlockRegisterInfo {
public:
    using child_type = std::map<MachineInstr *, InstructionRegisterInfo *>;
private:
    child_type ChildInfo;
public:
    child_type& childs() { return ChildInfo; }
};

class FunctionRegisterInfo {
public:
    using child_type = std::map<MachineBasicBlock *, BasicBlockRegisterInfo *>;
private:
    child_type ChildInfo;
public:
    child_type& childs() { return ChildInfo; }
};

class RegisterLevelDom {
public:
    RegisterLevelDom(MachineFunction& MF);

private:
    std::vector<MachineInstr *> FindFInstrs(MachineFunction& MF);
    FunctionRegisterInfo *BuildRegisterInfo(MachineFunction& MF); 
};

}

#endif