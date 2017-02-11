//
//  YGEssenceBigCell.h
//  WangYe
//
//  Created by 阳光 on 2017/2/11.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGEssenceBigCell : UITableViewCell
/** imageView */
@property(nonatomic, strong) UIImageView *iconIV;
/** 标题 */
@property(nonatomic, strong) UILabel *titleLB;
/** 子标题 */
@property(nonatomic, strong) UILabel *detailLB;
/** 分割线 */
@property(nonatomic, strong) UIView *cellSeparator;
@end
