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
#import "UserModel.h"
#import "UserManager.h"

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
    
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"d.sqlite"];
    //[self addUser];
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

- (void)addUser
{
    UserModel *model = [UserModel MR_createEntity];
    model.name = @"q";
    model.uuid = [NSUUID UUID].UUIDString;
    
    UserModel *model2 = [UserModel MR_createEntity];
    model2.name = @"w";
    model2.uuid = [NSUUID UUID].UUIDString;
    
    UserModel *model3 = [UserModel MR_createEntity];
    model3.name = @"e";
    model3.uuid = [NSUUID UUID].UUIDString;
    
    UserModel *model4 = [UserModel MR_createEntity];
    model4.name = @"r";
    model4.uuid = [NSUUID UUID].UUIDString;
    
    UserManager *manager = [UserManager shareInstance];
    [manager addUser:model];
    [manager addUser:model2];
    [manager addUser:model3];
    [manager addUser:model4];
}

@end
