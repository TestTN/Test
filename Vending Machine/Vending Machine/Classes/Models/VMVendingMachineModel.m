//
//  VMVendingMachine.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMVendingMachineModel.h"
#import "VMStockModel.h"
#import "VMPurseModel.h"
#import "VMCoinModel.h"

@interface VMVendingMachineModel ()


@end
@implementation VMVendingMachineModel



- (void)addPurse:(VMPurseModel *)purse
{
    _purse = purse;
}

- (void)addStock:(VMStockModel *)stock
{
    _stock = stock;
}


- (VMVendingMachineStatus)addCoin:(VMCoinModel *)coin
{
    if ([_purse canAddItem:coin]) {
        _depositeAmount += coin.value;
        [_purse addItem:coin withCount:1];
        
        return kVMVendingMachineStatusSuccess;
     }
    
    return kVMVendingMachineStatusFail;
}

- (VMVendingMachineStatus)buyProduct:(VMProductModel *)product
{
    if ([_stock haveItem:product withCount:1]) {
        if (product.value <= _depositeAmount) {
            [_stock deleteItem:product withCount:1];
            _depositeAmount -= product.value;
            return kVMVendingMachineStatusSuccess;
        }
        return kVMVendingMachineStatusNoMoney;

    }
    
    return kVMVendingMachineStatusNoProduct;
}

- (VMPurseModel *)getChange
{
    VMPurseModel *purseWithChange = VMPurseModel.make;
    double deposite = _depositeAmount;
    
    [purseWithChange setItems:[NSMutableArray arrayWithArray:_purse.getAllItems]];
    NSArray *coins = [purseWithChange.getAllItems sortedArrayUsingComparator:^NSComparisonResult(VMCoinModel *a, VMCoinModel *b) {
        return [@(b.value) compare:@(a.value)];
    }];
    
    
    for (VMCoinModel *coin in coins) {
        if (deposite == 0)
            break;
        
        NSInteger count = deposite / coin.value;
        NSInteger countInPurse = [_purse getCountForItem:coin];
        
        NSInteger resultCount = (countInPurse > count) ? count : countInPurse;
        deposite -= resultCount * coin.value;
        [purseWithChange addItem:coin withCount:resultCount];
    }
    
    if (deposite)
        return nil;
    
    for (VMCoinModel *coin in purseWithChange.getAllItems) {
        NSInteger count = [purseWithChange getCountForItem:coin];
        [_purse deleteItem:coin withCount:count];
    }
    
    _depositeAmount = 0;

    
    return purseWithChange;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.stock forKey:VM_F_STOCK];
    [encoder encodeObject:self.purse forKey:VM_F_PURSE];
    [encoder encodeObject:@(self.depositeAmount) forKey:VM_F_DEPOSITE_AMOUNT];

}


- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super initWithCoder:decoder])) {
        self->_stock = [decoder decodeObjectForKey:VM_F_STOCK];
        self->_purse = [decoder decodeObjectForKey:VM_F_PURSE];
        self->_depositeAmount = [[decoder decodeObjectForKey:VM_F_DEPOSITE_AMOUNT] doubleValue];
    }
    return self;
}


@end
