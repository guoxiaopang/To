//
//  PeopleListViewController.m
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleListViewController.h"
#import "JASidePanelController.h"
#import "PeopleListTableViewCell.h"
#import "UIColor+Hex.h"
#import "PeopleListDatamanager.h"

static NSString *PeopleListTableViewCellIdent = @"PeopleListTableViewCellIdent";
@interface PeopleListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) PeopleListDatamanager *dataManager;
@end

@implementation PeopleListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"人物列表";
    [self.view addSubview:self.tableView];
    //self.automaticallyAdjustsScrollViewInsets = NO;
}

#pragma mark 懒加载
- (PeopleListDatamanager *)dataManager
{
    if (!_dataManager)
    {
        _dataManager = [[PeopleListDatamanager alloc] init];
    }
    return _dataManager;
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 80.0;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.separatorColor = [UIColor colorWithHex:0xe0e0e0];
        _tableView.sectionIndexColor = [UIColor colorWithHex:0xaeaeae];
        [_tableView registerClass:[PeopleListTableViewCell class] forCellReuseIdentifier:PeopleListTableViewCellIdent];
        _tableView.sectionHeaderHeight = 0.0f;
        _tableView.sectionFooterHeight = 0.0f;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator = false;
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataManager rowOfNumber:section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dataManager numberOfSection];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PeopleListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PeopleListTableViewCellIdent];
    UserModel *model = [self.dataManager modelWithIndexPath:indexPath];
    [cell reloadData:model];
    return cell;
}

// 返回索引数组
- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableVie
{
    return [self.dataManager indexArray];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0001f;
}

@end
