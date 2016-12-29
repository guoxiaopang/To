//
//  LeftHeadView.m
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "LeftHeadView.h"
#import "Masonry.h"

@interface LeftHeadView ()

@property(nonatomic, strong) UIImageView *iconView;
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *vipLabel;

@end

@implementation LeftHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.iconView];
        [self addSubview:self.nameLabel];
        [self addSubview:self.vipLabel];
        [self addLayout];
    }
    return self;
}

#pragma mark - 懒加载
- (UIImageView *)iconView
{
    if (!_iconView)
    {
        _iconView = [[UIImageView alloc] init];
        _iconView.image = [UIImage imageNamed:@"placeholder"];
        [_iconView sizeToFit];
    }
    return _iconView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:16 weight:4];
        _nameLabel.text = @"Leo宇";
    }
    return _nameLabel;
}

- (UILabel *)vipLabel
{
    if (!_vipLabel)
    {
        _vipLabel = [[UILabel alloc] init];
        _vipLabel.font = [UIFont systemFontOfSize:12];
        _vipLabel.text = @"个人免费版";
    }
    return _vipLabel;
}

#pragma mark - Void
- (void)addLayout
{
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(60);
        make.width.height.equalTo(@64);
        make.centerX.equalTo(self);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_iconView.mas_bottom).offset(10);
        make.centerX.equalTo(self);
    }];
    
    [_vipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nameLabel.mas_bottom).offset(5);
        make.centerX.equalTo(self);
    }];
}
@end
