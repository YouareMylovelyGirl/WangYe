//
//  YGPicDetailNewCategoryController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/25.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGPicDetailNewCategoryController.h"
#import "YGPicCell.h"
#import "YGPicAllItem.h"
#import "YGPicPhotoController.h"
@interface YGPicDetailNewCategoryController ()
/** 最新数组 */
@property(nonatomic, strong) NSMutableArray *picNewArr;
/** 页数个数 */
@property(nonatomic, assign) NSInteger pageCount;
/** 图片数组 */
@property(nonatomic, strong) NSMutableArray *picArr;
@end

@implementation YGPicDetailNewCategoryController

static NSString * const reuseIdentifier = @"Cell";

#pragma mark - 构造方法
- (instancetype)initWithID:(NSString *)ID
{
    if (self = [super init]) {
        self.ID = ID;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNetManager];
    [self.collectionView registerClass:[YGPicCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 配置NetManager
- (void)configNetManager
{
    __weak typeof(self) weakSelf = self;
    self.pageCount = 0;
    [self.collectionView addHeaderRefresh:^{
        [NetManager GETPicDetailiNewItem:0 ID:weakSelf.ID completionHandler:^(YGPicAllItem *picDetailNewItem, NSError *error) {
            [weakSelf.collectionView endHeaderRefresh];
            if (error) {
                [weakSelf.view showMessage:@"网络有误..."];
            } else {
                [weakSelf.picNewArr removeAllObjects];
                [weakSelf.picNewArr addObjectsFromArray:picDetailNewItem.res.data];
                
                //清空所有
                [weakSelf.picArr removeAllObjects];
                //便利出图片数组
                for (YGPicAllResDataItem *dataItem in picDetailNewItem.res.data) {
                    [weakSelf.picArr addObject:dataItem.url];
                }
                
                
                [weakSelf.collectionView reloadData];
                if (picDetailNewItem.res.data.count < 60) {
                    [weakSelf.collectionView endFooterWithNoMore];
                } else {
                    [weakSelf.collectionView resetFooter];
                }
            }
        }];
    }];
    [self.collectionView beginHeaderRefresh];
    [self.collectionView addFooterRefresh:^{
        [NetManager GETPicDetailiNewItem:weakSelf.pageCount + 60 ID:weakSelf.ID completionHandler:^(YGPicAllItem *picDetailNewItem, NSError *error) {
            [weakSelf.collectionView endFooterRefresh];
            if (error) {
                [weakSelf.view showMessage:@"网络有误..."];
            } else {
                weakSelf.pageCount += 60;
                [weakSelf.picNewArr addObjectsFromArray:picDetailNewItem.res.data];
                
                //便利出图片数组
                for (YGPicAllResDataItem *dataItem in picDetailNewItem.res.data) {
                    [weakSelf.picArr addObject:dataItem.url];
                }
                
                [weakSelf.collectionView reloadData];
                if (picDetailNewItem.res.data.count < 60) {
                    [weakSelf.collectionView endFooterWithNoMore];
                }
            }
        }];
    }];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.picNewArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YGPicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    YGPicAllResDataItem *dataItem = self.picNewArr[indexPath.row];
    [cell.iconIV setImageWithURL:dataItem.thumb.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YGPicPhotoController *photoVC = [[YGPicPhotoController alloc] initWithPicAllItem:self.picArr index:indexPath.row];
    [self.navigationController pushViewController:photoVC animated:YES];
}

#pragma mark - lazy
- (NSMutableArray *)picNewArr {
    if(_picNewArr == nil) {
        _picNewArr = [[NSMutableArray alloc] init];
    }
    return _picNewArr;
}

- (NSMutableArray *)picArr {
	if(_picArr == nil) {
		_picArr = [[NSMutableArray alloc] init];
	}
	return _picArr;
}

@end
