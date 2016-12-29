//
//  UserManager.h
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface UserManager : NSObject

+ (instancetype)shareInstance;
// 增加User
- (void)addUser:(UserModel *)user;
// 删除User
- (void)deleteUser:(UserModel *)user;

// 返回所有group
- (NSArray *)allGroup;
// 返回User
- (UserModel *)userWithIdNum:(NSString *)uuid;

@end
