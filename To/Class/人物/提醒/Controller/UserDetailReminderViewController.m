//
//  UserDetailReminderViewController.m
//  To
//
//  Created by duoyi on 17/1/5.
//  Copyright © 2017年 duoyi. All rights reserved.
//

#import "UserDetailReminderViewController.h"
#import "UIColor+Hex.h"
#import "UserDetailTableViewCell.h"

static NSString *userDetailReminderViewControllerCellIdent = @"userDetailReminderViewControllerCellIdent";

@interface UserDetailReminderViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) UITableView *tableView;

@end

@implementation UserDetailReminderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"提醒";
    [self.view addSubview:self.tableView];
}

#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 64.0f) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.estimatedRowHeight = 80.0;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.separatorColor = [UIColor colorWithHex:0xe0e0e0];
        _tableView.sectionIndexColor = [UIColor colorWithHex:0xaeaeae];
        [_tableView registerClass:[UserDetailTableViewCell class] forCellReuseIdentifier:userDetailReminderViewControllerCellIdent];
        _tableView.sectionHeaderHeight = 0.0f;
        _tableView.sectionFooterHeight = 0.0f;
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.showsVerticalScrollIndicator = false;
    }
    return _tableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UserDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:userDetailReminderViewControllerCellIdent];
    
    if (indexPath.row == 0)
    {
        [cell setTitle:_model.title value:_model.value];
    }
    else if (indexPath.row == 1)
    {
        [cell setTitle:@"时间" value:@"2016年11月11日 13:50"];
    }
    else if (indexPath.row == 2)
    {
        [cell setTitle:@"提醒方式" value:@"每天提醒"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else if (indexPath.row == 3)
    {
        [cell setTitle:@"备注" value:@"这里是备注备注备注"];
    }
    
    return cell;
}

@end
