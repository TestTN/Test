//
//  VMBaseValueCountModel.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 10/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMBaseItemModel.h"

@implementation VMBaseItemModel


#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];
    
    [encoder encodeObject:@(self.value) forKey:VM_F_VALUE];
    [encoder encodeObject:self.title forKey:VM_F_TITLE];
    [encoder encodeObject:@(self.objId) forKey:VM_F_ID];

}


- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super initWithCoder:decoder])) {
        self.value = [[decoder decodeObjectForKey:VM_F_VALUE] doubleValue];
        self.title = [decoder decodeObjectForKey:VM_F_TITLE];
        self.objId = [[decoder decodeObjectForKey:VM_F_ID] integerValue];
    }
    return self;
}

@end
