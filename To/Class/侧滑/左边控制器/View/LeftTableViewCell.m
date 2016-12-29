//
//  LeftTableViewCell.m
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "LeftTableViewCell.h"
#import "Masonry.h"

@interface LeftTableViewCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation LeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.titleLabel];
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
        _iconView.image = [UIImage imageNamed:@"set"];
    }
    return _iconView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

#pragma mark - Void
- (void)addLayout
{
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@25);
        make.top.equalTo(self.contentView).offset(32);
        make.bottom.equalTo(self.contentView).offset(-32);
        make.left.equalTo(self.contentView).offset(35);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconView.mas_right).offset(34);
        make.centerY.equalTo(_iconView);
    }];
}

- (void)reloadData:(NSString *)title
{
    _titleLabel.text = title;
}
@end
