//
//  VMOfflineUserPurseProvider.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMOfflineUserPurseProvider.h"
#import "VMPurseModel.h"
#import "VMCoinModel.h"

@implementation VMOfflineUserPurseProvider

+ (instancetype)sharedProvider
{
    static VMOfflineUserPurseProvider * _sharedProvider = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedProvider = [[VMOfflineUserPurseProvider alloc] init];
    });
    
    return _sharedProvider;
}

- (NSMutableArray *)coins
{
    NSMutableArray *array = NSMutableArray.array;
    
    VMCoinModel *coinOne = VMCoinModel.make;
    coinOne.value = 1;
    coinOne.objId = kVMCoinIdentifierOne;
    coinOne.title = @"1 руб.";
    [array addObject:coinOne];
    
    VMCoinModel *coinTwo = VMCoinModel.make;
    coinTwo.value = 2;
    coinTwo.objId = kVMCoinIdentifierTwo;
    coinTwo.title = @"2 руб.";
    [array addObject:coinTwo];

    VMCoinModel *coinFive = VMCoinModel.make;
    coinFive.value = 5;
    coinFive.objId = kVMCoinIdentifierFive;
    coinFive.title = @"5 руб.";
    [array addObject:coinFive];
    
    VMCoinModel *coinTen = VMCoinModel.make;
    coinTen.value = 10;
    coinTen.objId = kVMCoinIdentifierTen;
    coinTen.title = @"10 руб.";
    [array addObject:coinTen];
    
    return array;
}

- (NSArray *)coinsCount
{
    return @[@(10), @(30), @(20), @(15)];
}


- (VMPurseModel *)getUserPurse
{
    VMPurseModel *model = VMPurseModel.make;
    NSMutableArray *coins = self.coins;
    NSArray *coinsCount = self.coinsCount;

    [model setItems:coins];
    
    for (NSInteger i = 0; i < coins.count; i++)
        [model addItem:coins[i] withCount:[coinsCount[i] integerValue]];
    
    
    return model;
}


@end

