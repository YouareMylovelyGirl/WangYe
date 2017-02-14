//
//  YGListDetailMovieController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/14.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGListDetailMovieController.h"

@interface YGListDetailMovieController ()
{
    //播放器
    HcdCacheVideoPlayer *_play;
    
}
/** 背景 */
@property(nonatomic, strong) UIImageView *bgView;
/** 头像 */
@property(nonatomic, strong) UIImageView *headView;
/** 详细 */
@property(nonatomic, strong) UILabel *detailLb;
/** 影片简介 */
@property(nonatomic, strong) UILabel *constLabel;
/** 播放按钮 */
@property(nonatomic, strong) UIButton *playBtn;
// 计算属性, 屏幕大小
@property (nonatomic, assign) CGSize screenSize;

@end

@implementation YGListDetailMovieController



- (instancetype)initWithBgImageView:(NSString *)bgImageView titleView:(NSString *)titleView detailLabel:(NSString *)titleLabel url:(NSString *)url;
{
    self = [super init];
    if (self) {
        self.titleView = titleView;
        self.bgImageView = bgImageView;
        self.detailLabel = titleLabel;
        self.url = url;
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
}
//配置播放界面
- (void)configUI
{
    self.bgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, YGScreenW, YGScreenH)];
    self.bgView.userInteractionEnabled = YES;
    [self.bgView setImageURL:self.bgImageView.yg_URL];
    [self.view addSubview:self.bgView];
    
    self.headView = [[UIImageView alloc] init];
    [self.headView setImageURL:self.titleView.yg_URL];
    self.headView.userInteractionEnabled = YES;
    [self.bgView addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(64);
        CGFloat scale = 27 / 32.0;
        make.height.mas_equalTo(self.headView.mas_width).multipliedBy(scale);
    }];
    
    self.constLabel = [[UILabel alloc] init];
    self.constLabel.font = [UIFont boldSystemFontOfSize:18];
    self.constLabel.textColor = [UIColor whiteColor];
    self.constLabel.text = @"影片简介:";
    [self.bgView addSubview:self.constLabel];
    [self.constLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.top.mas_equalTo(self.headView.mas_bottom).offset(10);
    }];
    
    self.detailLb = [[UILabel alloc] init];
    self.detailLb.text = self.detailLabel;
    self.detailLb.textColor = [UIColor whiteColor];
    self.detailLb.numberOfLines = 0;
    [self.bgView addSubview:self.detailLb];
    [self.detailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.right.offset(-10);
        make.top.mas_equalTo(self.constLabel.mas_bottom).offset(10);
    }];
    
    self.playBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.playBtn setImage:[UIImage imageNamed:@"play_button"] forState:UIControlStateNormal];
    [self.headView addSubview:self.playBtn];
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
        make.size.mas_equalTo(60);
    }];
    [self.playBtn addTarget:self action:@selector(playMovie) forControlEvents:UIControlEventTouchUpInside];
}

//播放视频
- (void)playMovie
{
    self.headView.hidden = YES;
    //    self.constLabel.hidden = YES;
    //    self.detailLb.hidden = YES;
    //点击后创建播放界面
    _play = [[HcdCacheVideoPlayer alloc] init];
    UIView *videoView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, YGScreenW, YGScreenW * 27 / 32.0)];
    
    [self.view addSubview:videoView];
    //播放
    [_play playWithUrl:self.url.yg_URL showView:videoView andSuperView:self.view withCache:YES];
    NSLog(@"%@", NSHomeDirectory());
    
    NSLog(@"%f", [HcdCacheVideoPlayer allVideoCacheSize]);

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 生命周期方法
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_play stop];
#warning WAIT TODO:在这里先清除全部缓存
    [HcdCacheVideoPlayer clearAllVideoCache];
    
}

- (CGSize)screenSize
{
    return [UIScreen mainScreen].bounds.size;
}

@end
