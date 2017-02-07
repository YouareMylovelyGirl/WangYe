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
- (void)beginHeaderRefresh;
- (void)endHeaderRefresh;

- (void)addFooterRefresh:(void(^)())block;
- (void)endFooterWithNoMore;
- (void)endFooterRefresh;
- (void)resetFooter;
@end
