//
//  VMStockInfoView.h
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMViewProtocols.h"

@class VMStockModel;
@protocol VMVendingMachinePresenterProtocol;

@interface VMStockInfoView : UILabel <VMStockInfoViewProtocol>

@property (nonatomic, weak) id <VMVendingMachinePresenterProtocol> presenter;

- (void)setStock:(VMStockModel *)stock;

@end

