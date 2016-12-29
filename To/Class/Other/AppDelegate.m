//
//  AppDelegate.m
//  To
//
//  Created by duoyi on 16/12/28.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "AppDelegate.h"
#import "SidePanelViewController.h"
#import "PeopleListViewController.h"
#import "TodayViewController.h"
#import "LeftViewController.h"
#import "YYFPSLabel.h"
#import "ToNavigationController.h"

@interface AppDelegate ()

@property(nonatomic, strong)SidePanelViewController *rootViewController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    PeopleListViewController *listVC = [[PeopleListViewController alloc] init];
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    self.rootViewController.leftPanel = leftVC;
    self.rootViewController.centerPanel = [[ToNavigationController alloc] initWithRootViewController:listVC];
    
    self.window.rootViewController = self.rootViewController;
    [self.window makeKeyAndVisible];
    
    YYFPSLabel *label = [[YYFPSLabel alloc] init];
    label.frame = CGRectMake(40, 20, 50, 30);
    [self.window addSubview:label];
    return YES;
}

- (SidePanelViewController *)rootViewController
{
    if (!_rootViewController)
    {
        _rootViewController = [[SidePanelViewController alloc] init];
        _rootViewController.shouldDelegateAutorotateToVisiblePanel = NO;
    }
    return _rootViewController;
}

@end
