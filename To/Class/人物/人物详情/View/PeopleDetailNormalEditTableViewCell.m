//
//  PeopleDetailNormalEditTableViewCell.m
//  To
//
//  Created by duoyi on 17/1/3.
//  Copyright © 2017年 duoyi. All rights reserved.
//

#import "PeopleDetailNormalEditTableViewCell.h"
#import "Masonry.h"

@interface PeopleDetailNormalEditTableViewCell()

@end

@implementation PeopleDetailNormalEditTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.titleField];
        [self.contentView addSubview:self.valueField];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:nil];
        [self addLayout];
    }
    return self;
}

# pragma mark - 懒加载
- (UITextField *)titleField
{
    if (!_titleField)
    {
        _titleField = [[UITextField alloc] init];
        _titleField.placeholder = @"title";
    }
    return _titleField;
}

- (UITextField *)valueField
{
    if (!_valueField)
    {
        _valueField = [[UITextField alloc] init];
        _valueField.placeholder = @"value";
    }
    return _valueField;
}

#pragma mark - Void
- (void)addLayout
{
    [_titleField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@(CGRectGetWidth(self.frame)/2));
    }];
    
    [_valueField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-20);
        make.centerY.equalTo(self.contentView);
        make.width.equalTo(@(CGRectGetWidth(self.frame)/2));
    }];
}

- (void)reloadData:(PeopleDetailInfoModel *)model
{
    _titleField.text= model.title;
    _valueField.text = model.value;
}

- (void)returnBlock:(valueBlock)value
{
    self.value = value;
}

- (void)textChange
{
    self.value(_titleField.text, _valueField.text);
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
