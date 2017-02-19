//
//  YGAllCategoryController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/19.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGAllCategoryController.h"
#import "YGAllCategoryItem.h"
#import "YGAllcategoryCell.h"
#import "YGAllDetailCategoryController.h"
@interface YGAllCategoryController ()
//全部分类数组
@property (nonatomic, strong) NSMutableArray *categoryArr;
@property (nonatomic, assign) NSInteger pageNum;
//是否还有下一页
@property (nonatomic, strong) NSString *hasMorePage;
@end

@implementation YGAllCategoryController

static NSString * const reuseIdentifier = @"Cell";
#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];

    [self configNetManager];
    
    //注册UICollectionViewCell
    [self.collectionView registerClass:[YGAllCategoryCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

#pragma mark - 配置网络
- (void)configNetManager
{
    self.pageNum = 1;
    typeof(self) weakSelf = self;
    
    //头部刷新
    [self.collectionView addHeaderRefresh:^{
        [NetManager GETAllCategory:1 completionHandler:^(YGAllCategoryItem *allCategoryItem, NSError *error) {
            [weakSelf.collectionView endHeaderRefresh];
            if (error) {
                [weakSelf.view showMessage:@"网络有误..."];
            } else {
                weakSelf.hasMorePage = allCategoryItem.canLoadMore;
                [weakSelf.categoryArr removeAllObjects];
                [weakSelf.categoryArr addObjectsFromArray:allCategoryItem.topicList];
                [weakSelf.collectionView reloadData];
                if ([weakSelf.hasMorePage isEqualToString:@"0"]) {
                    [weakSelf.collectionView endFooterWithNoMore];
                } else {
                    [weakSelf.collectionView resetFooter];
                }
            }
        }];
    }];
    [self.collectionView beginHeaderRefresh];
    
    //脚部刷新
    [self.collectionView addFooterRefresh:^{
        [NetManager GETAllCategory:self.pageNum + 1 completionHandler:^(YGAllCategoryItem *allCategoryItem, NSError *error) {
            [weakSelf.collectionView endFooterRefresh];
            if (error) {
                [weakSelf.view showMessage:@"网络有误..."];
            } else {
                weakSelf.hasMorePage = allCategoryItem.canLoadMore;
                weakSelf.hasMorePage = allCategoryItem.canLoadMore;
                [weakSelf.categoryArr addObjectsFromArray:allCategoryItem.topicList];
                [weakSelf.collectionView reloadData];
                if ([weakSelf.hasMorePage isEqualToString:@"0"]) {
                    [weakSelf.collectionView endFooterWithNoMore];
                }
            }
        }];
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
    
    return self.categoryArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YGAllCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    YGAllCategoryTopiclistItem *topicItem = self.categoryArr[indexPath.row];
    [cell.iconIV setImageWithURL:topicItem.imgUrl.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
    cell.titleLB.text = topicItem.title;
    cell.numberContent.text = [NSString stringWithFormat:@"%ld篇", topicItem.articlesNum];
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YGAllCategoryTopiclistItem *topicItem = self.categoryArr[indexPath.row];
    YGAllDetailCategoryController *detailCateVC = [[YGAllDetailCategoryController alloc] initWithImageName:topicItem.imgUrl labelName:topicItem.title ID:topicItem.ID];
    [self.navigationController pushViewController:detailCateVC animated:YES];
}


#pragma mark - lazy
- (NSMutableArray *)categoryArr {
    if(_categoryArr == nil) {
        _categoryArr = [[NSMutableArray alloc] init];
    }
    return _categoryArr;
}

@end
