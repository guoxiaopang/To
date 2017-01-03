//
//  PeopleListDatamanager.m
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleListDatamanager.h"
#import "UserGroup.h"
#import "UserManager.h"

@interface PeopleListDatamanager()<UserManagerDelegate>

@property (nonatomic, strong) NSMutableArray *groupItem;
@property (nonatomic, strong) NSMutableArray *titleArray;

@end

@implementation PeopleListDatamanager

- (void)loadData
{
    [self.groupItem removeAllObjects];
    [self.titleArray removeAllObjects];
    NSArray *array = [[UserManager shareInstance] allGroup];
    [[UserManager shareInstance] addTarget:self];
    for (UserGroup *group in array)
    {
        [self.groupItem addObject:group];
        [self.titleArray addObject:group.title];
    }
    if ([self.delegate respondsToSelector:@selector(peopleListDatamanagerSuccess:)])
    {
        [self.delegate peopleListDatamanagerSuccess:self];
    }
}

#pragma mark - 懒加载
- (NSMutableArray *)groupItem
{
    if (!_groupItem)
    {
        _groupItem = [NSMutableArray array];
    }
    return _groupItem;
}

- (NSMutableArray *)titleArray
{
    if (!_titleArray)
    {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}

#pragma mark - Void

// 返回组数
- (NSInteger)numberOfSection
{
   return self.groupItem.count;
}

// 返回每组个数
- (NSInteger)rowOfNumber:(NSInteger)section
{
    if (section < self.groupItem.count)
    {
        UserGroup *group = self.groupItem[section];
        return group.userArray.count;
    }
    return 0;
}

// 返回model
- (UserModel *)modelWithIndexPath:(NSIndexPath *)indexPath
{
    UserGroup *group = self.groupItem[indexPath.section];
    NSString *idNum = group.userArray[indexPath.row];
    return [[UserManager shareInstance] userWithIdNum:idNum];
}

- (NSArray *)indexArray
{
    return self.titleArray;
}

#pragma mark - UserManagerDelegate
- (void)dataCountChange:(UserManager *)manager
{
    if ([self.delegate respondsToSelector:@selector(peopleListDatamanagerReloadData:)])
    {
        [self.delegate peopleListDatamanagerReloadData:self];
    }
}

@end
