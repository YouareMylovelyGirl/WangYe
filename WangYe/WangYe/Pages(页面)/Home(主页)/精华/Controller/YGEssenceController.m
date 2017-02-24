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
#import "YGEssenceWebController.h"
@interface YGEssenceController ()<iCarouselDelegate, iCarouselDataSource>
/** 精华数组 */
@property(nonatomic, strong) NSMutableArray<YGEssenceResponseFeedsItem *> *essenceArr;
/** 模型 */
@property(nonatomic, strong) YGEssenceItem *essenceItem;
/** 是否还有更多 */
@property(nonatomic, assign) BOOL ishasMore;
/** lastKey */
@property(nonatomic, strong) NSString *lastKey;
/** 滚动视图View */
@property(nonatomic, strong) UIView *headerView;
/** 存放轮播图片 */
@property(nonatomic, strong) NSMutableArray *loopArr;
/** 滚动视图 */
@property(nonatomic, strong) YGEssenceResponseBannersItem *bannerItem;

/** 定时器 */
@property(nonatomic, strong) NSTimer *timer;
/** 滚动视图数组 */
@property(nonatomic, strong) NSMutableArray<YGEssenceResponseBannersItem *> *bannersArr;
/** 标题 */
@property(nonatomic, strong) UILabel *titleLb;
/** ic */
@property(nonatomic, strong) iCarousel *ic;
/** pc */
@property(nonatomic, strong) UIPageControl *pc;


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
    [self configUI];
    
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
                weakSelf.lastKey = essences.response.last_key;
                
                [weakSelf.bannersArr removeAllObjects];
                [weakSelf.essenceArr addObjectsFromArray:essences.response.feeds];
                //装有滚动视图的数组
                [weakSelf.bannersArr addObjectsFromArray:essences.response.banners];
                //删除之前滚动视图中的元素, 避免继续叠加
                [weakSelf.loopArr removeAllObjects];
                for (YGEssenceResponseBannersItem *bannersItem in essences.response.banners) {
                    [weakSelf.loopArr addObject:bannersItem.image];
                }
                
                /********头部滚动*********/
                [weakSelf.timer invalidate];
                if (self.loopArr.count > 0) {
                    weakSelf.tableView.tableHeaderView = weakSelf.headerView;
                    [weakSelf.ic reloadData];
                    weakSelf.pc.numberOfPages = weakSelf.loopArr.count;
                    //如果第一个数组元素为空才进入到这个方法
                    if (weakSelf.titleLb.text.length ==0) {
                        weakSelf.titleLb.text = weakSelf.bannersArr.firstObject.post.title;
                    }
                    
                    
                    _timer = [NSTimer bk_scheduledTimerWithTimeInterval:5 block:^(NSTimer *timer) {
                        [_ic scrollToItemAtIndex:_ic.currentItemIndex + 1 animated:YES];
                    } repeats:YES];
                } else {
                    weakSelf.tableView.tableHeaderView = nil;
                }
                /**********************/
               
                
                [weakSelf.tableView reloadData];
                
                if (essences.response.has_more == NO) {
                    [weakSelf.tableView endFooterWithNoMore];
                } else {
                    [weakSelf.tableView resetFooter];
                }
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
                weakSelf.lastKey = essences.response.last_key;
                [weakSelf.essenceArr addObjectsFromArray:essences.response.feeds];
                [weakSelf.tableView reloadData];
                
                if (essences.response.has_more == NO) {
                    [weakSelf.tableView endFooterWithNoMore];
                }
            }
            
            
        }];
    }];
    //注册cell
    [self.tableView registerClass:[YGEssenceCommomCell class] forCellReuseIdentifier:@"YGEssenceCommomCell"];
    [self.tableView registerClass:[YGEssenceBigCell class] forCellReuseIdentifier:@"YGEssenceBigCell"];
    [self.tableView registerClass:[YGEssenceImageCell class] forCellReuseIdentifier:@"YGEssenceImageCell"];
}

- (void)configUI
{
    self.view.backgroundColor = YGRGBColor(238, 238, 238);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
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
    cell.detailLB.text = feedsItem.post.des;
    
    return cell;
}

#pragma mark - <UITableViewDelegate>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGEssenceResponseFeedsItem *feedsItem = self.essenceArr[indexPath.section];
    if (feedsItem.type != 0) {
        YGEssenceWebController *webVC = [[YGEssenceWebController alloc] initWithAppView:feedsItem.post.appview];
        [self.navigationController pushViewController:webVC animated:YES];
    }
    
}

//高性能计算行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGEssenceResponseFeedsItem *feedsItem = self.essenceArr[indexPath.section];
    if (feedsItem.type == 1) {
        return [tableView fd_heightForCellWithIdentifier:@"YGEssenceCommomCell" configuration:^(YGEssenceCommomCell *cell) {
            
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

#pragma mark - <ic Delegate>
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return self.loopArr.count;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view) {
        view = [[UIView alloc] initWithFrame:carousel.bounds];
        UIImageView *iconIV = [[UIImageView alloc] init];
        [view addSubview:iconIV];
        [iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.offset(0);
            CGFloat scale = 38 / 64.0;
            make.height.mas_equalTo(iconIV.mas_width).multipliedBy(scale);
        }];
        iconIV.tag = 100;
    }
    YYAnimatedImageView *iconIV = [view viewWithTag:100];
    [iconIV setImageWithURL:[NSURL URLWithString:self.loopArr[index]] options:YYWebImageOptionIgnoreAnimatedImage];
    return view;
}
//只有变化时候才会来到这个方法
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    self.titleLb.text = self.bannersArr[carousel.currentItemIndex].post.title;
    self.pc.currentPage = carousel.currentItemIndex;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
        YGEssenceWebController *webVC = [[YGEssenceWebController alloc] initWithAppView:self.bannersArr[index].post.appview];
        [self.navigationController pushViewController:webVC animated:YES];
}

- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    if (option == iCarouselOptionWrap) {
        value = YES;
    }
    return value;
}
#pragma mark - lazy


- (NSMutableArray<YGEssenceResponseFeedsItem *> *)essenceArr {
    if(_essenceArr == nil) {
        _essenceArr = [[NSMutableArray<YGEssenceResponseFeedsItem *> alloc] init];
    }
    return _essenceArr;
}

- (UIView *)headerView {
	if(_headerView == nil) {
		_headerView = [[UIView alloc] init];
        _headerView.backgroundColor = [UIColor whiteColor];
        CGFloat scale = 38 / 64.0;
        _headerView.frame = CGRectMake(0, 0, YGScreenW, YGScreenW * scale + 5);
        
        
        _ic = [[iCarousel alloc] init];
        [self.headerView addSubview:_ic];
        _ic.delegate = self;
        _ic.dataSource = self;
        [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.offset(0);
            make.height.mas_equalTo(_ic.mas_width).multipliedBy(scale);
        }];
//        _ic.scrollSpeed = .2;
        _ic.pagingEnabled = YES;
        if (_ic.isScrolling == YES) {
            [self.timer invalidate];
        }
        
        UIView *cellSeparator = [[UIView alloc] init];
        cellSeparator.backgroundColor = YGRGBColor(238, 238, 238);
        [self.headerView addSubview:cellSeparator];
        [cellSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.left.right.offset(0);
            make.height.mas_equalTo(5).priorityHigh();
        }];
        
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = [UIFont boldSystemFontOfSize:19];
        _titleLb.numberOfLines = 0;
        _titleLb.textColor = [UIColor whiteColor];
        _titleLb.textAlignment = NSTextAlignmentCenter;
        [_ic addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(10);
            make.right.offset(-10);
            make.bottom.mas_equalTo(_ic.mas_bottom).offset(-40);
        }];
        
        _pc = [[UIPageControl alloc] init];
        [self.headerView addSubview:_pc];
        [_pc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(-5);
        }];
	}
	return _headerView;
}

- (NSMutableArray *)loopArr {
	if(_loopArr == nil) {
		_loopArr = [[NSMutableArray alloc] init];
	}
	return _loopArr;
}


- (NSMutableArray<YGEssenceResponseBannersItem *> *)bannersArr {
	if(_bannersArr == nil) {
		_bannersArr = [[NSMutableArray<YGEssenceResponseBannersItem *> alloc] init];
	}
	return _bannersArr;
}


@end
