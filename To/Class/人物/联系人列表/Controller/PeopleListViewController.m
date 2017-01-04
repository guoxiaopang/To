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
#import <MJRefresh/MJRefresh.h>
#import "PeopleAddViewController.h"
#import "ToNavigationController.h"
#import "PeopleDetailController.h"
#import "Masonry.h"

static NSString *PeopleListTableViewCellIdent = @"PeopleListTableViewCellIdent";
@interface PeopleListViewController ()<UITableViewDelegate, UITableViewDataSource, PeopleListDatamanagerDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) PeopleListDatamanager *dataManager;
@property(nonatomic, strong) MJRefreshHeader *refreshHeader;
@property(nonatomic, strong) UIBarButtonItem *rightBarButtonItem;
@property(nonatomic, strong) UIButton *addButton;

@end

@implementation PeopleListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"人物列表";
    [self.view addSubview:self.tableView];
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.dataManager loadData];
    }];
    [self.tableView.mj_header beginRefreshing];
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
    
    [self.view addSubview:self.addButton];
    [self addLayout];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark 懒加载
- (UIButton *)addButton
{
    if (!_addButton)
    {
        _addButton = [[UIButton alloc] init];
        [_addButton setImage:[UIImage imageNamed:@"newNote-normal"] forState:UIControlStateNormal];
        [_addButton setImage:[UIImage imageNamed:@"newNote-pressed"] forState:UIControlStateHighlighted];
        [_addButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addButton;
}

- (UIBarButtonItem *)rightBarButtonItem
{
    if (!_rightBarButtonItem)
    {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add"] style:UIBarButtonItemStylePlain target:self action:@selector(pushAddController)];
    }
    return _rightBarButtonItem;
}

- (PeopleListDatamanager *)dataManager
{
    if (!_dataManager)
    {
        _dataManager = [[PeopleListDatamanager alloc] init];
        _dataManager.delegate = self;
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
    PeopleDetailController *controller = [[PeopleDetailController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    UserModel *model = [self.dataManager modelWithIndexPath:indexPath];
    [controller reloadData:model];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0001f;
}

#pragma mark - PeopleListDatamanagerDelegate
- (void)peopleListDatamanagerSuccess:(PeopleListDatamanager *)manager
{
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
}

- (void)peopleListDatamanagerReloadData:(PeopleListDatamanager *)manager
{
    [self.tableView.mj_header beginRefreshing];
}

#pragma mark - Void
- (void)pushAddController
{
    PeopleAddViewController *controller = [[PeopleAddViewController alloc] init];
    ToNavigationController *navigationVC = [[ToNavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:navigationVC animated:YES completion:nil];
}

- (void)addLayout
{
    [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@54);
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-20);
    }];
}

- (void)buttonClick:(UIButton *)button
{
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *addPerson = [UIAlertAction actionWithTitle:@"增加联系人" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"增加联系人");
    }];
    
    UIAlertAction *addThing = [UIAlertAction actionWithTitle:@"增加事件" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"增加事件");
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [controller addAction:addPerson];
    [controller addAction:addThing];
    [controller addAction:cancel];
    [self presentViewController:controller animated:YES completion:nil];
}
@end
