//
//  YGAllDetailCategoryController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/19.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGAllDetailCategoryController.h"
#import "YGAllDetailPicCell.h"
#import "YGAllDetailTextCell.h"
#import "YGAllDetailMovieCell.h"
#import "YGAllDetailCategoryItem.h"
#import "YGAllDetailPhotoBrowerController.h"
#import "YGListDetailMovieController.h"
@interface YGAllDetailCategoryController ()<UITableViewDelegate, UITableViewDataSource>
/** 图片视图 */
@property(nonatomic, strong) UIImageView *iconIV;
/** 背景图片 */
@property(nonatomic, strong) UIView *TopNavView;
/** 表头标题 */
@property(nonatomic, strong) UILabel *headLabel;
/** 表头视图 */
@property(nonatomic, strong) UIView *headView;
/** 表视图 */
@property(nonatomic, strong) UITableView *tableView;
/** 返回按钮 */
@property(nonatomic, strong) UIButton *backBtn;
/** 列表数组 */
@property(nonatomic, strong) NSMutableArray *detailCategoryArr;
/** 页数 */
@property(nonatomic, assign) NSInteger pageNum;
/** 是否能够加载更过 */
@property(nonatomic, strong) NSString *canLoadMore;





@end

@implementation YGAllDetailCategoryController

#pragma mark - 构造方法
- (instancetype)initWithImageName:(NSString *)imageName labelName:(NSString *)labelName ID:(NSString *)ID
{
    self = [super init];
    if (self) {
        self.imageName = imageName;
        self.labelName = labelName;
        self.ID = ID;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    [self configNetManager];
    
    [self configUI];
    
    //注册TableViewCell
    [self.tableView registerClass:[YGAllDetailPicCell class] forCellReuseIdentifier:@"YGAllDetailPicCell"];
    [self.tableView registerClass:[YGAllDetailTextCell class] forCellReuseIdentifier:@"YGAllDetailTextCell"];
    [self.tableView registerClass:[YGAllDetailMovieCell class] forCellReuseIdentifier:@"YGAllDetailMovieCell"];
}
#pragma mark - 网络请求
- (void)configNetManager
{
    typeof(self) weakSelf = self;
    
    [NetManager GETAllDetailCategory:1 ID:self.ID completionHandler:^(YGAllDetailCategoryItem *allDetailCategoryItem, NSError *error) {
        if (error) {
            [self.view showMessage:@"网络有误..."];
        } else {
            [self.tableView endHeaderRefresh];
            //停止蒙版
            [self.view hideHUD];
            self.pageNum = 1;
            self.canLoadMore = allDetailCategoryItem.canLoadMore;
            [self.detailCategoryArr addObjectsFromArray:allDetailCategoryItem.articleList];
            [self.tableView reloadData];
            if ([allDetailCategoryItem.canLoadMore isEqualToString:@"0"]) {
                [self.tableView endFooterWithNoMore];
            }
        }
    }];
#warning 为什么不进入这个方法, 不能够下拉刷新
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [NetManager GETAllDetailCategory:self.pageNum + 1 ID:weakSelf.ID completionHandler:^(YGAllDetailCategoryItem *allDetailCategoryItem, NSError *error) {
            if (error) {
                [weakSelf.view showMessage:@"网络有误..."];
            } else
            {
                weakSelf.pageNum += 1;
                weakSelf.canLoadMore = allDetailCategoryItem.canLoadMore;
                [weakSelf.detailCategoryArr addObjectsFromArray:allDetailCategoryItem.articleList];
                [weakSelf.tableView reloadData];
                if ([allDetailCategoryItem.canLoadMore isEqualToString:@"0"]) {
                    [weakSelf.tableView endFooterWithNoMore];
                }
            }
            
        }];
        
    }];
    
    
}

- (void)configUI
{
    CGFloat scale = 365 / 750.0;
    
    /**
     *  配置tableView
     */
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    /**
     *  表头视图背景
     */
    self.headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, YGScreenW, YGScreenW * scale)];
    self.tableView.tableHeaderView = self.headView;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    /**
     *  配置背景图片
     */
    self.iconIV = [[UIImageView alloc] init];
    self.iconIV.contentMode = UIViewContentModeScaleAspectFill;
    self.iconIV.clipsToBounds = YES;
    [self.iconIV setImageWithURL:self.imageName.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
    [self.headView addSubview:self.iconIV];
    [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    
    /**
     *  导航视图View
     */
    self.TopNavView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, YGScreenW, 64)];
    self.TopNavView.backgroundColor = YGRGBColor(254, 254, 254);
    /*********/
    self.TopNavView.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
    self.TopNavView.layer.shadowOffset = CGSizeMake(0,0);
    self.TopNavView.layer.shadowOpacity = 0.6;//阴影透明度，默认0
    self.TopNavView.layer.shadowRadius = 5;//阴影半径，默认3
    /*********/
    self.TopNavView.hidden = YES;
    [self.view addSubview:self.TopNavView];
    
    /**
     *  导航视图上面的标题
     */
    UILabel *topLabel = [[UILabel alloc] init];
    [self.TopNavView addSubview:topLabel];
    topLabel.font = [UIFont systemFontOfSize:19];
    topLabel.text = self.labelName;
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.centerY.offset(10);
    }];
    
    /**
     *  返回按钮
     */
    self.backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Action_backward_white_44x44_"] forState:UIControlStateNormal];
    [self.view addSubview:self.backBtn];
    self.backBtn.frame = CGRectMake(5, 20, 44, 44);
    [self.backBtn addTarget:self action:@selector(goBackLastVC) forControlEvents:UIControlEventTouchUpInside];
    
    /**
     *  表视图文字
     */
    self.headLabel = [[UILabel alloc] init];
    self.headLabel.font = [UIFont boldSystemFontOfSize:17];
    self.headLabel.textColor = [UIColor whiteColor];
    self.headLabel.text = self.labelName;
    [self.iconIV addSubview:self.headLabel];
    [self.headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
    }];
    
}

#pragma mark - 返回上一界面按钮
- (void)goBackLastVC
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - <UITableViewDatasource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.detailCategoryArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGAllDetailCategoryArticlelistItem *articleItem = self.detailCategoryArr[indexPath.row];
    /**
     *  新闻分类
     */
    if ([articleItem.objectType isEqualToString:@"1"]) {
        YGAllDetailTextCell *textCell = [tableView dequeueReusableCellWithIdentifier:@"YGAllDetailTextCell" forIndexPath:indexPath];
        textCell.titleLB.text = articleItem.object.title;
        [textCell.iconIV setImageWithURL:articleItem.object.imgUrl.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
        return textCell;
    }
    
    /**
     *  电影分类
     */
    if ([articleItem.objectType isEqualToString:@"2"]) {
        YGAllDetailMovieCell *movieCell = [tableView dequeueReusableCellWithIdentifier:@"YGAllDetailMovieCell" forIndexPath:indexPath];
        [movieCell.iconIV setImageWithURL:articleItem.object.coverUrl.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
        movieCell.titleLB.text = articleItem.object.title;
        //如果为空就用空字符串代替
        if (articleItem.object.des == nil) {
            movieCell.detailLB.text = @"";
        } else {
            movieCell.detailLB.text = articleItem.object.des;
        }
        return movieCell;
    }
    
    /**
     *  图片分类
     */
    YGAllDetailPicCell *picCell = [tableView dequeueReusableCellWithIdentifier:@"YGAllDetailPicCell" forIndexPath:indexPath];
    [picCell.iconIV setImageWithURL:articleItem.object.imgUrl.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
    picCell.titleLB.text = articleItem.object.des;
    
    
    picCell.detailLB.text = [NSString stringWithFormat:@"《%@》", articleItem.object.sourceAuthor];
    
    
    return picCell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - <生命周期方法>
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //启动蒙版
    [self.view showHUD];
    //去掉TableView的线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //是否隐藏导航栏
    self.navigationController.navigationBarHidden = YES;
    //是否隐藏电池条
    [UIApplication sharedApplication].statusBarHidden = YES;
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //是否隐藏导航栏
    self.navigationController.navigationBarHidden = NO;
    //是否隐藏电池条
    [UIApplication sharedApplication].statusBarHidden = NO;
}

//是否隐藏导航条
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //是否隐藏电池条
    [UIApplication sharedApplication].statusBarHidden = NO;
}


#pragma mark - <UIScrollViewDelegage>
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scale = 365 / 750.0;
    CGPoint p = scrollView.contentOffset;
    [self.iconIV mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.offset(p.y);
    }];
    
    if (p.y >= YGScreenW * scale - 64) {
        self.TopNavView.hidden = NO;
        [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Action_backward_44x44_"] forState:UIControlStateNormal];
        [UIApplication sharedApplication].statusBarHidden = NO;
    } else {
        self.TopNavView.hidden = YES;
        [self.backBtn setBackgroundImage:[UIImage imageNamed:@"Action_backward_white_44x44_"] forState:UIControlStateNormal];
        [UIApplication sharedApplication].statusBarHidden = YES;
    }
    
    [self.headLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
    }];
}

#pragma mark - 高性能计算行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGAllDetailCategoryArticlelistItem *articleItem = self.detailCategoryArr[indexPath.row];
    
    if ([articleItem.objectType isEqualToString:@"1"]) {
        return [tableView fd_heightForCellWithIdentifier:@"YGAllDetailTextCell" configuration:^(YGAllDetailTextCell *cell) {
            
            [cell.iconIV setImageWithURL:articleItem.object.imgUrl.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
        }];
    }
    
    if ([articleItem.objectType isEqualToString:@"2"]) {
        return [tableView fd_heightForCellWithIdentifier:@"YGAllDetailMovieCell" configuration:^(YGAllDetailMovieCell *cell) {
            [cell.iconIV setImageWithURL:articleItem.object.coverUrl.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
            cell.titleLB.text = articleItem.object.title;
            //如果为空就用空字符串代替
            if (articleItem.object.des == nil) {
                cell.detailLB.text = @"";
            } else {
                cell.detailLB.text = articleItem.object.des;
            }
        }];
    }
    
    return [tableView fd_heightForCellWithIdentifier:@"YGAllDetailPicCell" configuration:^(YGAllDetailPicCell *cell) {
        [cell.iconIV setImageWithURL:articleItem.object.imgUrl.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
        cell.titleLB.text = articleItem.object.des;
        cell.detailLB.text = [NSString stringWithFormat:@"《%@》", articleItem.object.sourceAuthor];
    }];
    
    
}


#pragma mark - lazy
- (NSMutableArray *)detailCategoryArr {
    if(_detailCategoryArr == nil) {
        _detailCategoryArr = [[NSMutableArray alloc] init];
    }
    return _detailCategoryArr;
}



@end
