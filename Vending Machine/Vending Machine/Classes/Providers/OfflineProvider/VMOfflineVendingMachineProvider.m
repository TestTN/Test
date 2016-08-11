//
//  VMOfflineVendingMachineProvider.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMOfflineVendingMachineProvider.h"
#import "VMVendingMachineModel.h"
#import "VMPurseModel.h"
#import "VMStockModel.h"
#import "VMCoinModel.h"

@implementation VMOfflineVendingMachineProvider

+ (instancetype)sharedProvider
{
    static VMOfflineVendingMachineProvider * _sharedProvider = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedProvider = [[VMOfflineVendingMachineProvider alloc] init];
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
    return @[@(100), @(100), @(100), @(100)];
}

- (NSMutableArray *)products
{
    NSMutableArray *array = NSMutableArray.array;
    
    VMProductModel *itemTea = VMProductModel.make;
    itemTea.value = 13;
    itemTea.objId = kVMProductIdentifierTea;
    itemTea.title = @"Чай";
    [array addObject:itemTea];

    VMProductModel *itemCoffee = VMProductModel.make;
    itemCoffee.value = 18;
    itemCoffee.objId = kVMProductIdentifierCoffee;
    itemCoffee.title = @"Кофе";
    [array addObject:itemCoffee];

    VMProductModel *itemCoffeeWithMilk = [VMProductModel make];
    itemCoffeeWithMilk.value = 21;
    itemCoffeeWithMilk.objId = kVMProductIdentifierCoffeeWithMilk;
    itemCoffeeWithMilk.title = @"Кофе с молоком";
    [array addObject:itemCoffeeWithMilk];

    VMProductModel *itemJuice = [VMProductModel make];
    itemJuice.value = 35;
    itemJuice.objId = kVMProductIdentifierJuice;
    itemJuice.title = @"Сок";
    [array addObject:itemJuice];
    
    return array;
}


- (NSArray *)productsCount
{
    return @[@(10), @(20), @(20), @(15)];
}


- (VMVendingMachineModel *)getVendingMachine
{
    VMVendingMachineModel *model = VMVendingMachineModel.make;

    
    NSMutableArray *coins = self.coins;
    NSArray * coinsCount = self.coinsCount;

    VMPurseModel *purse = VMPurseModel.make;
    [purse setItems:coins];
    
    for (NSInteger i = 0; i < coins.count; i++)
        [purse addItem:coins[i] withCount:[coinsCount[i] integerValue]];
    
    
    NSMutableArray *products = self.products;
    NSArray * productsCount = self.productsCount;
    
    VMStockModel *stock = VMStockModel.make;
    [stock setItems:products];
    
    for (NSInteger i = 0; i < products.count; i++)
        [stock addItem:products[i] withCount:[productsCount[i] integerValue]];

    [model addPurse:purse];
    [model addStock:stock];

    return model;
}

@end
