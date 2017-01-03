//
//  PeopleDetailDataManager.m
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleDetailDataManager.h"
#import "PeopleDetailInfoModel.h"
#import "UserManager.h"

@interface PeopleDetailDataManager()

@property(nonatomic, strong) NSMutableArray *item;

@end

@implementation PeopleDetailDataManager

#pragma mark - 懒加载
- (NSMutableArray *)item
{
    if (!_item)
    {
        _item = [NSMutableArray array];
    }
    return _item;
}

- (NSInteger)numberOfSection
{
    return self.item.count;
}

- (NSString *)name
{
    return @"天天天蓝";
}

- (NSString *)iconStr
{
    return nil;
}

- (PeopleDetailInfoModel *)modelWithRow:(NSInteger)row
{
    if (row < self.item.count)
    {
        return self.item[row];
    }
    return nil;
}

- (void)setModel:(UserModel *)model
{
    _model = model;
    if (model.birthday)
    {
        // 存在 加入数组
        PeopleDetailInfoModel *infoModel = [[PeopleDetailInfoModel alloc] init];
        infoModel.title = @"生日";
        infoModel.value = model.birthday;
        [self.item addObject:infoModel];
    }
    if (model.attributeArray.count > 0)
    {
        [self.item addObjectsFromArray:model.attributeArray];
    }
}

- (void)insertModelAtindex:(NSInteger)index
{
    PeopleDetailInfoModel *infoModel = [[PeopleDetailInfoModel alloc] init];
    [self.item insertObject:infoModel atIndex:index];
}

- (void)deleteModel:(PeopleDetailInfoModel *)model
{
    [self.item removeObject:model];
    [self saveToDataBase];
}

- (void)insertModel:(PeopleDetailInfoModel *)model index:(NSInteger)index
{
    [self.item insertObject:model atIndex:index];
    
    // 删掉假的model
    for (PeopleDetailInfoModel *model in self.item.mutableCopy)
    {
        if (model.title == nil)
        {
            [self.item removeObject:model];
        }
    }
    [self saveToDataBase];
}

// 数据库写入操作
- (void)saveToDataBase
{
    self.model.attributeArray = self.item.mutableCopy;
    [[UserManager shareInstance] changeUser:_model];
}

- (void)changeSourceIndexPath:(NSInteger)source withObjectAtIndex:(NSInteger)des
{
    [self.item exchangeObjectAtIndex:source withObjectAtIndex:des];
    [self saveToDataBase];
}

@end
