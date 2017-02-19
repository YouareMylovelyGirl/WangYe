//
//  YGCategoryController.m
//  WangYe
//
//  Created by 阳光 on 2017/2/17.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGCategoryController.h"
#import "YGTopicCell.h"
#import "YGCategoryItem.h"
#import "YGAllCategoryController.h"
#import "YGAllCategoryFlowLayout.h"
@interface YGCategoryController ()<UICollectionViewDelegateFlowLayout>
/** topicRecommend */
@property(nonatomic, strong) NSArray *topicRecommendArr;
/** authorList */
@property(nonatomic, strong) NSArray *authorArr;
/** articleList */
@property(nonatomic, strong) NSArray *articleArr;
/** 表尾视图 */
@property(nonatomic, strong) UIView *footerView;



@end

@implementation YGCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNetManager];
    //去掉TableView的线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - netmanager
- (void)configNetManager
{
    typeof(self) weakSelf = self;
    [self.tableView addHeaderRefresh:^{
        [NetManager GETCategoryItemCompletionHandler:^(YGCategoryItem *cateItem, NSError *error) {
            [weakSelf.tableView endHeaderRefresh];
            if (error) {
                [weakSelf.view showMessage:@"网络有误"];
            } else {
                //添加脚步视图
                weakSelf.tableView.tableFooterView = weakSelf.footerView;
                weakSelf.topicRecommendArr = cateItem.topicRecommendList;
                weakSelf.authorArr = cateItem.authorList;
                weakSelf.articleArr = cateItem.articleList;
                [weakSelf.tableView reloadData];
            }
        }];
    }];
    //注册cell
    [self.tableView beginHeaderRefresh];
    [self.tableView registerClass:[YGTopicCell class] forCellReuseIdentifier:@"YGTopicCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - <UITableViewDelegate>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.topicRecommendArr.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YGCategoryTopicrecommendlistItem *topicItem = self.topicRecommendArr[indexPath.row];
    YGTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YGTopicCell" forIndexPath:indexPath];
    [cell.iconIV setImageWithURL:topicItem.imgUrl.yg_URL placeholder:[UIImage imageNamed:@"placeHolder1"]];
    
    cell.titleLB.text = topicItem.title;
    cell.numberContent.text = [NSString stringWithFormat:@"%ld篇", topicItem.articlesNum];
    return cell;
}

//自动计算行高
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}


- (UIView *)footerView {
    if(_footerView == nil) {
        _footerView = [[UIView alloc] init];
        _footerView.backgroundColor = [UIColor whiteColor];
        _footerView.frame = CGRectMake(0, 0, YGScreenW, 44);
        _footerView.layer.cornerRadius = 3;
        /*********/
        _footerView.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
        _footerView.layer.shadowOffset = CGSizeMake(5,5);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
        _footerView.layer.shadowOpacity = 0.5;//阴影透明度，默认0
        _footerView.layer.shadowRadius = 4;//阴影半径，默认3
        /*********/
        
        UIImageView *dateImage = [[UIImageView alloc] init];
        dateImage.image = [UIImage imageNamed:@"tab_category_46x46_"];
        [_footerView addSubview:dateImage];
        [dateImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(10);
            make.centerY.offset(0);
            make.size.mas_equalTo(44);
        }];
        
        UILabel *titleLB = [[UILabel alloc] init];
        titleLB.text = @"更多专题";
        titleLB.font = [UIFont systemFontOfSize:16];
        [_footerView addSubview:titleLB];
        [titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.left.mas_equalTo(dateImage.mas_right).offset(10);
        }];
        
        UIImageView *goView = [[UIImageView alloc] init];
        goView.image = [UIImage imageNamed:@"ICON_up_44x44_"];
        [_footerView addSubview:goView];
        [goView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-20);
            make.size.mas_equalTo(44);
            make.centerY.offset(0);
        }];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        
        [btn setBackgroundColor:[UIColor clearColor]];
        [_footerView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
        }];
        [btn addTarget:self action:@selector(goAgoEssenceBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _footerView;
}

#pragma mark - 按钮点击方法 跳转到 往期精华
- (void)goAgoEssenceBtnClick:(UIButton *)sender
{
    YGAllCategoryController *cateVC = [[YGAllCategoryController alloc] initWithCollectionViewLayout:[[YGAllCategoryFlowLayout alloc] init]];
    //跳转时候隐藏tabBar
    cateVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:cateVC animated:YES];
}



@end
