//
//  YGPicCategoryController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/24.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGPicCategoryController.h"
#import "YGPicCategoryFlowLayout.h"
#import "YGPicCategoryCell.h"
#import "YGPicDetailPageController.h"
@interface YGPicCategoryController ()
@property (nonatomic, strong) NSArray *picCateArr;
@end

@implementation YGPicCategoryController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNetManager];
    [self.collectionView registerClass:[YGPicCategoryCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
}

#pragma mark - 配置网络文件
- (void)configNetManager
{
    [NetManager GETPicCategoryItem:^(YGPicCategoryItem *picCategoryItem, NSError *error) {
        self.picCateArr = picCategoryItem.res.data;
        [self.collectionView reloadData];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.picCateArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YGPicCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    YGPicCategoryResDataItem *dataItem = self.picCateArr[indexPath.row];
    [cell.iconIV setImageWithURL:dataItem.cover.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
    cell.titleLB.text = dataItem.name;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YGPicCategoryResDataItem *dataItem = self.picCateArr[indexPath.row];
    YGPicDetailPageController *detailPageVC = [[YGPicDetailPageController alloc] initWithID:dataItem._id];
    detailPageVC.title = dataItem.name;
    [self.navigationController pushViewController:detailPageVC animated:YES];
}
@end
