//
//  VMItemsStorageModel.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMItemsStorageModel.h"
#import "VMBaseItemModel.h"

@interface VMItemsStorageModel ()

@property (nonatomic, strong) NSMutableArray<VMBaseItemModel *> *items;
@property (nonatomic, strong) NSMutableDictionary <NSNumber *, NSNumber *> *countDictionary;

@end

@implementation VMItemsStorageModel

+ (instancetype)make
{
    VMItemsStorageModel *model = [super make];
    return model;
}

- (NSArray<VMBaseItemModel *> *)getAllItems
{
    NSArray *array = _items;
    return array;
}

- (void)setItems:(NSMutableArray<VMBaseItemModel *> *)items
{
    _items = items;
    self.countDictionary = [NSMutableDictionary dictionary];
}

- (BOOL)canAddItem:(VMBaseItemModel *)item
{
    for (VMBaseItemModel *model in _items) {
        if ((item.objId == model.objId ) && ([model isKindOfClass:[item class]])) {
            return YES;
        }
    }
    return NO;
}


- (void)addItem:(VMBaseItemModel *)item withCount:(NSInteger)count;
{
    NSInteger oldCount = _countDictionary[@(item.objId)].integerValue;
    oldCount += count;
    _countDictionary[@(item.objId)] = @(oldCount);
}

- (void)deleteItem:(VMBaseItemModel *)item withCount:(NSInteger)count
{
    NSInteger oldCount = _countDictionary[@(item.objId)].integerValue;
    oldCount -= count;
    _countDictionary[@(item.objId)] = @(oldCount);
}

- (BOOL)haveItem:(VMBaseItemModel *)item withCount:(NSInteger)count
{
    NSInteger oldCount = _countDictionary[@(item.objId)].integerValue;
    return (oldCount >= count);
}

- (NSInteger)getCountForItem:(VMBaseItemModel *)item
{
    NSInteger oldCount = _countDictionary[@(item.objId)].integerValue;
    return oldCount;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.items forKey:VM_F_ITEMS];
    [encoder encodeObject:self.countDictionary forKey:VM_F_DICTIONARY];
}


- (id)initWithCoder:(NSCoder *)decoder
{
    if((self = [super initWithCoder:decoder])) {
        self.items = [decoder decodeObjectForKey:VM_F_ITEMS];
        self.countDictionary = [decoder decodeObjectForKey:VM_F_DICTIONARY];
    }
    return self;
}



@end
