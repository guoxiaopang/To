//
//  PeopleDetailNormalTableViewCell.m
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleDetailNormalTableViewCell.h"
#import "Masonry.h"
#import "UIColor+Hex.h"

@interface PeopleDetailNormalTableViewCell()

@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *valueLabel;

@end

@implementation PeopleDetailNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.valueLabel];
        [self addLayout];
    }
    return self;
}

#pragma mark - 懒加载
- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:17];
    }
    return _titleLabel;
}

- (UILabel *)valueLabel
{
    if (!_valueLabel)
    {
        _valueLabel = [[UILabel alloc] init];
        _valueLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:17];
        _valueLabel.textColor = [UIColor colorWithHex:0x888888];
    }
    return _valueLabel;
}

#pragma mark - Void
- (void)addLayout
{
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(20);
    }];
    
    [_valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-20);
    }];
}

- (void)reloadData:(PeopleDetailInfoModel *)model
{
    _titleLabel.text = model.title;
    _valueLabel.text = model.value;
}

@end
