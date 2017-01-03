////
////  PeopleDetailTagManager.m
////  To
////
////  Created by duoyi on 17/1/3.
////  Copyright © 2017年 duoyi. All rights reserved.
////
//
//#import "PeopleDetailTagManager.h"
//#import <MagicalRecord/MagicalRecord.h>
//
//@interface PeopleDetailTagManager ()
//
//@property(nonatomic, strong)NSMutableArray *tagItem;
//
//@end
//
//@implementation PeopleDetailTagManager
//
//- (NSMutableArray *)tagItem
//{
//    if (!_tagItem)
//    {
//        _tagItem = [NSMutableArray array];
//    }
//    return _tagItem;
//}
//
//- (void)setModel:(UserModel *)model
//{
//    _model = model;
//    
//    // 查询
//    for (NSString *tagId in model.typeArray)
//    {
//        Tag *tag = [[Tag MR_findByAttribute:@"tagId" withValue:tagId] firstObject];
//        if (tag)
//        {
//            [self.tagItem addObject:tag];
//        }
//    }
//}
//
//- (NSArray *)tagArray
//{
//    return self.tagItem;
//}
//
//@end
