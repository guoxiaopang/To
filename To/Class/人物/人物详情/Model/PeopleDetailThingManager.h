//
//  PeopleDetailThingManager.h
//  To
//
//  Created by duoyi on 17/1/4.
//  Copyright © 2017年 duoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThingModel.h"
#import "UserModel.h"

@interface PeopleDetailThingManager : NSObject

// 初始化事件
- (void)requestThing:(UserModel *)model;
// 返回多少件事
- (NSInteger)numOfRow;
// 返回事件
- (ThingModel *)modelWithRow:(NSInteger)row;

@end
