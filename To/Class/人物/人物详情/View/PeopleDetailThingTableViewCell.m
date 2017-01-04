//
//  PeopleDetailThingTableViewCell.m
//  To
//
//  Created by duoyi on 17/1/3.
//  Copyright © 2017年 duoyi. All rights reserved.
//

#import "PeopleDetailThingTableViewCell.h"
#import "Masonry.h"

@interface PeopleDetailThingTableViewCell ()

@property(nonatomic, strong) UILabel *timeLabel;
@property(nonatomic, strong) UILabel *thingLabel;

@end

@implementation PeopleDetailThingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.thingLabel];
        [self addLayout];
    }
    return self;
}

#pragma mark - Void
- (void)addLayout
{
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
        make.top.equalTo(self.contentView).offset(10);
    }];
    
    [_thingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timeLabel);
        make.top.equalTo(_timeLabel.mas_bottom).offset(10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.right.equalTo(self.contentView).offset(-20);
    }];
}

- (void)reloadData:(ThingModel *)model
{
    _thingLabel.text = model.content;
}

#pragma mark - 懒加载
- (UILabel *)timeLabel
{
    if (!_timeLabel)
    {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:14];
        _timeLabel.text = @"2015年10月2日";
    }
    return _timeLabel;
}

- (UILabel *)thingLabel
{
    if (!_thingLabel)
    {
        _thingLabel = [[UILabel alloc] init];
        _thingLabel.numberOfLines = 0;
        _thingLabel.text = @"啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊";
    }
    return _thingLabel;
}

@end
