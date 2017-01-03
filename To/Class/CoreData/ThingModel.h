//
//  ThingModel.h
//  To
//
//  Created by duoyi on 17/1/3.
//  Copyright © 2017年 duoyi. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface ThingModel : NSManagedObject

// 时间
@property(nonatomic, strong) NSString *time;
// 地点
@property(nonatomic, strong) NSString *address;
// 人物
@property(nonatomic, strong) NSArray *users;
// 事情详细
@property(nonatomic, strong) NSString *content;
// 事件id
@property(nonatomic, strong) NSString *thingID;

@end
