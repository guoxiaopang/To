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
    
    // time是时间搓
    double time = [model.time doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy年MM月dd日 HH:mm:ss";
    NSString *timeStr = [fmt stringFromDate:date];
    _timeLabel.text = timeStr;
}

#pragma mark - 懒加载
- (UILabel *)timeLabel
{
    if (!_timeLabel)
    {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.font = [UIFont systemFontOfSize:14];
    }
    return _timeLabel;
}

- (UILabel *)thingLabel
{
    if (!_thingLabel)
    {
        _thingLabel = [[UILabel alloc] init];
        _thingLabel.numberOfLines = 0;
    }
    return _thingLabel;
}

@end
