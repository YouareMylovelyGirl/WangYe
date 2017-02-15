//
//  YGHomeController.h
//  WangYe
//
//  Created by 阳光 on 2017/2/15.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGHomeController : UIViewController
/** 数组索引值 */
@property(nonatomic, assign) NSInteger index;
- (instancetype)initWithIndexPath:(NSInteger)index;
@end
