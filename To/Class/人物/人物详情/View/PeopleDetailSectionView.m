//
//  PeopleDetailSectionView.m
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleDetailSectionView.h"
#import "UIColor+Hex.h"
//#import "Masonry.h"

@interface PeopleDetailSectionView()

@property(nonatomic, strong) UILabel *titleLabel;
//@property(nonatomic, strong) UIButton *button;

@end

@implementation PeopleDetailSectionView

- (instancetype)initWithReuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGSize size = _titleLabel.frame.size;
    _titleLabel.frame = CGRectMake(10, CGRectGetHeight(self.contentView.frame)/2 - size.height/2, size.width, size.height);
}

#pragma mark - 懒加载
- (UILabel *)titleLabel
{
    if (!_titleLabel)
    {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"人物详情";
        _titleLabel.textColor = [UIColor colorWithHex:0x888888];
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

- (void)reloadData:(NSString *)str
{
    _titleLabel.text = str;
}

@end
