//
//  VMViewProtocols.h
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VMPurseModel;
@class VMStockModel;

@protocol VMDepositeInfoViewProtocol <NSObject>

- (void)setValue:(double)value;

@end


@protocol VMPurseInfoViewProtocol <NSObject>

- (void)setPurse:(VMPurseModel *)purse withTitle:(NSString *)title;

@end


@protocol VMStockInfoViewProtocol <NSObject>

- (void)setStock:(VMStockModel *)stock;

@end


@protocol VMCoinsPanelViewProtocol <NSObject>

- (void)setPurse:(VMPurseModel *)purse;

@end


@protocol VMStockPanelViewProtocol <NSObject>

- (void)setStock:(VMStockModel *)stock;

@end


@protocol VMControlPanelViewProtocol <NSObject>

@end



