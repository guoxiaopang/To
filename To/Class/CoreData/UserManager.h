//
//  UserManager.h
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@class UserManager;
@protocol UserManagerDelegate <NSObject>

// 数据改变代理
- (void)dataCountChange:(UserManager *)manager;

@end

@interface UserManager : NSObject

@property(nonatomic, weak) id<UserManagerDelegate> target;
- (void)addTarget:(id)controller;

+ (instancetype)shareInstance;
// 增加User
- (void)addUser:(UserModel *)user;
// 删除User
- (void)deleteUser:(UserModel *)user;
// User改变
- (void)changeUser:(UserModel *)user;


// 返回所有group
- (NSArray *)allGroup;
// 返回User
- (UserModel *)userWithIdNum:(NSString *)uuid;

@end
