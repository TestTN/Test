//
//  VMStockInfoView.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMStockInfoView.h"
#import "VMStockModel.h"
#import "VMProductModel.h"

@implementation VMStockInfoView
{
    VMStockModel *_stockModel;
}

#pragma mark - Setter

- (void)setStock:(VMStockModel *)stock
{
    _stockModel = stock;
    [self reloadData];
}


- (void)reloadData
{
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.alignment                = NSTextAlignmentCenter;

    NSMutableAttributedString *attributedString = NSMutableAttributedString.new ;
    NSDictionary *infoAttributes = @{NSFontAttributeName: [UIFont vmLightFontWithSize:12], NSParagraphStyleAttributeName : paragraphStyle};
    
    NSArray *array = _stockModel.getAllItems;
    NSInteger i = 0;
    for (VMProductModel *product in array) {
        if (i != 0)
            [attributedString appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n" attributes:infoAttributes]];
        NSInteger count = [_stockModel getCountForItem:product];
        NSString *portion = [VMUtil wordPluralForValue:count oneForm:VM_T_PORTION_ONE twoThreeFourFormForm:VM_T_PORTION_TWO manyForm:VM_T_PORTION_MANY];
        
        NSString *string = [NSString stringWithFormat:VM_T_STOCK_INFO_PATTERN, product.title, @(product.value) ,@(count), portion];
        [attributedString appendAttributedString:[[NSAttributedString alloc]initWithString:string attributes:infoAttributes]];
        i++;
    }
    
    self.attributedText = attributedString;
}
@end
