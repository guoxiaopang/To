//
//  PeopleAddViewController.m
//  To
//
//  Created by duoyi on 16/12/30.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "PeopleAddViewController.h"

@interface PeopleAddViewController ()

@property(nonatomic,strong) UIBarButtonItem *rightBarButtonItem;
@property(nonatomic,strong) UIBarButtonItem *leftBarButtonItem;

@end

@implementation PeopleAddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
}

#pragma mark - 懒加载
- (UIBarButtonItem *)rightBarButtonItem
{
    if (!_rightBarButtonItem)
    {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"提交" style:UIBarButtonItemStylePlain target:self action:nil];
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

@end
