//===----------------------------------------------------------------------===//
//
//                LLVM Register Level Dominate Checker for X86
//
//===----------------------------------------------------------------------===//
//
//  Copyright (C) 2019. rollrat. All Rights Reserved.
//
//===----------------------------------------------------------------------===//

#include "RegisterLevelDom.h"
#include "llvm/Transforms/Utils/InjectFault.h"

using namespace llvm;

RegisterLevelDom::RegisterLevelDom(MachineFunction& MF) {
    auto target = FindFInstrs(MF);
    

}

std::vector<MachineInstr *> RegisterLevelDom::FindFInstrs(MachineFunction& MF) {
    std::vector<MachineInstr *> result;
    for (auto bb = MF.begin(); bb != MF.end(); bb++) {
        for (auto inst = bb->begin(); inst != bb->end(); inst++) {
            if (inst->getDebugLoc()) {
                result.push_back(&*inst);
            }
        }
    }
    return result;
}