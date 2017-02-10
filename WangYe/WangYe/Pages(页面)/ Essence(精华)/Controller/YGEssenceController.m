//
//  YGEssenceController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/8.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGEssenceController.h"

@interface YGEssenceController ()

@end

@implementation YGEssenceController
/**
 *  cell重用标示
 */
static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNetManager];
    
}
/**
 *  配置网络请求
 */
- (void)configNetManager
{

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//    
//    return cell;
//}



#pragma mark - lazy


/**
 * 计算属性
 */
//14 ~ 16
- (NSInteger)year {
    return arc4random() % (6 - 4 + 1) + 4;
}
//1 ~ 12
- (NSInteger)month {
    return arc4random() % (12 - 1 + 1) + 1;
}
//1 ~ 28
- (NSInteger)day {
    return arc4random() % (28 - 1 + 1) + 1;
}

@end
