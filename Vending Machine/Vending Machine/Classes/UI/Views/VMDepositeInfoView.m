//
//  VMDepositeInfoView.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMDepositeInfoView.h"
#import "VMPresenterProtocols.h"

@implementation VMDepositeInfoView
{
    IBOutlet UILabel *_titleLabel;
    IBOutlet UILabel *_descriptionLabel;

    double _value;
}


- (void)setValue:(double)value
{
    _value = value;
    
    [self reloadData];
}

- (void)reloadData
{
    _descriptionLabel.text = @(_value).stringValue;
}

@end
