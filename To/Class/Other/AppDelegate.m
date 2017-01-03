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
#import "UserManager.h"
#import "Tag.h"

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
    Tag *tag1 = [Tag MR_createEntity];
    tag1.tagId = [NSUUID UUID].UUIDString;
    tag1.tagName = @"逗比";
    
    Tag *tag2 = [Tag MR_createEntity];
    tag2.tagId = [NSUUID UUID].UUIDString;
    tag2.tagName = @"事情1";
    
    Tag *tag3 = [Tag MR_createEntity];
    tag3.tagId = [NSUUID UUID].UUIDString;
    tag3.tagName = @"属性2";
    
    Tag *tag4 = [Tag MR_createEntity];
    tag4.tagId = [NSUUID UUID].UUIDString;
    tag4.tagName = @"属性3";
    
    Tag *tag5 = [Tag MR_createEntity];
    tag5.tagId = [NSUUID UUID].UUIDString;
    tag5.tagName = @"属性4";
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
}

@end
