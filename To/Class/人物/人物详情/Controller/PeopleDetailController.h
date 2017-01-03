//
//  PeopleDetailController.h
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface PeopleDetailController : UITableViewController

- (void)reloadData:(UserModel *)model;

@end
