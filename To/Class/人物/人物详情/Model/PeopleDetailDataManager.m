//
//  PeopleDetailDataManager.m
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleDetailDataManager.h"
#import "PeopleDetailInfoModel.h"

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
//        PeopleDetailInfoModel *model1 = [[PeopleDetailInfoModel alloc] init];
//        model1.title = @"生日";
//        model1.value = @"1993-08-21";
//        PeopleDetailInfoModel *model2 = [[PeopleDetailInfoModel alloc] init];
//        model2.title = @"电话";
//        model2.value = @"12345678";
//        PeopleDetailInfoModel *model3 = [[PeopleDetailInfoModel alloc] init];
//        model3.title = @"星座";
//        model3.value = @"狮子座";
//        [_item addObjectsFromArray:@[model1, model2, model3]];
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

//- (void)insertTitle:(NSString *)title value:(NSString *)value index:(NSInteger)index
//{
//    PeopleDetailInfoModel *infoModel = [[PeopleDetailInfoModel alloc] init];
//    infoModel.title = title;
//    infoModel.value = value;
//    [self.item insertObject:infoModel atIndex:index];
//    
//    // 删掉假的model
//    for (PeopleDetailInfoModel *model in self.item)
//    {
//        if (model.title == nil)
//        {
//            [self.item removeObject:model];
//        }
//    }
//#warning 写数据库
//}

- (void)insertModelAtindex:(NSInteger)index
{
    PeopleDetailInfoModel *infoModel = [[PeopleDetailInfoModel alloc] init];
    [self.item insertObject:infoModel atIndex:index];
}

- (void)deleteModel:(PeopleDetailInfoModel *)model
{
    [self.item removeObject:model];
#warning 这里写入数据库
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
}

@end
