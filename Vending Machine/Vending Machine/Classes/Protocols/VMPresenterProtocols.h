//
//  VMPresenterProtocols.h
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import <Foundation/Foundation.h>
@class VMCoinModel;
@class VMProductModel;

@protocol VMVendingMachinePresenterProtocol <NSObject>

- (void)addCoin:(VMCoinModel *)coin;
- (void)buyProduct:(VMProductModel *)product;

- (void)giveChange;

- (void)setSettingsToDefault;
@end
