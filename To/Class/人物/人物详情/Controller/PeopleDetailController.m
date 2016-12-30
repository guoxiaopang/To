//
//  PeopleDetailController.m
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleDetailController.h"
#import "PeopleDetailNormalTableViewCell.h"
#import "PeopleDetailDataManager.h"
#import "UIColor+Hex.h"
#import "PeopleDetailInfoModel.h"
#import "PeopleDetailSectionView.h"
#import "PeopleDetailHeadView.h"

static NSString *peopleDetailNormalTableViewCellIdent = @"peopleDetailNormalTableViewCellIdent";
static NSString *peopleDetailSectionViewIdent = @"peopleDetailSectionViewIdent";

@interface PeopleDetailController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)PeopleDetailDataManager *dataManager;
@property(nonatomic, strong)PeopleDetailHeadView *headView;
@property(nonatomic, strong)UIBarButtonItem *rightBarButtonItem;

@end

@implementation PeopleDetailController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    self.navigationItem.title = @"人物详情";
    self.automaticallyAdjustsScrollViewInsets = NO;
    UINavigationBar *bar = self.navigationController.navigationBar;
    [bar setShadowImage:[[UIImage alloc] init]];
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
}

#pragma mark - 懒加载
- (UIBarButtonItem *)rightBarButtonItem
{
    if (!_rightBarButtonItem)
    {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:nil];
        _rightBarButtonItem.tintColor = [UIColor whiteColor];
    }
    return _rightBarButtonItem;
}

- (PeopleDetailHeadView *)headView
{
    if (!_headView)
    {
        _headView = [[PeopleDetailHeadView alloc] init];
        _headView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 300);
        _headView.backgroundColor = [UIColor colorWithHex:0X5677FC];
    }
    return _headView;
}

- (PeopleDetailDataManager *)dataManager
{
    if (!_dataManager)
    {
        _dataManager = [[PeopleDetailDataManager alloc] init];
    }
    return _dataManager;
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor colorWithHex:0Xf6f5f1];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        [_tableView registerClass:[PeopleDetailNormalTableViewCell class] forCellReuseIdentifier:peopleDetailNormalTableViewCellIdent];
        [_tableView registerClass:[PeopleDetailSectionView class] forHeaderFooterViewReuseIdentifier:peopleDetailSectionViewIdent];
        _tableView.showsVerticalScrollIndicator = false;
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataManager numberOfSection];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PeopleDetailNormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:peopleDetailNormalTableViewCellIdent];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    PeopleDetailInfoModel *model = [self.dataManager modelWithRow:indexPath.row];
    [cell reloadData:model];
    return cell;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"";
//}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    PeopleDetailSectionView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:peopleDetailSectionViewIdent];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44.0f;
}
@end
