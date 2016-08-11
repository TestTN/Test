//
//  VMCoinsPanelView.m
//  Vending Machine
//
//  Created by Nurov Timur Dauletovich on 11/08/16.
//  Copyright © 2016 123. All rights reserved.
//

#import "VMCoinsPanelView.h"
#import "VMPurseModel.h"
#import "VMCoinModel.h"
#import "VMPresenterProtocols.h"

@interface VMCoinsPanelView () <UITableViewDataSource, UITableViewDelegate>

- (UITableView *)tableView;

@end

@implementation VMCoinsPanelView
{
    UITableView *_tableView;
    
    VMPurseModel *_purse;
    NSArray *_coins;
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


- (void)setPurse:(VMPurseModel *)purse
{
    _purse = purse;
    [self reloadData];
}

- (void)reloadData
{
    _coins = _purse.getAllItems;
    
    [self.tableView reloadData];
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return _coins.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    VMCoinModel *coin = _coins[indexPath.row];
    
    cell.textLabel.font = [UIFont vmLightFontWithSize:14];
    cell.textLabel.text = [NSString stringWithFormat:VM_T_COIN_CELL_PATTERN, coin.title];
    cell.textLabel.numberOfLines = 0;
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([_presenter respondsToSelector:@selector(addCoin:)]) {
        VMCoinModel *coin = _coins[indexPath.row];
        [_presenter addCoin:coin];
    }

}


@end
