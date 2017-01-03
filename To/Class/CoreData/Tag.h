//
//  Tag.h
//  To
//
//  Created by duoyi on 17/1/3.
//  Copyright © 2017年 duoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface Tag : NSManagedObject

// 标签id
@property(nonatomic, strong) NSString *tagId;
// 标签名字
@property(nonatomic, strong) NSString *tagName;

@end
