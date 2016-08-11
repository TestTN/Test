//
//  VMUtil.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMUtil.h"

@implementation VMUtil

+ (NSString *)wordPluralForValue:(double)aValue
                         oneForm:(NSString *)aOneForm
            twoThreeFourFormForm:(NSString *)aTwoThreeFourForm
                        manyForm:(NSString *)aManyForm
{
    aValue = fabs(aValue);
    
    if ((double)aValue != (NSInteger)aValue)
        return aTwoThreeFourForm;
    
    int intValue = (int) (aValue - (floor(aValue / 100) * 100));
    int lastDigit = intValue % 10;
    
    if ((intValue < 10 || intValue > 20) && lastDigit == 1)
        return aOneForm;
    else if ((intValue < 10 || intValue > 20) && (lastDigit < 5) && lastDigit != 0)
        return aTwoThreeFourForm;
    return aManyForm;
}



@end
