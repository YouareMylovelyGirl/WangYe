//
//  YGPicPageController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/24.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGPicPageController.h"
#import "YGPicCategoryController.h"
#import "YGPicCategoryFlowLayout.h"
#import "YGPicHotController.h"
#import "YGPicFlowLayout.h"
#import "YGPicNewController.h"
@interface YGPicPageController ()

@end

@implementation YGPicPageController
//初始化方法
- (instancetype)init
{
    if (self = [super init]) {
        self.menuBGColor = YGRGBColor(249, 249, 249);
        
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuViewLayoutMode = WMMenuViewLayoutModeCenter;
        self.titleSizeNormal = 14;
        self.titleSizeSelected = 16;
        
        self.titleColorSelected = [UIColor orangeColor];
        //        self.automaticallyCalculatesItemWidths = YES; //根据题目的内容自动算宽度
        self.itemMargin = 30; //题目的间距
        self.menuHeight = 44;
        //        self.showOnNavigationBar = YES;
    }
    return self;
}

- (NSArray<NSString *> *)titles
{
    return @[@"最新", @"最热", @"分类"];
}


- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return self.titles.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    if (index == 0) {
        YGPicNewController *newVC = [[YGPicNewController alloc] initWithCollectionViewLayout:[[YGPicFlowLayout alloc] init]];
        return newVC;
    }
    if (index == 1) {
        YGPicHotController *hotVC = [[YGPicHotController alloc] initWithCollectionViewLayout:[[YGPicFlowLayout alloc] init]];
        return hotVC;
    }
    YGPicCategoryController *allCateVC = [[YGPicCategoryController alloc] initWithCollectionViewLayout:[[YGPicCategoryFlowLayout alloc] init]];
    return allCateVC;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
