//
//  YGAgoEssenceController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/17.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGAgoEssenceController.h"
#import "YGAgoFlowLayout.h"
#import "YGAgoCell.h"
#import "YGAgoEssenceItem.h"
#import "YGEssenceWebController.h"
@interface YGAgoEssenceController ()<UICollectionViewDelegate, UICollectionViewDataSource>
/** collectionView */
@property(nonatomic, strong) UICollectionView *collectionView;
/** 往期数组 */
@property(nonatomic, strong) NSArray<YGAgoEssenceInfolistItem *> *agoArr;

@end

@implementation YGAgoEssenceController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionView];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.view.backgroundColor = [UIColor whiteColor];
    [self configNetManager];
    
    [self.collectionView registerClass:[YGAgoCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}

#pragma mark - 配置NetManager
- (void)configNetManager
{
    [NetManager GETAgoEssenceCompletionHandler:^(YGAgoEssenceItem *agoItem, NSError *error) {
        self.agoArr = agoItem.infoList;
        [self.collectionView reloadData];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.agoArr.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    YGAgoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    YGAgoEssenceInfolistItem *infoItem = self.agoArr[indexPath.row];
    [cell.iconIV setImageWithURL:infoItem.object.imageRecommend.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
    //设置圆角
    cell.iconIV.layer.cornerRadius = 5;
    cell.titleLB.text = infoItem.object.title;
    if (infoItem.object.des.length == 0) {
        cell.detailLB.numberOfLines = 3;
        cell.detailLB.text = infoItem.object.descriptionRecommend;
    } else {
        cell.detailLB.numberOfLines = 3;
        cell.detailLB.text = infoItem.object.des;
    }
    return cell;
}

#pragma mark - <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    YGAgoEssenceInfolistItem *infoItem = self.agoArr[indexPath.row];
    YGEssenceWebController *webVC = [[YGEssenceWebController alloc] initWithAppView:infoItem.object.articleContentUrl];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (UICollectionView *)collectionView {
    if(_collectionView == nil) {
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[YGAgoFlowLayout alloc] init]];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

@end
