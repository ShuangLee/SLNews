//
//  ViewController.m
//  SLNews
//
//  Created by 光头强 on 16/10/9.
//  Copyright © 2016年 Ls. All rights reserved.
//

#import "ViewController.h"
#import "TopLineViewController.h"
#import "HotViewController.h"
#import "ScoietyViewController.h"
#import "ReaderViewController.h"
#import "ScienceViewController.h"
#import "VideoViewController.h"

static CGFloat const TitlesScrollViewHeight = 44;

@interface ViewController ()
/** 标题滚动视图 */
@property (nonatomic, weak) UIScrollView *titlesScrollView;
/** 内容滚动视图 */
@property (nonatomic, weak) UIScrollView *contentScrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"头条新闻";
    
    // 1.添加标题滚动视图
    [self setupTitlesScrollView];
    
    // 2.添加内容滚动视图
    [self setupContentScrollView];
    
    // 3. 添加所有的子控制器
    [self setupAllChildViewController];
    
    // 4. 添加所有的标题
    [self setupAllTitle];
}

#pragma mark - 添加标题滚动视图
- (void)setupTitlesScrollView {
    UIScrollView *titlesScrollView = [[UIScrollView alloc] init];
    CGFloat y = self.navigationController.navigationBarHidden ? 20 : 64;
    titlesScrollView.frame = CGRectMake(0, y, self.view.frame.size.width, TitlesScrollViewHeight);
    titlesScrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:titlesScrollView];
    _titlesScrollView = titlesScrollView;
}

#pragma mark - 添加内容滚动视图
- (void)setupContentScrollView {
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    contentScrollView.backgroundColor = [UIColor cyanColor];
    CGFloat y = CGRectGetMaxY(self.titlesScrollView.frame);
    contentScrollView.frame = CGRectMake(0, y, self.view.frame.size.width, self.view.frame.size.height - y);
    [self.view addSubview:contentScrollView];
    _contentScrollView = contentScrollView;
}

#pragma mark - 添加所有的子控制器
- (void)setupAllChildViewController
{
    // 头条
    TopLineViewController *vc1 = [[TopLineViewController alloc] init];
    vc1.title = @"头条";
    [self addChildViewController:vc1];
    // 热点
    HotViewController *vc2 = [[HotViewController alloc] init];
    vc2.title = @"热点";
    [self addChildViewController:vc2];
    // 视频
    VideoViewController *vc3 = [[VideoViewController alloc] init];
    vc3.title = @"视频";
    [self addChildViewController:vc3];
    // 社会
    ScoietyViewController *vc4 = [[ScoietyViewController alloc] init];
    vc4.title = @"社会";
    [self addChildViewController:vc4];
    // 订阅
    ReaderViewController *vc5 = [[ReaderViewController alloc] init];
    vc5.title = @"订阅";
    [self addChildViewController:vc5];
    // 科技
    ScienceViewController *vc6 = [[ScienceViewController alloc] init];
    vc6.title = @"科技";
    [self addChildViewController:vc6];
}

#pragma mark - 添加所有的标题
- (void)setupAllTitle
{
    // 添加所有标题按钮
    NSInteger count = self.childViewControllers.count;
    CGFloat btnW = self.view.frame.size.width / 4;
    CGFloat btnH = self.titlesScrollView.bounds.size.height;
    CGFloat btnX = 0;
    for (NSInteger i = 0; i < count; i++) {
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        UIViewController *vc = self.childViewControllers[i];
        [titleButton setTitle:vc.title forState:UIControlStateNormal];
        btnX = i * btnW;
        titleButton.frame = CGRectMake(btnX, 0, btnW, btnH);
        [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
        [self.titlesScrollView addSubview:titleButton];
    }
    
    // 设置标题的滚动范围
    self.titlesScrollView.contentSize = CGSizeMake(count * btnW, 0);
}

@end
