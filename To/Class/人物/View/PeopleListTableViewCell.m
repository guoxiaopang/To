//
//  PeopleListTableViewCell.m
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleListTableViewCell.h"
#import "Masonry.h"

@interface PeopleListTableViewCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *markButton;

@end

@implementation PeopleListTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.iconView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.markButton];
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
        _iconView.image = [UIImage imageNamed:@"icon"];
    }
    return _iconView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel)
    {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.text = @"你的名字";
        _nameLabel.font = [UIFont systemFontOfSize:20];
        _nameLabel.backgroundColor = [UIColor whiteColor];
    }
    return _nameLabel;
}

- (UIButton *)markButton
{
    if (!_markButton)
    {
        _markButton = [[UIButton alloc] init];
        [_markButton setImage:[UIImage imageNamed:@"heart"] forState:UIControlStateNormal];
    }
    return _markButton;
}

#pragma mark - Void
- (void)addLayout
{
    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(@54);
        make.top.left.equalTo(self.contentView).offset(20);
        make.bottom.equalTo(self.contentView).offset(-20);
    }];
    
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_iconView.mas_right).offset(10);
        make.top.equalTo(_iconView);
        make.width.equalTo(@150);
    }];
    
    [_markButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.width.height.equalTo(@40);
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)reloadData:(UserModel *)model
{
    _nameLabel.text = model.name;
}

@end
