//===----------------------------------------------------------------------===//
//
//                            Inject Fault
//
//===----------------------------------------------------------------------===//
//
//  Copyright (C) 2019. rollrat. All Rights Reserved.
//
//===----------------------------------------------------------------------===//

#ifndef _INJECT_FAULT_
#define _INJECT_FAULT_

namespace llvm {

  std::string getInformation(int index);

  FunctionPass *createInjectFaultProcPass();

}
#endif