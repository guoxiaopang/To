//
//  PeopleDetailDataManager.h
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PeopleDetailInfoModel.h"

@interface PeopleDetailDataManager : NSObject

- (NSInteger)numberOfSection;

- (NSString *)name;
- (NSString *)iconStr;
- (PeopleDetailInfoModel *)modelWithRow:(NSInteger)row;

@end
