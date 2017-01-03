//
//  PeopleDetailHeadView.m
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleDetailHeadView.h"
#import "Masonry.h"
#import "YYWebImage.h"

@interface PeopleDetailHeadView()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *iconView;

@end

@implementation PeopleDetailHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.iconView];
        [self addSubview:self.nameLabel];
        [self addLayout];
    }
    return self;
}

- (void)headViewReloadData:(UserModel *)model
{
    _nameLabel.text = model.name;
}

#pragma mark - 懒加载
- (UILabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"狗蛋";
        _nameLabel.textColor = [UIColor whiteColor];
    }
    return _nameLabel;
}

- (UIImageView *)iconView
{
    if (!_iconView)
    {
        _iconView = [[UIImageView alloc] init];
        UIImage *image = [UIImage imageNamed:@"icon"];
        image = [image yy_imageByRoundCornerRadius:image.size.width/2];
        _iconView.image = image;
    }
    return _iconView;
}

#pragma mark - Void
- (void)addLayout
{
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(50);
        make.width.height.equalTo(@150);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_iconView.mas_bottom).offset(20);
    }];
}

@end
