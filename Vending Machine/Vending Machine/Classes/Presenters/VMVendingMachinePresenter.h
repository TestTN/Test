//
//  VMVendingMachinePresenter.h
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMPresenterProtocols.h"
#import "VMViewProtocols.h"

@protocol VMDepositeInfoViewProtocol;
@protocol VMPurseInfoViewProtocol;
@protocol VMStockInfoViewProtocol;
@protocol VMCoinsPanelViewProtocol;
@protocol VMStockPanelViewProtocol;
@protocol VMControlPanelViewProtocol;

@interface VMVendingMachinePresenter : NSObject <VMVendingMachinePresenterProtocol>

+ (instancetype)make;

@property (nonatomic, weak) id <VMDepositeInfoViewProtocol> depositeInfoView;
@property (nonatomic, weak) id <VMPurseInfoViewProtocol> purseInfoView;
@property (nonatomic, weak) id <VMPurseInfoViewProtocol> vmPurseInfoView;
@property (nonatomic, weak) id <VMStockInfoViewProtocol> stockInfoView;
@property (nonatomic, weak) id <VMCoinsPanelViewProtocol> coinsPanelView;
@property (nonatomic, weak) id <VMStockPanelViewProtocol> stockPanelView;
@property (nonatomic, weak) id <VMControlPanelViewProtocol> controlPanelView;
@property (nonatomic, weak) UIViewController *viewController;


- (void)reloadData;

@end






