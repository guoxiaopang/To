//
//  UserGroup.h
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface UserGroup : NSManagedObject

// 分组名
@property(nonatomic, strong) NSString *title;
// User id数组
@property(nonatomic, strong) NSArray *userArray;

@end
