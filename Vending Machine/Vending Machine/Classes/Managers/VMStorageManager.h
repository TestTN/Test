//
//  VMStorageManager.h
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import <Foundation/Foundation.h>
@class VMPurseModel;
@class VMVendingMachineModel;

@interface VMStorageManager : NSObject

+ (VMStorageManager *)sharedManager;

- (VMPurseModel *)getUserPurse;
- (VMVendingMachineModel *)getVendingMachine;

- (void)saveUserPurse:(VMPurseModel *)purse;
- (void)saveVendingMachine:(VMVendingMachineModel *)vendingMachineModel;
@end
