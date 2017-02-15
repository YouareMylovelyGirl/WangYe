//
//  YGListController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/8.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGListController.h"
#import "YGListCell.h"
#import "YGListItem.h"
#import "YGListDetailController.h"
@interface YGListController ()
@property (nonatomic, strong) NSArray *listArr;
@end

@implementation YGListController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configNetManager];
    [self.collectionView registerClass:[YGListCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
}

- (void)configNetManager
{
    [NetManager GetListItemCompletionHandler:^(NSArray<YGListItem *> *lists, NSError *error) {
        self.listArr = lists;
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

    return self.listArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YGListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    YGListItem *listItem = self.listArr[indexPath.row];
    [cell.iconIV setImageURL:listItem.bgPicture.yg_URL];
    cell.titLB.text = listItem.name;
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YGListItem *listItem = self.listArr[indexPath.row];
    YGListDetailController *detailVC = [[YGListDetailController alloc] initWithListName:listItem.name];
    detailVC.title = listItem.name;
    [self.navigationController pushViewController:detailVC animated:YES];
}




@end
