//
//  PeopleDetailNormalTableViewCell.h
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PeopleDetailInfoModel.h"

@interface PeopleDetailNormalTableViewCell : UITableViewCell

- (void)reloadData:(PeopleDetailInfoModel *)model;

@end
