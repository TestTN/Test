//
//  VMPurseView.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMPurseInfoView.h"
#import "VMPurseModel.h"
#import "VMCoinModel.h"
@implementation VMPurseInfoView
{
    VMPurseModel *_purse;
    NSString *_title;
}

#pragma mark - Setter

- (void)setPurse:(VMPurseModel *)purse withTitle:(NSString *)title
{
    _title = title;
    _purse = purse;
    
    [self reloadData];
}


- (void)reloadData
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    NSDictionary *titleAttributes = @{NSFontAttributeName:[UIFont vmFontWithSize:14]};
    NSDictionary *infoAttributes = @{NSFontAttributeName: [UIFont vmLightFontWithSize:12]};

    [attributedString appendAttributedString:[[NSAttributedString alloc]initWithString:_title attributes:titleAttributes]];

    NSArray *array = _purse.getAllItems;
    for (VMCoinModel *coin in array) {
        [attributedString appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n" attributes:infoAttributes]];
        NSInteger count = [_purse getCountForItem:coin];
        NSString *string = [NSString stringWithFormat:VM_T_PURSE_INFO_PATTERN, coin.title, @(count)];
        [attributedString appendAttributedString:[[NSAttributedString alloc]initWithString:string attributes:infoAttributes]];
    }
    
    self.attributedText = attributedString;
}


@end
