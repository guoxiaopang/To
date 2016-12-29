//
//  AppDelegate.m
//  To
//
//  Created by duoyi on 16/12/28.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "AppDelegate.h"
#import "JASidePanelController.h"
#import "PeopleListViewController.h"
#import "TodayViewController.h"
#import "LeftViewController.h"

@interface AppDelegate ()

@property(nonatomic, strong)JASidePanelController *rootViewController;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.rootViewController.shouldDelegateAutorotateToVisiblePanel = NO;
    PeopleListViewController *listVC = [[PeopleListViewController alloc] init];
    LeftViewController *leftVC = [[LeftViewController alloc] init];
    self.rootViewController.leftPanel = leftVC;
    self.rootViewController.centerPanel = listVC;
    
    self.window.rootViewController = self.rootViewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (JASidePanelController *)rootViewController
{
    if (!_rootViewController)
    {
        _rootViewController = [[JASidePanelController alloc] init];
        _rootViewController.shouldDelegateAutorotateToVisiblePanel = NO;
    }
    return _rootViewController;
}
@end
