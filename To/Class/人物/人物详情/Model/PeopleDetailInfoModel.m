//
//  PeopleDetailInfoModel.m
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleDetailInfoModel.h"

#define kPeopleDetailInfoModelTitle @"title"
#define kPeopleDetailInfoModelValue @"value"

@interface PeopleDetailInfoModel()<NSCoding>

@end

@implementation PeopleDetailInfoModel

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:kPeopleDetailInfoModelTitle];
    [aCoder encodeObject:self.value forKey:kPeopleDetailInfoModelValue];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self.title = [aDecoder decodeObjectForKey:kPeopleDetailInfoModelTitle];
    self.value = [aDecoder decodeObjectForKey:kPeopleDetailInfoModelValue];
    return self;
}

@end
