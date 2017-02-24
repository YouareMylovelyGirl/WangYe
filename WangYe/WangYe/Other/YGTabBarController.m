//
//  YGTabBarController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/8.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGTabBarController.h"
#import "YGHomeController.h"
#import "YGEssenceController.h"
#import "YGListController.h"
#import "YGListFlowLayout.h"
#import "YGPageController.h"
#import "YGPicPageController.h"
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
    
    YGPicPageController *picPageVC = [[YGPicPageController alloc] init];
    picPageVC.title = @"美图";
    picPageVC.tabBarItem.image = @"tab_btn_list_default".yg_image;
    picPageVC.tabBarItem.selectedImage = @"tab_btn_list_select".yg_image;
    UINavigationController *picPageNavi = [[UINavigationController alloc] initWithRootViewController:picPageVC];
    
    YGListController *listVC = [[YGListController alloc] initWithCollectionViewLayout:[[YGListFlowLayout alloc] init]];
    listVC.title = @"视频";
    listVC.tabBarItem.image = @"nav_ic_columns_default".yg_image;
    listVC.tabBarItem.selectedImage = @"nav_ic_columns_selected".yg_image;
    UINavigationController *listNavi = [[UINavigationController alloc] initWithRootViewController:listVC];
    
    self.viewControllers = @[homeNavi, picPageNavi, listNavi];
}


#pragma mark - 关闭设备自动旋转, 然后手动监测设备旋转方向来旋转avplayerView
-(BOOL)shouldAutorotate{
    return NO;
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



