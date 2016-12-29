//
//  EventModel.h
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventModel : NSObject

// 时间
@property(nonatomic, strong) NSString *time;
// 地点
@property(nonatomic, strong) NSString *address;
// 人物
@property(nonatomic, strong) NSArray *userArray;
// 事件
@property(nonatomic, strong) NSString *eventContent;
// 是否提醒
@property(nonatomic, assign) BOOL remind;

@end
