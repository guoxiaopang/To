//
//  UserModel.h
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface UserModel : NSManagedObject

// 姓名
@property(nonatomic, strong) NSString *name;
// 头像
@property(nonatomic, strong) NSString *icon;
// 唯一UUID
@property(nonatomic, strong) NSString *uuid;
// 生日
@property(nonatomic, strong) NSString *birthday;
// 属性数组[title : value]
@property(nonatomic, strong) NSArray *attributeArray;
// 标签id数组[逗比,宅男] 存标签id
@property(nonatomic, strong) NSArray *typeArray;
// 事件id数组
@property(nonatomic, strong) NSArray *eventArray;

@end
