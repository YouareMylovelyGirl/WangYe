//
//  YGPicDetailPageController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/25.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGPicDetailPageController.h"
#import "YGPicDetailNewCategoryController.h"
#import "YGPicFlowLayout.h"
#import "YGPicDetailHotCategoryController.h"
@interface YGPicDetailPageController ()

@end

@implementation YGPicDetailPageController

//初始化方法
- (instancetype)initWithID:(NSString *)ID
{
    if (self = [super init]) {
        self.ID = ID;
        self.menuBGColor = YGRGBColor(249, 249, 249);
        
        self.menuViewStyle = WMMenuViewStyleLine;
        self.titleSizeNormal = 14;
        self.titleSizeSelected = 16;
        self.titleColorSelected = [UIColor orangeColor];

    }
    return self;
}

- (NSArray<NSString *> *)titles
{
    return @[@"最新", @"精华"];
}


- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController
{
    return self.titles.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index
{
    if (index == 0) {
        YGPicDetailNewCategoryController *newVC = [[YGPicDetailNewCategoryController alloc] initWithCollectionViewLayout:[[YGPicFlowLayout alloc] init]];
        newVC.ID = self.ID;
        
        return newVC;
    }
    
    YGPicDetailHotCategoryController *hotVC = [[YGPicDetailHotCategoryController alloc] initWithCollectionViewLayout:[[YGPicFlowLayout alloc] init]];
    hotVC.ID = self.ID;
    return hotVC;
    
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
