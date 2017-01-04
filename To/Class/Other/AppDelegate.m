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
#import <MagicalRecord/MagicalRecord.h>
#import <JSPatchPlatform/JSPatch.h>
#import <Bugly/Bugly.h>

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
#ifdef DEBUG
    YYFPSLabel *label = [[YYFPSLabel alloc] init];
    label.frame = CGRectMake(40, 20, 50, 30);
    [self.window addSubview:label];
#endif
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"d.sqlite"];
    
//    [JSPatch startWithAppKey:@"51032afe02cb2d41"];
//#ifdef DEBUG
//    [JSPatch setupDevelopment];
//#endif
//    [JSPatch sync];
    [Bugly startWithAppId:@"cd4f73088e"];
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

- (void)applicationWillTerminate:(UIApplication *)application
{
    [MagicalRecord cleanUp];
}



@end
