//
//  VMVendingMachinePresenter.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMVendingMachinePresenter.h"
#import "VMPurseModel.h"
#import "VMVendingMachineModel.h"
#import "VMStorageManager.h"
#import "VMCoinModel.h"

@interface VMVendingMachinePresenter ()
- (VMPurseModel *)userPurse;
- (VMVendingMachineModel *)vendingMachine;
@end

@implementation VMVendingMachinePresenter
{
    VMPurseModel *_userPurse;
    VMVendingMachineModel *_vendingMachine;
}


+ (instancetype)make
{
    VMVendingMachinePresenter *presenter = VMVendingMachinePresenter.new;
    return presenter;
}


#pragma mark - Getters

- (VMPurseModel *)userPurse
{
    if (_userPurse)
        return _userPurse;
    
    VMPurseModel *model = [[VMStorageManager sharedManager] getUserPurse];
    _userPurse = model;
    return _userPurse;
}


- (VMVendingMachineModel *)vendingMachine
{
    if (_vendingMachine)
        return _vendingMachine;
    
    VMVendingMachineModel *model = [[VMStorageManager sharedManager] getVendingMachine];
    _vendingMachine = model;
    return _vendingMachine;
}


- (void)reloadData
{
    [_depositeInfoView setValue:self.vendingMachine.depositeAmount];
    
    [_purseInfoView setPurse:self.userPurse withTitle:VM_T_USER];
    [_vmPurseInfoView setPurse:self.vendingMachine.purse withTitle:VM_T_VENDING_MACHINE];

    [_stockInfoView setStock:self.vendingMachine.stock];
    
    [_coinsPanelView setPurse:self.userPurse];
    [_stockPanelView setStock:self.vendingMachine.stock];
    
    [self saveState];
}


- (void)saveState
{
    [[VMStorageManager sharedManager] saveUserPurse:_userPurse];
    [[VMStorageManager sharedManager] saveVendingMachine:_vendingMachine];
}

#pragma mark - VMVendingMachinePresenterProtocol

- (void)addCoin:(VMCoinModel *)coin
{
    if (![_userPurse haveItem:coin withCount:1])
        return;
    
    VMVendingMachineStatus status = [_vendingMachine addCoin:coin];
    
    if (status == kVMVendingMachineStatusSuccess)
        [_userPurse deleteItem:coin withCount:1];
    
    [self reloadData];
}

- (void)buyProduct:(VMProductModel *)product
{
    VMVendingMachineStatus status = [_vendingMachine buyProduct:product];
    
    NSString *message = VM_M_EMPTY;
    switch (status) {
        case kVMVendingMachineStatusSuccess:
            message = VM_M_THANK;
            break;
            
        case kVMVendingMachineStatusNoMoney:
            message = VM_M_NO_MONEY;
            break;
            
        case kVMVendingMachineStatusNoProduct:
            message = VM_M_NO_PRODUCT;
            break;

            
        default:
            break;
    }
    
    [self showMessage:message];
    
    [self reloadData];
}



- (void)giveChange
{
    VMPurseModel *purseWithChange = [_vendingMachine getChange];
    
    if (!purseWithChange) {
        [self showMessage:VM_M_NO_CHANGE];
        return;
    }
    
    for (VMCoinModel *coin in purseWithChange.getAllItems) {
        NSInteger count = [purseWithChange getCountForItem:coin];
        [_userPurse addItem:coin withCount:count];
    }
    
    [self reloadData];
}


- (void)setSettingsToDefault
{
    _userPurse = nil;
    _vendingMachine = nil;
    
    [[VMStorageManager sharedManager] saveUserPurse:nil];
    [[VMStorageManager sharedManager] saveVendingMachine:nil];
    
    [self reloadData];
}

- (void)showMessage:(NSString *)message
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:VM_M_EMPTY message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * action = [UIAlertAction actionWithTitle:VM_M_OK style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertVC addAction:action];
    [_viewController presentViewController:alertVC animated:YES completion:^{
        
    }];
    
}


@end
