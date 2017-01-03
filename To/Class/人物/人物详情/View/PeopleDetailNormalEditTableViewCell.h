//
//  PeopleDetailNormalEditTableViewCell.h
//  To
//
//  Created by duoyi on 17/1/3.
//  Copyright © 2017年 duoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PeopleDetailInfoModel.h"

typedef void(^valueBlock)(NSString *title, NSString *value);
@interface PeopleDetailNormalEditTableViewCell : UITableViewCell

@property(nonatomic, strong) UITextField *titleField;
@property(nonatomic, strong) UITextField *valueField;
@property(nonatomic, copy) valueBlock value;
- (void)returnBlock:(valueBlock)value;
- (void)reloadData:(PeopleDetailInfoModel *)model;
@end
