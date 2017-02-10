//
//  YGEssenceController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/8.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGEssenceController.h"
#import "YGEssenceItem.h"
#import "YGEssenceBigCell.h"
#import "YGEssenceCommomCell.h"
#import "YGEssenceImageCell.h"
@interface YGEssenceController ()
/** 精华数组 */
@property(nonatomic, strong) NSMutableArray<YGEssenceResponseFeedsItem *> *essenceArr;
/** 模型 */
@property(nonatomic, strong) YGEssenceItem *essenceItem;
/** 是否还有更多 */
@property(nonatomic, assign) BOOL ishasMore;
/** lastKey */
@property(nonatomic, strong) NSString *lastKey;


@end

@implementation YGEssenceController
/**
 *  cell重用标示
 */
static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    //去掉TableView的线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self configNetManager];
    
}
/**
 *  配置网络请求
 */
- (void)configNetManager
{
    __weak typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [NetManager GETEssenceItem:@"0" completionHandler:^(YGEssenceItem *essences, NSError *error) {
            [weakSelf.tableView endHeaderRefresh];
            if (error) {
                [weakSelf.view showMessage:@"出错啦, 请再试试.."];
            } else {
                weakSelf.essenceItem = essences;
                weakSelf.ishasMore = weakSelf.essenceItem.response.has_more;
                weakSelf.lastKey = weakSelf.essenceItem.response.last_key;
                [weakSelf.essenceArr removeAllObjects];
                [weakSelf.essenceArr addObjectsFromArray:weakSelf.essenceItem.response.feeds];
                [weakSelf.tableView reloadData];
            }
            if (self.ishasMore == NO) {
                [weakSelf.tableView endFooterWithNoMore];
            } else {
                [weakSelf.tableView resetFooter];
            }
        }];
    }];
    //启动头部刷新
    [self.tableView beginHeaderRefresh];
    [self.tableView addFooterRefresh:^{
        [NetManager GETEssenceItem:weakSelf.lastKey completionHandler:^(YGEssenceItem *essences, NSError *error) {
            [weakSelf.tableView endFooterRefresh];
            if (error) {
                [weakSelf.view showMessage:@"出错啦, 请再试试"];
            } else {
                weakSelf.essenceItem = essences;
                weakSelf.ishasMore = weakSelf.essenceItem.response.has_more;
                [weakSelf.essenceArr addObjectsFromArray:weakSelf.essenceItem.response.feeds];
                [weakSelf.tableView reloadData];
            }
            if (self.ishasMore == NO) {
                [weakSelf.tableView endFooterWithNoMore];
            }
            
        }];
    }];
    //注册cell
    [self.tableView registerClass:[YGEssenceCommomCell class] forCellReuseIdentifier:@"YGEssenceCommomCell"];
    [self.tableView registerClass:[YGEssenceBigCell class] forCellReuseIdentifier:@"YGEssenceBigCell"];
    [self.tableView registerClass:[YGEssenceImageCell class] forCellReuseIdentifier:@"YGEssenceImageCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.essenceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YGEssenceResponseFeedsItem *feedsItem = self.essenceArr[indexPath.section];
    if (feedsItem.type == 1) {
        YGEssenceCommomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YGEssenceCommomCell" forIndexPath:indexPath];
//        UIImageView *imageView = [YYAnimatedImageView new];
//        imageView.imageURL = feedsItem.image.yg_URL;
//        cell.iconIV = imageView;
//        [cell.iconIV setImageWithURL:feedsItem.image.yg_URL options:YYWebImageOptionIgnoreAnimatedImage];
        cell.iconIV.imageURL = feedsItem.image.yg_URL;
        cell.titleLB.text = feedsItem.post.title;
        return cell;
    }
    if (feedsItem.type == 0) {
        YGEssenceImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YGEssenceImageCell" forIndexPath:indexPath];
        [cell.iconIV setImageWithURL:feedsItem.image.yg_URL options:YYWebImageOptionIgnoreAnimatedImage];
        return cell;
    }
    YGEssenceBigCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YGEssenceBigCell" forIndexPath:indexPath];
    [cell.iconIV setImageWithURL:feedsItem.image.yg_URL options:YYWebImageOptionSetImageWithFadeAnimation];
    cell.titleLB.text = feedsItem.post.title;
    NSLog(@"%@", cell.titleLB.text);
    cell.detailLB.text = feedsItem.post.des;
    
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGEssenceResponseFeedsItem *feedsItem = self.essenceArr[indexPath.section];
    if (feedsItem.type == 1) {
        return [tableView fd_heightForCellWithIdentifier:@"YGEssenceCommomCell" configuration:^(YGEssenceCommomCell *cell) {
//            [cell.iconIV setImageWithURL:feedsItem.image.yg_URL options:YYWebImageOptionIgnoreAnimatedImage];

            cell.iconIV.imageURL = feedsItem.image.yg_URL;
        }];
    }
    if (feedsItem.type == 0) {
        return [tableView fd_heightForCellWithIdentifier:@"YGEssenceImageCell" configuration:^(YGEssenceImageCell *cell) {
            [cell.iconIV setImageWithURL:feedsItem.image.yg_URL options:YYWebImageOptionIgnoreAnimatedImage];
        }];
    }
    
    return [tableView fd_heightForCellWithIdentifier:@"YGEssenceBigCell" configuration:^(YGEssenceBigCell *cell) {
        cell.titleLB.text = feedsItem.post.title;
        cell.detailLB.text = feedsItem.post.des;
        [cell.iconIV setImageWithURL:feedsItem.image.yg_URL options:YYWebImageOptionIgnoreAnimatedImage];
    }];
    
    
}

#pragma mark - lazy


- (NSMutableArray<YGEssenceResponseFeedsItem *> *)essenceArr {
    if(_essenceArr == nil) {
        _essenceArr = [[NSMutableArray<YGEssenceResponseFeedsItem *> alloc] init];
    }
    return _essenceArr;
}

@end
