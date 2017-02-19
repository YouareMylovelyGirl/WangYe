//
//  UIScrollView+Refresh.m
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)
- (void)addHeaderRefresh:(void(^)())block{
    //    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
    self.mj_header = header;
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    //自动更改透明度, 初始值为alpha 0
    header.automaticallyChangeAlpha = YES;
}
- (void)endHeaderRefresh{
    [self.mj_header endRefreshing];
}
- (void)beginHeaderRefresh{
    [self.mj_header beginRefreshing];
}

- (void)addFooterRefresh:(void(^)())block{
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:block];
}
- (void)endFooterRefresh{
    [self.mj_footer endRefreshing];
}
- (void)endFooterWithNoMore{
    [self.mj_footer endRefreshingWithNoMoreData];
}
- (void)resetFooter{
    [self.mj_footer resetNoMoreData];
}
@end
