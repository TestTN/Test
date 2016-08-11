//
//  UIFont+VM.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "UIFont+VM.h"

@implementation UIFont (VM)

+ (UIFont *)vmFontWithSize:(double)size
{
    return [UIFont fontWithName:@"HelveticaNeue" size:size];
}

+ (UIFont *)vmBoldFontWithSize:(double)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:size];
}

+ (UIFont *)vmLightFontWithSize:(double)size
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}

@end
