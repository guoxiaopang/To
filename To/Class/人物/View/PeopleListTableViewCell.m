//
//  PeopleListTableViewCell.m
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleListTableViewCell.h"
#import "Masonry.h"
#import "YYWebImage.h"

@interface PeopleListTableViewCell()

@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *markButton;
@property (nonatomic, strong) UIImage *placeholderImage;

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
- (UIImage *)placeholderImage
{
    if (!_placeholderImage)
    {
        _placeholderImage = [UIImage imageNamed:@"icon"];
        _placeholderImage = [_placeholderImage yy_imageByRoundCornerRadius: _placeholderImage.size.width/2];
    }
    return _placeholderImage;
}

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

    [_iconView yy_setImageWithURL:[NSURL URLWithString:@"http://note.youdao.com/yws/public/resource/9f6745325c19d211a09cfeaffcddcc45/xmlnote/WEBRESOURCE543e0891b28a3178f15ad47ecd820753/1009"] placeholder:self.placeholderImage options:YYWebImageOptionShowNetworkActivity progress:nil transform:^UIImage *(UIImage * image, NSURL * url) {
        image = [image yy_imageByRoundCornerRadius: image.size.width/2];
        return image;
    } completion:nil];
    
}

@end
