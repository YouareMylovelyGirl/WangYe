# 往夜 -- 原来世界如此性感
![头像](http://olptnowq8.bkt.clouddn.com/%E5%9B%BE%E6%A0%87.png)


![往夜预览](http://olptnowq8.bkt.clouddn.com/%E5%BE%80%E5%A4%9C%E9%A2%84%E8%A7%88.gif)


---

##项目简介
- 项目为纯代码编写, 项目周期为14天。
- APP分为三个大模块
    - 往夜模块
    - 精选模块
    - 专题模块

---

##项目展示分析
- 整体结构
![Snip20170221_1](http://olptnowq8.bkt.clouddn.com/Snip20170221_1.png)


- 用到的三方轮子
![Snip20170221_2](http://olptnowq8.bkt.clouddn.com/Snip20170221_2.png)



##项目时间轴

###2017年2月7日
 ![Snip20170221_3](http://olptnowq8.bkt.clouddn.com/Snip20170221_3.png)
 
- **网络工具类编写**

```objc
#import <Foundation/Foundation.h>
@interface BaseNetManager : NSObject
//GET
+ (id)GET:(NSString *)path param:(NSDictionary *)param completionHandler:(void(^)(id obj, NSError *error))completionHandler;
//POST
+ (id)POST:(NSString *)path param:(NSDictionary *)param completionHandler:(void(^)(id obj, NSError *error))completionHandler;
@end
```

```objc
//GET 
@implementation BaseNetManager
+ (id)GET:(NSString *)path param:(NSDictionary *)param completionHandler:(void (^)(id, NSError *))completionHandler
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 10;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    return [manager GET:path parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        !completionHandler ?: completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

//POST
+ (id)POST:(NSString *)path param:(NSDictionary *)param completionHandler:(void (^)(id, NSError *))completionHandler
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 15;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", @"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
    return [manager POST:path parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", task.currentRequest.URL.absoluteString);
        !completionHandler ?: completionHandler(responseObject, nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        !completionHandler ?: completionHandler(nil, error);
    }];
}
@end
```

###2017年2月8日
![Snip20170221_4](http://olptnowq8.bkt.clouddn.com/Snip20170221_4.png)


```objc
#import "YGTabBarController.h"
#import "YGHomeController.h"
#import "YGEssenceController.h"
#import "YGListController.h"
#import "YGListFlowLayout.h"
#import "YGPageController.h"
@interface YGTabBarController ()

@end

@implementation YGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self allPropertySetup];
    [self setupAllControllers];
}

#pragma mark - 全局属性
- (void)allPropertySetup
{
    [UITabBar appearance].tintColor = YGRGBColor(67, 67, 67);
    [UINavigationBar appearance].tintColor = YGRGBColor(67, 67, 67);
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName: YGRGBColor(67, 67, 67)} forState:UIControlStateSelected];
    
    [UIImageView appearance].contentMode = UIViewContentModeScaleAspectFill;
    [UIImageView appearance].clipsToBounds = YES;
    [UICollectionView appearance].backgroundColor = YGBgColor;
    [UIImageView appearance].contentMode = UIViewContentModeScaleAspectFill;
    [UIImageView appearance].clipsToBounds = YES;
}

#pragma mark - 创建所有tabBar子控制器
- (void)setupAllControllers
{
    YGPageController *pageVC = [[YGPageController alloc] init];
    pageVC.tabBarItem.image = @"nav_ic_home_default".yg_image;
    pageVC.tabBarItem.selectedImage = @"nav_ic_home_selected".yg_image;
    pageVC.title = @"往夜";
    UINavigationController *homeNavi = [[UINavigationController alloc] initWithRootViewController:pageVC];
    
    YGEssenceController *essenceVC = [[YGEssenceController alloc] initWithStyle:UITableViewStylePlain];
    essenceVC.title = @"精选";
    essenceVC.tabBarItem.image = @"tab_btn_list_default".yg_image;
    essenceVC.tabBarItem.selectedImage = @"tab_btn_list_select".yg_image;
    UINavigationController *essenceNavi = [[UINavigationController alloc] initWithRootViewController:essenceVC];
    
    YGListController *listVC = [[YGListController alloc] initWithCollectionViewLayout:[[YGListFlowLayout alloc] init]];
    listVC.title = @"专题";
    listVC.tabBarItem.image = @"nav_ic_columns_default".yg_image;
    listVC.tabBarItem.selectedImage = @"nav_ic_columns_selected".yg_image;
    UINavigationController *listNavi = [[UINavigationController alloc] initWithRootViewController:listVC];
    
    self.viewControllers = @[homeNavi, essenceNavi, listNavi];
}


#pragma mark - 关闭设备自动旋转, 然后手动监测设备旋转方向来旋转avplayerView
-(BOOL)shouldAutorotate{
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
```

###2017年2月9日 - 2017年2月13日
![Snip20170221_9](http://olptnowq8.bkt.clouddn.com/Snip20170221_9.png)



- 往夜资讯， 我从稍微简单的页面入手 -- 精华模块
![Snip20170221_6](http://olptnowq8.bkt.clouddn.com/Snip20170221_6.png)


- 整体为TableViewController， 里面分为三种Cell
    - 整体用masonry进行Layout布局
    - 界面整体比较简单， 其中Cell自适应高度， 我使用的[UITableView-FDTemplateLayoutCell](https://github.com/forkingdog/UITableView-FDTemplateLayoutCell)进行高性能自适应高度， 前百度forkingdog团队, 现在的滴滴打车的iOS大神Sunnyxx发布的高性能Cell自动高度计算框架.
    
```objc
//高性能计算行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGEssenceResponseFeedsItem *feedsItem = self.essenceArr[indexPath.section];
    if (feedsItem.type == 1) {
        return [tableView fd_heightForCellWithIdentifier:@"YGEssenceCommomCell" configuration:^(YGEssenceCommomCell *cell) {
            
            cell.iconIV.imageURL = feedsItem.image.yg_URL;
        }];
    }
    if (feedsItem.type == 0) {
        return [tableView fd_heightForCellWithIdentifier:@"YGEssenceImageCell" configuration:^(YGEssenceImageCell *cell) {
            [cell.iconIV setImageWithURL:feedsItem.image.yg_URL options:YYWebImageOptionIgnoreAnimatedImage];
        }];
    }
    
    return [tableView fd_heightForCellWithIdentifier:@"YGEssenceBigCell" configuration:^(YGEssenceBigCell *cell) {
        cell.titleLB.text = feedsItem.post.title;
        cell.detailLB.text = feedsItem.post.des;
        [cell.iconIV setImageWithURL:feedsItem.image.yg_URL options:YYWebImageOptionIgnoreAnimatedImage];
    }];
  
}
```
- 精华模块主要是资讯信息， 里面用到的是UIWebView来显示， 里面有一个退出按钮的小动画， 让我稍微琢磨了一小下。

```objc
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

//停止滚动式调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
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
```
- 具体示例
![往夜资讯 webVie](http://olptnowq8.bkt.clouddn.com/%E5%BE%80%E5%A4%9C%E8%B5%84%E8%AE%AF%20webView.gif)



###2017年2月14日 - 2017年2月15日
![Snip20170221_10](http://olptnowq8.bkt.clouddn.com/Snip20170221_10.png)



- 栏目模块结构
![Snip20170221_8](http://olptnowq8.bkt.clouddn.com/Snip20170221_8.png)


- 专题模块分为三次跳转
    - 第一个界面`UICollectionViewController`
    - 第二个界面`UITableViewController `
    - 第三个界面播放界面`UIViewController`
- 专题模块 和 列表详细整体masonry布局
- 列表详细播放中的播放我采用的是`HcdCachePlayer`
    - `HcdCachePlayer`对于整体播放， 缓存有着良好的集成

```objc
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
```
- 视频展示
![往夜视频](http://olptnowq8.bkt.clouddn.com/%E5%BE%80%E5%A4%9C%E8%A7%86%E9%A2%91.gif)

###2017年2月16日
- 开始往夜模块编写
- 插曲
    - 将Model层， View层全部写完， Controller层全部写完， 就差播放视频， 发现视频加密， 显示的全部垃圾广告。一晚白忙。此时凌晨3：35。
    
###2017年2月17日 - 2月19日
![Snip20170221_11](http://olptnowq8.bkt.clouddn.com/Snip20170221_11.png)


- 往夜 “往” 模块分为两种Cell
![Snip20170221_13](http://olptnowq8.bkt.clouddn.com/Snip20170221_13.png)


    - 一种Cell为资讯展示
    - 一种Cell为视频展示
     
![Snip20170221_12](http://olptnowq8.bkt.clouddn.com/Snip20170221_12.png)


- 往夜 “夜” 模块

![Snip20170221_14](http://olptnowq8.bkt.clouddn.com/Snip20170221_14.png)


- ”夜“模块
    - 第一个界面为TableviewController
- 点入”更多专题“为UICollectionViewController
- 点入专题详细列表， 表头为拉伸图片， 下面是tableview 

![往夜资讯 更过栏目](http://olptnowq8.bkt.clouddn.com/%E5%BE%80%E5%A4%9C%E8%B5%84%E8%AE%AF%20%E6%9B%B4%E8%BF%87%E6%A0%8F%E7%9B%AE.gif)


- 更多专题中有显示图片的专题
    - 我用的是`MWPhotoBrowser` 这个框架
![往夜资讯 栏目图片](http://olptnowq8.bkt.clouddn.com/%E5%BE%80%E5%A4%9C%E8%B5%84%E8%AE%AF%20%E6%A0%8F%E7%9B%AE%E5%9B%BE%E7%89%87.gif)


###2017年2月20日
![Snip20170221_16](http://olptnowq8.bkt.clouddn.com/Snip20170221_16.png)


- 收尾

##整体分析
- 项目主要以展示资讯，新闻，影视短片为主。
- 项目架构简约，整体色调灰黑色。
- 整个项目没有xib 或者 sb参与

##项目中细节梳理
- **头部无限轮播**
 -  使用`iCarousel`三方搭建。
    - 本来有考虑使用自己写的一个[无限轮播](https://github.com/YouareMylovelyGirl/LoopView) 框架，但是我没有别的封装，仅仅只是实现了高性能轮播。所以我是用了 `iCarousel`三方搭建。
    

```objc
#pragma mark - <ic Delegate>
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.loopArr.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc] initWithFrame:carousel.bounds];
        UIImageView *iconIV = [[UIImageView alloc] init];
        [view addSubview:iconIV];
        [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.offset(0);
            CGFloat scale = 38 / 64.0;
            make.height.mas_equalTo(iconIV.mas_width).multipliedBy(scale);
        }];
        iconIV.tag = 100;
    }
    YYAnimatedImageView *iconIV = [view viewWithTag:100];
    [iconIV setImageWithURL:[NSURL URLWithString:self.loopArr[index]] options:YYWebImageOptionIgnoreAnimatedImage];
    return view;
}
//只有变化时候才会来到这个方法
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    self.titleLb.text = self.bannersArr[carousel.currentItemIndex].post.title;
    self.pc.currentPage = carousel.currentItemIndex;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
        YGEssenceWebController *webVC = [[YGEssenceWebController alloc] initWithAppView:self.bannersArr[index].post.appview];
        [self.navigationController pushViewController:webVC animated:YES];
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}

```

- **“往夜”模块头部横向滚动**
    -  使用的是一款`WMPageController`的三方控件

```objc
@interface YGPageController ()

@end

@implementation YGPageController

//初始化方法
- (instancetype)init
{
    if (self = [super init]) {
        self.menuBGColor = YGRGBColor(249, 249, 249);
        
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        self.titleSizeNormal = 20;
        self.titleSizeSelected = self.titleSizeNormal;
        
        self.titleColorSelected = self.titleColorNormal;
        self.automaticallyCalculatesItemWidths = YES; //根据题目的内容自动算宽度
        self.itemMargin = 30; //题目的间距
        self.menuHeight = 44;
        self.showOnNavigationBar = YES;
    }
    return self;
}

- (NSArray<NSString *> *)titles
{
    return @[@"往", @"夜"];
}


- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return self.titles.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    if (index == 0) {
        YGHomeController *homeVC = [[YGHomeController alloc] init];
        return homeVC;
    }
    YGCategoryController *cateVC = [[YGCategoryController alloc] init];
    return cateVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

```


---
#### YG -- 阳光
##### 业余时间的作品，每天晚上11点开始码代码，平均凌晨4点左右结束，早上9点还要忙自己的事情。
##### 如果觉得写得还不错请给予一颗小⭐️⭐️

[GitHub地址](https://github.com/YouareMylovelyGirl)
[博客园地址](http://www.cnblogs.com/Dog-Ping/)
[往夜 项目地址](https://github.com/YouareMylovelyGirl/WangYe)






