//
//  VMStorageManager.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMStorageManager.h"
#import "VMPurseModel.h"
#import "VMVendingMachineModel.h"
#import "VMOfflineUserPurseProvider.h"
#import "VMOfflineVendingMachineProvider.h"


@implementation VMStorageManager

+ (VMStorageManager *)sharedManager
{
    static VMStorageManager * _shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[VMStorageManager alloc] init];
    });
    
    return _shared;
}


- (VMPurseModel *)getUserPurse
{
    NSData *data = [self getDataFromStorageWithKey:VM_F_PURSE];
    if (data) {
        VMPurseModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        return model;
    }
    return [[VMOfflineUserPurseProvider sharedProvider] getUserPurse];
}

- (VMVendingMachineModel *)getVendingMachine
{
    NSData *data = [self getDataFromStorageWithKey:VM_F_VENDING_MACHINE];
    if (data) {
        VMVendingMachineModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        return model;
    }
    return [[VMOfflineVendingMachineProvider sharedProvider] getVendingMachine];

}


- (void)saveUserPurse:(VMPurseModel *)purse
{
    NSData *encodedObject = nil;
    if (purse)
        encodedObject = [NSKeyedArchiver archivedDataWithRootObject:purse];
    
    [self saveDataToStorage:encodedObject withKey:VM_F_PURSE];
}

- (void)saveVendingMachine:(VMVendingMachineModel *)vendingMachineModel
{
    NSData *encodedObject = nil;
    if (vendingMachineModel)
        encodedObject = [NSKeyedArchiver archivedDataWithRootObject:vendingMachineModel];
  
    [self saveDataToStorage:encodedObject withKey:VM_F_VENDING_MACHINE];
}


- (NSData *)getDataFromStorageWithKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:key];
    return encodedObject;
}

- (void)saveDataToStorage:(NSData *)data withKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:data forKey:key];
    [defaults synchronize];
}

@end
