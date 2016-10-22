//
//  CustomNavigationController.m
//  GuidePage+CustomTabbarController
//
//  Created by 吕超 on 16/10/19.
//  Copyright © 2016年 吕超. All rights reserved.
//

#import "CustomNavigationController.h"

@interface CustomNavigationController ()

@end

@implementation CustomNavigationController

+ (void)initialize
{
    [self setUpNavigationBar];
}

+ (void)setUpNavigationBar
{
    /*
     *   @ 统一设置导航栏样式
     */
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    [navigationBar setBarTintColor:[UIColor purpleColor]];
    
    NSMutableDictionary *textAttrubite = [NSMutableDictionary dictionary];
    textAttrubite[NSFontAttributeName] = [UIFont systemFontOfSize:16];
    textAttrubite[NSForegroundColorAttributeName] = [UIColor whiteColor];
    
    [navigationBar setTitleTextAttributes:textAttrubite];
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
