//
//  PeopleDetailThingManager.m
//  To
//
//  Created by duoyi on 17/1/4.
//  Copyright © 2017年 duoyi. All rights reserved.
//

#import "PeopleDetailThingManager.h"
#import <MagicalRecord/MagicalRecord.h>

@interface PeopleDetailThingManager ()

@property(nonatomic, strong) NSMutableArray *item;

@end

@implementation PeopleDetailThingManager

- (void)requestThing:(UserModel *)model
{
    for (NSString *thingId in model.eventArray)
    {
        ThingModel *model = [[ThingModel MR_findByAttribute:@"thingID" withValue:thingId] firstObject];
        [self.item addObject:model];
    }
}

- (NSInteger)numOfRow
{
    return 5;
}

- (ThingModel *)modelWithRow:(NSInteger)row
{
    if (row < self.item.count)
    {
        return self.item[row];
    }
    return nil;
}

#pragma mark - 懒加载
- (NSMutableArray *)item
{
    if (!_item)
    {
        _item = [NSMutableArray array];
    }
    return _item;
}

@end
