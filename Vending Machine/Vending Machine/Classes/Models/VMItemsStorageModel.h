//
//  VMItemsStorageModel.h
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMBaseModel.h"

@class VMBaseItemModel;

@interface VMItemsStorageModel : VMBaseModel

- (NSArray<VMBaseItemModel *>*)getAllItems;

- (void)setItems:(NSMutableArray<VMBaseItemModel *> *)items;
- (BOOL)canAddItem:(VMBaseItemModel *)item;
- (void)addItem:(VMBaseItemModel *)item withCount:(NSInteger)count;
- (void)deleteItem:(VMBaseItemModel *)item withCount:(NSInteger)count;
- (BOOL)haveItem:(VMBaseItemModel *)item withCount:(NSInteger)count;
- (NSInteger)getCountForItem:(VMBaseItemModel *)item;
@end
