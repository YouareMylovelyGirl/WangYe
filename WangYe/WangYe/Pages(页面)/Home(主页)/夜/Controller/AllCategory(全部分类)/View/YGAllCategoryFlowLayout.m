//
//  YGAllCategoryFlowLayout.m
//  WangYe
//
//  Created by 阳光 on 2017/2/19.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGAllCategoryFlowLayout.h"

@implementation YGAllCategoryFlowLayout
- (instancetype)init
{
    if (self = [super init]) {
        CGFloat width = (long)(YGScreenW - 30) / 2;
        CGFloat height = width;
        self.itemSize = CGSizeMake(width, height);
        self.minimumInteritemSpacing = 10;
        self.minimumLineSpacing = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return self;
}
@end
