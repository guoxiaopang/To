//
//  SidePanelViewController.m
//  To
//
//  Created by duoyi on 16/12/29.
//  Copyright © 2016年 duoyi. All rights reserved.
//

#import "SidePanelViewController.h"

@interface SidePanelViewController ()

@end

@implementation SidePanelViewController

-(UIBarButtonItem *)leftButtonForCenterPanel
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(toggleLeftPanel:)];
    return item;
}

@end
