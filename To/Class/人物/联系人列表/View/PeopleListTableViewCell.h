//
//  PeopleListTableViewCell.h
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface PeopleListTableViewCell : UITableViewCell

- (void)reloadData:(UserModel *)model;

@end
