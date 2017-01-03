//
//  PeopleAddViewController.m
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleAddViewController.h"
#import "UserManager.h"
#import <MagicalRecord/MagicalRecord.h>

@interface PeopleAddViewController ()

@property(nonatomic,strong) UIBarButtonItem *rightBarButtonItem;
@property(nonatomic,strong) UIBarButtonItem *leftBarButtonItem;
@property(nonatomic,strong) UITextField *textField;

@end

@implementation PeopleAddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
 
    [self.view addSubview:self.textField];
}

#pragma mark - 懒加载

- (UITextField *)textField
{
    if (!_textField)
    {
        _textField = [[UITextField alloc] init];
        _textField.frame = CGRectMake(30, 100, 200, 44);
        _textField.placeholder = @"请输入名字";
    }
    return _textField;
}

- (UIBarButtonItem *)rightBarButtonItem
{
    if (!_rightBarButtonItem)
    {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:@selector(submit)];
        _rightBarButtonItem.tintColor = [UIColor whiteColor];
    }
    return _rightBarButtonItem;
}

- (UIBarButtonItem *)leftBarButtonItem
{
    if (!_leftBarButtonItem)
    {
        _leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismissVC)];
        _leftBarButtonItem.tintColor = [UIColor whiteColor];
    }
    return _leftBarButtonItem;
}

#pragma mark - void
- (void)dismissVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)submit
{
    if (_textField.text.length > 0)
    {
        UserModel *model = [UserModel MR_createEntity];
        model.name = _textField.text;
        model.uuid = [[NSUUID UUID] UUIDString];
        [[UserManager shareInstance] addUser:model];
    }
    [self dismissVC];
}

@end
