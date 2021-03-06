//
//  YGPageController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/15.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGPageController.h"
#import "YGHomeController.h"
#import "YGCategoryController.h"
#import "YGEssenceController.h"
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
    return @[@"最新", @"精华", @"分类"];
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
    if (index == 1) {
        YGEssenceController *essenceVC = [[YGEssenceController alloc] init];
        return essenceVC;
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



@end
