//
//  VMBaseModel.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMBaseModel.h"

@implementation VMBaseModel

+ (instancetype)make
{
    VMBaseModel *model = self.new;
    return model;
}


#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super init])) {
    }
    return self;
}

@end
