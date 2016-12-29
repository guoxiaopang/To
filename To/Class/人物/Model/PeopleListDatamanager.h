//
//  PeopleListDatamanager.h
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
#import <UIKit/UIKit.h>

@interface PeopleListDatamanager : NSObject

// 返回组数
- (NSInteger)numberOfSection;
// 返回每组个数
- (NSInteger)rowOfNumber:(NSInteger)section;
// 返回model
- (UserModel *)modelWithIndexPath:(NSIndexPath *)indexPath;
// 返回分组索引数组
- (NSArray *)indexArray;

@end
