//
//  LeftViewController.m
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "LeftViewController.h"
#import "LeftTableViewCell.h"
#import "LeftHeadView.h"
#import "UIViewController+JASidePanel.h"
#import "TodayViewController.h"
#import "JASidePanelController.h"
#import "PeopleListViewController.h"
#import "ToNavigationController.h"
@interface LeftViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) LeftHeadView *headView;

@end

static NSString *leftIdentCell = @"leftIdentCell";

@implementation LeftViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

#pragma mark 懒加载
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] init];
        _tableView.frame = self.view.bounds;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 55.0;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorInset = UIEdgeInsetsZero;
        [_tableView registerClass:[LeftTableViewCell class] forCellReuseIdentifier:leftIdentCell];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator = false;
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
}

- (LeftHeadView *)headView
{
    if (!_headView)
    {
        _headView = [[LeftHeadView alloc] init];
        _headView.frame = CGRectMake(0, 0, 100, 220);
    }
    return _headView;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftIdentCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 0)
    {
        [cell reloadData:@"人物列表"];
    }
    else if (indexPath.row == 1)
    {
        [cell reloadData:@"今日事件"];
    }
    else if (indexPath.row == 2)
    {
        [cell reloadData:@"设置"];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        [self showController:[PeopleListViewController class]];
    }
    else if (indexPath.row == 1)
    {
#warning 这里可以懒加载
        [self showController:[TodayViewController class]];
    }
}

- (void)showController:(Class)controllerClass
{
    UIViewController *controller = [controllerClass new];
    ToNavigationController *navigationVC = [[ToNavigationController alloc] initWithRootViewController:controller];
    self.sidePanelController.centerPanel = navigationVC;
}

@end
