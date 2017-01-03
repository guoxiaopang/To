//
//  PeopleDetailDataManager.h
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PeopleDetailInfoModel.h"
#import "UserModel.h"

@interface PeopleDetailDataManager : NSObject

- (NSInteger)numberOfSection;

- (NSString *)name;
- (NSString *)iconStr;
- (PeopleDetailInfoModel *)modelWithRow:(NSInteger)row;

@property(nonatomic, strong)UserModel *model;

// 真的新增一条数据模型
- (void)insertModel:(PeopleDetailInfoModel *)model index:(NSInteger)index;
// 假的新增数据模型
- (void)insertModelAtindex:(NSInteger)index;

// 删除数据模型
- (void)deleteModel:(PeopleDetailInfoModel *)model;

// 移动cell交换数据
- (void)changeSourceIndexPath:(NSInteger)source withObjectAtIndex:(NSInteger)des;

@end
