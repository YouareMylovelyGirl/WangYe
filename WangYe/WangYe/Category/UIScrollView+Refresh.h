//
//  UIScrollView+Refresh.h
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)
- (void)addHeaderRefresh:(void(^)())block;
- (void)endHeaderRefresh;
- (void)beginHeaderRefresh;

- (void)addFooterRefresh:(void(^)())block;
- (void)endFooterRefresh;
- (void)endFooterWithNoMore;
- (void)resetFooter;

@end
