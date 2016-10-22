//
//  ChooseControllerTool.m
//  GuidePage+CustomTabbarController
//
//  Created by 吕超 on 16/10/20.
//  Copyright © 2016年 吕超. All rights reserved.
//

#import "ChooseControllerTool.h"
#import "GuidePageViewController.h"
#import "CustomTabBarViewController.h"
#import "AdvertisementViewController.h"

@implementation ChooseControllerTool

/*
 *    @ 判断程序是否第一次启动, 显示对应的根视图
 */
+ (void)chooseControllerTool
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"FirstStart"] == NO)
    {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"FirstStart"];
        
        NSLog(@"第一次启动");
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        GuidePageViewController *gpVC = [[GuidePageViewController alloc] init];
        window.rootViewController = gpVC;
    }
    else
    {
        NSLog(@"非第一次启动");
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        AdvertisementViewController *adVC = [[AdvertisementViewController alloc] init];
        window.rootViewController = adVC;
    }
}

@end
