//
//  GuidePageViewController.m
//  GuidePage+CustomTabbarController
//
//  Created by 吕超 on 16/10/15.
//  Copyright © 2016年 吕超. All rights reserved.
//

#import "GuidePageViewController.h"
#import "AppDelegate.h"

#define imageCount 4
#define Width self.view.frame.size.width
#define Height self.view.frame.size.height

@interface GuidePageViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) UIButton *startBtn;

@end

@implementation GuidePageViewController

- (UIScrollView *)scrollView
{
    if (_scrollView == nil)
    {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.frame = CGRectMake(0, 0, Width, Height);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.bounces = NO;
        _scrollView.contentSize = CGSizeMake(imageCount * Width, 0);
        _scrollView.delegate = self;
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

- (UIPageControl *)pageControl
{
    if (_pageControl == nil)
    {
        _pageControl = [[UIPageControl alloc] init];
        _pageControl.center = CGPointMake(self.view.center.x, Height - 60);
        _pageControl.numberOfPages = 4;
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
        [self.view addSubview:_pageControl];
    }
    return _pageControl;
}

- (void)getImageSource
{
    for (NSInteger i = 0; i < 4; i++)
    {
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, Width, Height)];
        UIImage *imageSource = [UIImage imageNamed:[NSString stringWithFormat:@"fengjing%ld", i]];
        self.imageView.image = imageSource;
        [self.scrollView addSubview:self.imageView];
        
        if (i == imageCount - 1)
        {
            [self setUpLastImageView:self.imageView];
        }
    }
    
    /*
     *   @ 布局 self.scrollView 的子视图
     */
    [self.scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIImageView *imageView, NSUInteger idx, BOOL * _Nonnull stop)
    {
        CGRect frame = imageView.frame;
        frame.origin.x = idx * imageView.frame.size.width;
        imageView.frame = frame;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self getImageSource];
    
    self.pageControl.currentPage = 0;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger page = scrollView.contentOffset.x / Width;
    self.pageControl.currentPage = page;
    
    if (scrollView.contentOffset.x / Width > 2)
    {
        self.pageControl.hidden = YES;
    }
    else
    {
        self.pageControl.hidden = NO;
    }
    
}

- (void)setUpLastImageView:(UIImageView *)imageView
{
    imageView.userInteractionEnabled = YES;
    [self setUpStartBtn:imageView];
}

- (void)setUpStartBtn:(UIImageView *)imageView
{
    self.startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startBtn.frame = CGRectMake(0, Height - 45, Width, 45);
    self.startBtn.backgroundColor = [UIColor whiteColor];
    [self.startBtn setTitle:@"立 刻 体 验" forState:UIControlStateNormal];
    [self.startBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.startBtn addTarget:self action:@selector(clickMethod) forControlEvents:UIControlEventTouchUpInside];
    self.startBtn.layer.cornerRadius = 5;
    self.startBtn.titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18.0f];
    [imageView addSubview:self.startBtn];
}

- (void)clickMethod
{
    [(AppDelegate *)[UIApplication sharedApplication].delegate changeRootViewController];
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
