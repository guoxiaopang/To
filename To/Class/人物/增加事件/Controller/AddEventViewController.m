//
//  AddEventViewController.m
//  To
//
//  Created by duoyi on 17/1/4.
//  Copyright © 2017年 duoyi. All rights reserved.
//

#import "AddEventViewController.h"

@interface AddEventViewController ()

@property(nonatomic,strong) UIBarButtonItem *leftBarButtonItem;

@end

@implementation AddEventViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"增加事件";
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
}

#pragma mark - 懒加载
- (UIBarButtonItem *)leftBarButtonItem
{
    if (!_leftBarButtonItem)
    {
        _leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(dismissVC)];
        _leftBarButtonItem.tintColor = [UIColor whiteColor];
    }
    return _leftBarButtonItem;
}

#pragma mark - Void
- (void)dismissVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
