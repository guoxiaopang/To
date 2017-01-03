//
//  PeopleDetailThingTableViewCell.m
//  To
//
//  Created by duoyi on 17/1/3.
//  Copyright © 2017年 duoyi. All rights reserved.
//

#import "PeopleDetailThingTableViewCell.h"

@interface PeopleDetailThingTableViewCell ()

@end

@implementation PeopleDetailThingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];

        [self addLayout];
    }
    return self;
}

#pragma mark - Void
- (void)addLayout
{
    
}

@end
