//
//  AdvertisementViewController.m
//  GuidePage+CustomTabbarController
//
//  Created by 吕超 on 16/10/21.
//  Copyright © 2016年 吕超. All rights reserved.
//

#define Width self.view.frame.size.width
#define Height self.view.frame.size.height

#import "AdvertisementViewController.h"
#import "CustomTabBarViewController.h"
#import "AppDelegate.h"

@interface AdvertisementViewController ()

@property (nonatomic, strong) UIImageView *adImageView;
@property (nonatomic, strong) UIButton *timeBtn;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation AdvertisementViewController

- (UIImageView *)adImageView
{
    if (_adImageView == nil)
    {
        _adImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
        [self.view addSubview:_adImageView];
    }
    return _adImageView;
}

- (UIButton *)timeBtn
{
    if (_timeBtn == nil)
    {
        _timeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _timeBtn.frame = CGRectMake(Width - 86, 35, 52, 26);
        _timeBtn.backgroundColor = [UIColor clearColor];
        [_timeBtn setTitle:@"跳过广告" forState:UIControlStateNormal];
        [_timeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _timeBtn.titleLabel.font = [UIFont systemFontOfSize:12.5f];
        _timeBtn.layer.cornerRadius = 5;
        [_timeBtn addTarget:self action:@selector(clickMethod) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_timeBtn];
    }
    return _timeBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(timeMethod) userInfo:nil repeats:NO];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
    self.adImageView.image = [UIImage imageNamed:@"Advertisement"];
    self.timeBtn.backgroundColor = [UIColor clearColor];
}

- (void)clickMethod
{
    [(AppDelegate *)[UIApplication sharedApplication].delegate changeRootViewController];
    [self.timer invalidate];
}

- (void)timeMethod
{
    [(AppDelegate *)[UIApplication sharedApplication].delegate changeRootViewController];
    [self.timer invalidate];
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
