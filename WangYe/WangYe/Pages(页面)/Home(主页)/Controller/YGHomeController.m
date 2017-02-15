//
//  YGHomeController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/15.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGHomeController.h"
#import "YGHomeItem.h"
#import "YGHomeCell.h"

@interface YGHomeController ()<UITableViewDelegate, UITableViewDataSource>
/**
 *  tableView
 */
@property (nonatomic, strong) UITableView *tableView;
/**
 *  分页加载页数
 */
@property (nonatomic, assign) NSInteger pageNum;
@property (nonatomic, strong) NSMutableArray<YGHomeVideosItem *> *homeListArr;
/** 分页索引值数组 */
@property(nonatomic, strong) NSArray *pageArr;



@end

@implementation YGHomeController

#pragma mark - 初始化方法
- (instancetype)initWithIndexPath:(NSInteger)index
{
    self = [super init];
    if (self) {
        self.index = index;
    }
    return self;
}


#pragma mark - life
- (void)viewDidLoad {
    [super viewDidLoad];
    [self tableView];
    [self configNetManager];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 200;
    //去掉TableView的线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}

- (void)configNetManager
{
    
    self.pageNum = 1;
    typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [NetManager GETHomeItem:weakSelf.pageArr[weakSelf.index] page:1 completionHandler:^(YGHomeItem *homeItem, NSError *error) {
            [weakSelf.tableView endHeaderRefresh];
            if (error) {
                [weakSelf.view showMessage:@"网络有误.."];
            } else {
                [weakSelf.homeListArr removeAllObjects];
                [weakSelf.homeListArr addObjectsFromArray:homeItem.videos];
                [weakSelf.tableView reloadData];
                if (homeItem.videos.count < 20) {
                    [weakSelf.tableView endFooterWithNoMore];
                } else {
                    [weakSelf.tableView resetFooter];
                }
            }
        }];
    }];
    [self.tableView beginHeaderRefresh];
    [self.tableView registerClass:[YGHomeCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView addFooterRefresh:^{
        [NetManager GETHomeItem:weakSelf.pageArr[weakSelf.index] page:self.pageNum + 1 completionHandler:^(YGHomeItem *homeItem, NSError *error) {
            [weakSelf.tableView endFooterRefresh];
            if (error) {
                [weakSelf.view showMessage:@"网络有误.."];
            } else {
                [weakSelf.homeListArr addObjectsFromArray:homeItem.videos];
                [weakSelf.tableView reloadData];
                if (homeItem.videos.count < 20) {
                    [weakSelf.tableView endFooterWithNoMore];
                }
            }
        }];
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UITableViewDelegate>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.homeListArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    YGHomeVideosItem *videoItem = self.homeListArr[indexPath.row];
    //    [cell.iconIV setImageURL:videoItem.still.yg_URL];
    [cell.iconIV setImageWithURL:videoItem.still.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
    cell.titleLB.text = videoItem.title;
    cell.detailLB.text = [NSString stringWithFormat:@"%02ld'%02ld\"", videoItem.duration / 60, videoItem.duration % 60];
    
    return cell;
}

#pragma mark - <UITableViewDataSource>
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}
#pragma mark - lazy
- (UITableView *)tableView {
    if(_tableView == nil) {
        _tableView = [[UITableView alloc] init];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(UIEdgeInsetsZero);
        }];
    }
    return _tableView;
}



- (NSMutableArray<YGHomeVideosItem *> *)homeListArr {
    if(_homeListArr == nil) {
        _homeListArr = [[NSMutableArray<YGHomeVideosItem *> alloc] init];
    }
    return _homeListArr;
}

- (NSArray *)pageArr
{
    if (_pageArr == nil) {
        _pageArr = [[NSArray alloc] init];
        _pageArr = @[@"16", @"2", @"1", @"4", @"5", @"3", @"23", @"22"];
    }
    return _pageArr;
}


#warning BBBBBBBBBBB //http://192.168.2.7:8808/play?type=1&infohash=3B3CE28D1E725C1A4702F8745381DA07D7F31084&filename=17978679.mp4
@end
