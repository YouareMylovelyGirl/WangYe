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
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:block];
}
- (void)endHeaderRefresh{
    [self.mj_header endRefreshing];
}
- (void)beginHeaderRefresh{
    [self.mj_header beginRefreshing];
}

- (void)addFooterRefresh:(void(^)())block{
    self.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:block];
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
