//
//  YGEssenceWebController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/11.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGEssenceWebController.h"
@interface YGEssenceWebController ()<UIWebViewDelegate, UIScrollViewDelegate>
/** webView */
@property(nonatomic, strong) UIWebView *webView;
/** 悬浮按钮Window */
@property(nonatomic, strong) UIView *buttonWin;
/** 悬浮按钮 */
@property(nonatomic, strong) UIButton *suspendBtn;



@end

@implementation YGEssenceWebController {
    CGFloat _offsetY;
}
/**
 *  构造方法
 */
- (instancetype)initWithAppView:(NSString *)appView
{
    self = [super init];
    if (self) {
        self.appView = appView;
        //隐藏tabBarController当Push时候
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configWebView];
    //要等rootwin创建之后再加上这个
    //    [self performSelector:@selector(creatSuspendButton) withObject:nil afterDelay:.3];
    [self creatSuspendButton];
}

//配置webView先关信息
- (void)configWebView
{
    
    
    
    self.webView = [[UIWebView alloc] init];
    self.webView.scrollView.delegate = self;
    self.webView.delegate = self;
    self.webView.scalesPageToFit = YES;
    self.webView.scrollView.contentInset = UIEdgeInsetsMake(-20, 0, 0, 0);
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(UIEdgeInsetsZero);
    }];
    self.webView.scrollView.bounces = NO;
    NSURLRequest *request = [NSURLRequest requestWithURL:self.appView.yg_URL];
    [self.webView loadRequest:request];
}

#pragma mark - <UIWebViewDelegate>
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}
//开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [self.view showHUD];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.view hideHUD];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.view showMessage:@"请稍后.."];
//    [NSThread sleepForTimeInterval:1.2];
//    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 创建悬浮按钮
- (void)creatSuspendButton
{
    self.suspendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.suspendBtn setBackgroundImage:[UIImage imageNamed:@"homeBackButton"] forState:UIControlStateNormal];
    self.suspendBtn.frame = CGRectMake(0, 0, 54, 54);
    [self.suspendBtn addTarget:self action:@selector(clickSuspendButton) forControlEvents:UIControlEventTouchUpInside];
    //创建悬浮按钮的window
    self.buttonWin = [[UIView alloc] initWithFrame:CGRectMake(25, YGScreenH - 60, 54, 54)];
    self.buttonWin.backgroundColor = [UIColor clearColor];
    //将buttonWin显示出来
    [self.view addSubview:self.buttonWin];
    [self.buttonWin addSubview:self.suspendBtn];
    
    
}
//点击悬浮按钮
- (void)clickSuspendButton
{
    self.buttonWin.hidden = YES;
    self.buttonWin = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
#pragma mark - viewViewDisappear
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
//按钮隐藏
#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    if (scrollView.contentOffset.y > _offsetY + 1) {
        [self suspensionWithAlpha:0];
    }
    else if (scrollView.contentOffset.y < _offsetY)
    {
        [self suspensionWithAlpha:1];
    }
}

//停止滚动式调用  即将开始减速时候保存y值
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    _offsetY = scrollView.contentOffset.y;
}

//设置悬浮按钮的透明度
- (void)suspensionWithAlpha:(CGFloat)alpha
{
    [UIView animateWithDuration:0.3 animations:^{
        [self.buttonWin setAlpha:alpha];
    }];
}


@end
