//
//  ToNavigationController.m
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "ToNavigationController.h"
#import "UIColor+Hex.h"

@interface ToNavigationController ()

@end

@implementation ToNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    // 设置背景色
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navagationBar"] forBarMetrics:UIBarMetricsDefault];
    // 设置文字属性
    bar.titleTextAttributes = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:20],
                                NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.interactivePopGestureRecognizer.delegate = nil;
    
    //修改状态栏颜色
    UIView *view = [[UIApplication sharedApplication] valueForKey:@"statusBarWindow"];
    UIView *statuBar = [view valueForKey:@"statusBar"];
    statuBar.backgroundColor = [UIColor colorWithHex:0x4e6cef];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 如果不是第一个进来的控制器
    if (self.childViewControllers.count >= 1)
    {
        // 左上角的返回
        UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [backButton sizeToFit];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        backButton.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
        viewController.hidesBottomBarWhenPushed = YES; // 隐藏底部的工具条
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
}

@end
