//
//  AppDelegate.m
//  GuidePage+CustomTabbarController
//
//  Created by 吕超 on 16/10/15.
//  Copyright © 2016年 吕超. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomNavigationController.h"
#import "CustomTabBarViewController.h"
#import "GuidePageViewController.h"
#import "ChooseControllerTool.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyWindow];
    
    /*
     *   @ 类方法控制视图控制器
     *
     */
    [ChooseControllerTool chooseControllerTool];
    
    return YES;
}

/*
 *   @ UIView : 转场动画效果
 *   @ param1 : UIView 子类
 *   @ param2 : duration 持续时间
 *   @ param3 : options  具体动画设置
 *   @ param4 : animations 具体操作
 *   @ param5 : completion 执行完成
*/

- (void)changeRootViewController
{
    [UIView transitionWithView:self.window duration:1.0f options:UIViewAnimationOptionTransitionCrossDissolve animations:^
    {
        [UIView setAnimationsEnabled:NO];
        CustomTabBarViewController *CBC = [[CustomTabBarViewController alloc] init];
        self.window.rootViewController = CBC;
    } completion:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
