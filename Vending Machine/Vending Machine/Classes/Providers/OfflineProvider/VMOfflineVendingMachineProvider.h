//
//  VMOfflineVendingMachineProvider.h
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMBaseProvider.h"

@class VMVendingMachineModel;

@interface VMOfflineVendingMachineProvider : VMBaseProvider

- (VMVendingMachineModel *)getVendingMachine;

@end
