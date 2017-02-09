//
//  YGSentenceCell.h
//  WangYe
//
//  Created by 阳光 on 2017/2/9.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGSentenceCell : UITableViewCell
/** imageView尺寸比例 */
@property(nonatomic, assign) CGFloat scale;

/** imageView */
@property(nonatomic, strong) UIImageView *iconIV;

/** label */
@property(nonatomic, strong) UILabel *labelLB;

@end
