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
@property(nonatomic, strong) UIWindow *buttonWin;
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
    [self performSelector:@selector(creatSuspendButton) withObject:nil afterDelay:.3];
}

//配置webView先关信息
- (void)configWebView
{
    self.webView = [[UIWebView alloc] init];
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
    [self.view showMessage:@"网络错误啦~请检查网络"];
    [NSThread sleepForTimeInterval:1.2];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 创建悬浮按钮
- (void)creatSuspendButton
{
    self.suspendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.suspendBtn setBackgroundImage:[UIImage imageNamed:@"homeBackButton"] forState:UIControlStateNormal];
    self.suspendBtn.frame = CGRectMake(0, 0, 54, 54);
    [self.suspendBtn addTarget:self action:@selector(clickSuspendButton) forControlEvents:UIControlEventTouchUpInside];
    
    //创建悬浮按钮的window
    self.buttonWin = [[UIWindow alloc] initWithFrame:CGRectMake(25, YGScreenH - 60, 54, 54)];
    //设置win的等级为最高级
    self.buttonWin.windowLevel = UIWindowLevelAlert + 1;
    self.buttonWin.backgroundColor = [UIColor clearColor];
    
    [self.buttonWin addSubview:self.suspendBtn];
    //将buttonWin显示出来
    [self.buttonWin makeKeyAndVisible];
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
/*
 #pragma mark - <UIScrollViewDelegate>
 - (void)scrollViewDidScroll:(UIScrollView *)scrollView
 {
 
 //向上滑动
 if (scrollView.contentOffset.y > _offsetY + 60) {
 //按钮消失
 [self hideSuspendButton];
 
 } else if (scrollView.contentOffset.y < _offsetY) {
 //按钮出现
 [self showSuspendButton];
 }
 }
 #pragma mark - 隐藏按钮
 - (void)hideSuspendButton
 {
 if (self.buttonWin.layer.frame.origin.y == YGScreenH) {
 return;
 }
 [UIView animateWithDuration:.5 animations:^{
 self.suspendBtn.frame = CGRectMake(25, YGScreenH, 54, 54);
 }];
 }
 
 //停止滚动式调用
 - (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
 {
 _offsetY = scrollView.contentOffset.y;
 }
 #pragma mark - 显示按钮
 - (void)showSuspendButton
 {
 if (self.buttonWin.layer.frame.origin.y == YGScreenH) {
 return;
 }
 [UIView animateWithDuration:.5 animations:^{
 CGRect tempFrame = self.suspendBtn.frame;
 tempFrame.origin.y -= 60;
 self.suspendBtn.frame = tempFrame;
 }];
 }
 */

@end
