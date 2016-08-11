//
//  VMVendingMachine.h
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMBaseModel.h"

@class VMCoinModel;
@class VMPurseModel;
@class VMStockModel;
@class VMProductModel;

@interface VMVendingMachineModel : VMBaseModel

@property (nonatomic, strong, readonly) VMPurseModel *purse;
@property (nonatomic, assign, readonly) double depositeAmount;
@property (nonatomic, strong, readonly) VMStockModel *stock;

- (void)addPurse:(VMPurseModel *)purse;
- (void)addStock:(VMStockModel *)stock;


- (VMVendingMachineStatus)addCoin:(VMCoinModel *)coin;
- (VMVendingMachineStatus)buyProduct:(VMProductModel *)product;
- (VMPurseModel *)getChange;
@end
