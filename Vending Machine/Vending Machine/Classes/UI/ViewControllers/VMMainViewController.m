//
//  ViewController.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 10/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMMainViewController.h"
#import "VMDepositeInfoView.h"
#import "VMPurseInfoView.h"
#import "VMStockInfoView.h"
#import "VMCoinsPanelView.h"
#import "VMStockPanelView.h"
#import "VMVendingMachinePresenter.h"
#import "VMControlPanelView.h"

@interface VMMainViewController ()
{
    IBOutlet VMDepositeInfoView *_depositeInfoView;
    
    IBOutlet VMPurseInfoView *_userPurseInfoView;
    IBOutlet VMPurseInfoView *_vmPurseInfoView;
    
    IBOutlet VMStockInfoView *_stockInfoView;
    
    IBOutlet VMCoinsPanelView *_coinsPanelView;
    IBOutlet VMStockPanelView *_stockPanelView;
 
    IBOutlet VMControlPanelView *_controlPanelView;
    
    VMVendingMachinePresenter *_presenter;
}
@end

@implementation VMMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}

- (void)setup
{
    _presenter = [VMVendingMachinePresenter make];
    
    _depositeInfoView.presenter = _presenter;
    _vmPurseInfoView.presenter = _presenter;
    _stockInfoView.presenter = _presenter;
    _coinsPanelView.presenter = _presenter;
    _stockPanelView.presenter = _presenter;
    _controlPanelView.presenter = _presenter;

    _presenter.depositeInfoView = _depositeInfoView;
    _presenter.purseInfoView = _userPurseInfoView;
    _presenter.vmPurseInfoView = _vmPurseInfoView;
    
    _presenter.stockInfoView = _stockInfoView;
    
    _presenter.coinsPanelView = _coinsPanelView;
    _presenter.stockPanelView = _stockPanelView;
    _presenter.controlPanelView = _controlPanelView;
    _presenter.viewController = self;
    
    [_presenter reloadData];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}
@end
