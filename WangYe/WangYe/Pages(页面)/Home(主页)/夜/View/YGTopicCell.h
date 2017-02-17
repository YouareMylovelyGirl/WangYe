//
//  YGTopicCell.h
//  WangYe
//
//  Created by 阳光 on 2017/2/17.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGTopicCell : UITableViewCell
//视图图片
@property (nonatomic, strong) UIImageView *iconIV;
//标题
@property (nonatomic, strong) UILabel *titleLB;
//有多少内容
@property (nonatomic, strong) UILabel *numberContent;
/** 分割线 */
@property(nonatomic, strong) UIView *cellSeparator;
@end
