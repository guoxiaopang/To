//
//  UserManager.m
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "UserManager.h"
#import <MagicalRecord/MagicalRecord.h>
#import "UserGroup.h"

@implementation UserManager

+ (instancetype)shareInstance
{
    static UserManager *object = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object = [[self alloc] init];
    });
    return object;
}

- (void)deleteUser:(UserModel *)user
{
    //获取组
    NSString *c = [self firstCharactor:user.name];
    UserGroup *group = [[UserGroup MR_findByAttribute:@"title" withValue:c] firstObject];
    if (group)
    {
        NSMutableArray *item = [group.userArray mutableCopy];
        [item removeObject:user];
        if (item.count > 0)
        {
              group.userArray = item;
        }
        else
        {
            [group MR_deleteEntity];
        }
    }
    else
    {
        NSLog(@"group不存在 请检查");
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)addUser:(UserModel *)user
{
    NSString *c = [self firstCharactor:user.name];
    //判断是否需要新增组
    NSArray *groupArray = [UserGroup MR_findByAttribute:@"title" withValue:c];
    if (groupArray.count > 0 && groupArray.count == 1)
    {
        // 存在值 添加进组
        UserGroup *group = groupArray.firstObject;
        NSMutableArray *item = [group.userArray mutableCopy];
        [item addObject:user.uuid];
        group.userArray = item;
    }
    else if(groupArray.count == 0)
    {
        // 不存在 增加group
        [self addGroup:c idNum:user.uuid];
    }
    else
    {
        NSLog(@"索引组异常");
    }
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

- (void)addGroup:(NSString *)groupName idNum:(NSString *)idNum
{
    UserGroup *group = [UserGroup MR_createEntity];
    group.title = groupName;
    group.userArray = @[idNum];
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}


// 获取首字母
- (NSString *)firstCharactor:(NSString *)str
{
    //转成了可变字符串
    NSMutableString *s = [NSMutableString stringWithString:str];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)s,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)s,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [s capitalizedString];
    //获取并返回首字母
    return [pinYin substringToIndex:1];
}

- (NSArray *)allGroup
{
    NSArray *array = [UserGroup MR_findAllSortedBy:@"title" ascending:YES];
    return array;
}

- (UserModel *)userWithIdNum:(NSString *)uuid
{
    NSArray *array = [UserModel MR_findByAttribute:@"uuid" withValue:uuid];
    return [array firstObject];
}

@end
