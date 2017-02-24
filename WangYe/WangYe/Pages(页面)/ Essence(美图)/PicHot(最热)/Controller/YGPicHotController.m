//
//  YGPicHotController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/25.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGPicHotController.h"
#import "YGPicCell.h"
#import "YGPicAllItem.h"
#import "YGPicPhotoController.h"
@interface YGPicHotController ()
/** 最热数组 */
@property(nonatomic, strong) NSMutableArray<YGPicAllResDataItem *> *picHotArr;
/** 页数个数 */
@property(nonatomic, assign) NSInteger pageCount;
/** 图片数组 */
@property(nonatomic, strong) NSMutableArray *picArr;
@end

@implementation YGPicHotController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNetManager];
    [self.collectionView registerClass:[YGPicCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    
}

#pragma mark - 配置NetManager
- (void)configNetManager
{
    __weak typeof(self) weakSelf = self;
    self.pageCount = 0;
    [self.collectionView addHeaderRefresh:^{
        [NetManager GETPicHotItem:0 completionHandler:^(YGPicAllItem *picHotItem, NSError *error) {
            [weakSelf.collectionView endHeaderRefresh];
            if (error) {
                [weakSelf.view showMessage:@"网络有误..."];
            } else {
                [weakSelf.picHotArr removeAllObjects];
                [weakSelf.picHotArr addObjectsFromArray:picHotItem.res.data];
                
                //清空所有
                [weakSelf.picArr removeAllObjects];
                //便利出图片数组
                for (YGPicAllResDataItem *dataItem in picHotItem.res.data) {
                    [weakSelf.picArr addObject:dataItem.url];
                }
                
                [weakSelf.collectionView reloadData];
                if (picHotItem.res.data.count < 60) {
                    [weakSelf.collectionView endFooterWithNoMore];
                } else {
                    [weakSelf.collectionView resetFooter];
                }
            }
        }];
    }];
    [self.collectionView beginHeaderRefresh];
    [self.collectionView addFooterRefresh:^{
        [NetManager GETPicHotItem:weakSelf.pageCount + 60 completionHandler:^(YGPicAllItem *picHotItem, NSError *error) {
            [weakSelf.collectionView endFooterRefresh];
            if (error) {
                [weakSelf.view showMessage:@"网络有误..."];
            } else {
                weakSelf.pageCount += 60;
                [weakSelf.picHotArr addObjectsFromArray:picHotItem.res.data];

                //便利出图片数组
                for (YGPicAllResDataItem *dataItem in picHotItem.res.data) {
                    [weakSelf.picArr addObject:dataItem.url];
                    
                }
                
                [weakSelf.collectionView reloadData];
                if (picHotItem.res.data.count < 60) {
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
    return self.picHotArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YGPicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    YGPicAllResDataItem *dataItem = self.picHotArr[indexPath.row];
    [cell.iconIV setImageWithURL:dataItem.thumb.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    YGPicPhotoController *photoVC = [[YGPicPhotoController alloc] initWithPicAllItem:self.picArr index:indexPath.row];
    [self.navigationController pushViewController:photoVC animated:YES];
}



- (NSMutableArray *)picArr {
	if(_picArr == nil) {
		_picArr = [[NSMutableArray alloc] init];
	}
	return _picArr;
}

- (NSMutableArray *)picHotArr {
	if(_picHotArr == nil) {
		_picHotArr = [[NSMutableArray<YGPicAllResDataItem *> alloc] init];
	}
	return _picHotArr;
}

@end
