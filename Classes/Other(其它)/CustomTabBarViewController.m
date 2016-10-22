//
//  CustomTabBarViewController.m
//  GuidePage+CustomTabbarController
//
//  Created by 吕超 on 16/10/20.
//  Copyright © 2016年 吕超. All rights reserved.
//

#import "CustomTabBarViewController.h"
#import "CustomNavigationController.h"
#import "FishViewController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"

@interface CustomTabBarViewController ()

@end

@implementation CustomTabBarViewController

+ (void)initialize
{
    /*
     *   @ 让控件变为属性
     */
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *textNormal = [NSMutableDictionary dictionary];
    textNormal[NSFontAttributeName] = [UIFont systemFontOfSize:8];
    textNormal[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    NSMutableDictionary *textSelected = [NSMutableDictionary dictionary];
    textSelected[NSFontAttributeName] = [UIFont systemFontOfSize:8];
    textSelected[NSForegroundColorAttributeName] = [UIColor blackColor];
    
    [tabBarItem setTitleTextAttributes:textNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:textSelected forState:UIControlStateSelected];
}

- (void)setUpChidlViewController
{
    HomeViewController *homeVC = [[HomeViewController alloc] init];
    [self setUpChildViewController:homeVC titile:@"首页" imageName:@"home_normal" selectedImage:@"home_highlight"];
    
    FishViewController *fishVC = [[FishViewController alloc] init];
    [self setUpChildViewController:fishVC titile:@"闲鱼" imageName:@"fish_normal" selectedImage:@"fish_highlight"];
    
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    [self setUpChildViewController:messageVC titile:@"消息" imageName:@"message_normal" selectedImage:@"message_highlight"];
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    [self setUpChildViewController:mineVC titile:@"我的" imageName:@"mycity_normal" selectedImage:@"mycity_highlight"];
    
}

- (void)setUpChildViewController:(UIViewController *)ChildViewController titile:(NSString *)title imageName:(NSString *)imageName selectedImage:(NSString *)selectedImageName
{
    ChildViewController.title = title;
    
    ChildViewController.tabBarItem.image = [UIImage imageNamed:imageName];
    
    UIImage *selectdeImage = [UIImage imageNamed:selectedImageName];
    selectdeImage = [selectdeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ChildViewController.tabBarItem.selectedImage = selectdeImage;
    
    CustomNavigationController *CNC = [[CustomNavigationController alloc] initWithRootViewController:ChildViewController];
    
    [self addChildViewController:CNC];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpChidlViewController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
