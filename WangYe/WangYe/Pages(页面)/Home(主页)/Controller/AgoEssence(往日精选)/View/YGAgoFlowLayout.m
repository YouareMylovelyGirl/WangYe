//
//  YGAgoFlowLayout.m
//  WangYe
//
//  Created by 阳光 on 2017/2/17.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGAgoFlowLayout.h"

@implementation YGAgoFlowLayout
- (instancetype)init
{
    if (self = [super init]) {
        CGFloat width = YGScreenW;
        CGFloat height = width + 40;
        self.itemSize = CGSizeMake(width, height);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.minimumInteritemSpacing = 0;
        self.minimumLineSpacing = 0;
    }
    return self;
}
@end
