//
//  YGListDetailMovieController.h
//  WangYe
//
//  Created by 阳光 on 2017/2/14.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGDetailListItem.h"
@interface YGListDetailMovieController : UIViewController

/** 背景图片 */
@property(nonatomic, strong) NSString *bgImageView;
/** 标题图片 */
@property(nonatomic, strong) NSString *titleView;
/** 简介 */
@property(nonatomic, strong) NSString *detailLabel;
/** 播放地址 */
@property(nonatomic, strong) NSString *url;


- (instancetype)initWithBgImageView:(NSString *)bgImageView titleView:(NSString *)titleView detailLabel:(NSString *)titleLabel url:(NSString *)url;



@end
