//
//  VMUtil.h
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, VMCoinIdentifier) {
    kVMCoinIdentifierNone,
    kVMCoinIdentifierOne = 1,
    kVMCoinIdentifierTwo = 2,
    kVMCoinIdentifierFive = 5,
    kVMCoinIdentifierTen = 10
};

typedef NS_ENUM(NSUInteger, VMProductIdentifier) {
    kVMProductIdentifierNone,
    kVMProductIdentifierTea,
    kVMProductIdentifierCoffee,
    kVMProductIdentifierCoffeeWithMilk,
    kVMProductIdentifierJuice
};

typedef NS_ENUM(NSUInteger, VMVendingMachineStatus) {
    kVMVendingMachineStatusNone,
    kVMVendingMachineStatusNoProduct,
    kVMVendingMachineStatusNoMoney,
    kVMVendingMachineStatusSuccess,
    kVMVendingMachineStatusFail
};



@interface VMUtil : NSObject

+ (NSString *)wordPluralForValue:(double)aValue
                         oneForm:(NSString *)aOneForm
            twoThreeFourFormForm:(NSString *)aTwoThreeFourForm
                        manyForm:(NSString *)aManyForm;

@end
