//
//  VMStockPanelView.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMStockPanelView.h"
#import "VMStockModel.h"
#import "VMProductModel.h"
#import "VMPresenterProtocols.h"

@interface VMStockPanelView () <UITableViewDataSource, UITableViewDelegate>
- (UITableView *)tableView;
@end

@implementation VMStockPanelView
{
    UITableView *_tableView;
    
    VMStockModel *_stock;
    NSArray *_products;
}

-(void)layoutSubviews
{
    [self addSubview:self.tableView];
}

#pragma mark - Getter

- (UITableView *)tableView
{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.bounds];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView = tableView;
    }
    return _tableView;
}


- (void)setStock:(VMStockModel *)stock
{
    _stock = stock;
    [self reloadData];
}

- (void)reloadData
{
    _products = _stock.getAllItems;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return _products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    VMProductModel *product = _products[indexPath.row];
    
    cell.textLabel.font = [UIFont vmLightFontWithSize:14];
    cell.textLabel.text = [NSString stringWithFormat:VM_T_PRODUCT_CELL_PATTERN, product.title.lowercaseString];
    cell.textLabel.numberOfLines = 0;

    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([_presenter respondsToSelector:@selector(buyProduct:)]) {
        VMProductModel *product = _products[indexPath.row];
        [_presenter buyProduct:product];
    }
}


@end
