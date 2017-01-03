////
////  PeopleDetailTagCell.m
////  To
////
////  Created by duoyi on 17/1/3.
////  Copyright © 2017年 duoyi. All rights reserved.
////
//
//#import "PeopleDetailTagCell.h"
//#import "Masonry.h"
//
//@interface PeopleDetailTagCell ()
//
//@property(nonatomic, strong) UIImageView *iconView;
//
//@end
//
//@implementation PeopleDetailTagCell
//
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self)
//    {
//        [self.contentView addSubview:self.iconView];
//        [self addLayout];
//    }
//    return self;
//}
//
//#pragma mark - 懒加载
//- (UIImageView *)iconView
//{
//    if (!_iconView)
//    {
//        _iconView = [[UIImageView alloc] init];
//        _iconView.image = [UIImage imageNamed:@"interest_personality"];
//    }
//    return _iconView;
//}
//
//#pragma mark - Void
//- (void)addLayout
//{
//    [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.equalTo(@22);
//        make.centerY.equalTo(self.contentView);
//        make.left.equalTo(self.contentView).offset(10);
//    }];
//}
//
//// 根据数量添加按钮
//
//@end
