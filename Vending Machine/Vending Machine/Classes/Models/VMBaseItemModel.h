//
//  VMBaseValueCountModel.h
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 10/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMBaseModel.h"

@interface VMBaseItemModel : VMBaseModel

@property (nonatomic, assign) double value;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) NSInteger objId;


@end
