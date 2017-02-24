//
//  YGPicFlowLayout.m
//  WangYe
//
//  Created by 阳光 on 2017/2/24.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGPicFlowLayout.h"

@implementation YGPicFlowLayout
- (instancetype)init
{
    if (self = [super init]) {
        CGFloat width = (long)((YGScreenW - 20) / 3);
        CGFloat scale = 1136 / 640.0;
        CGFloat height = width * scale;
        self.itemSize = CGSizeMake(width, height);
        self.minimumLineSpacing = 5;
        self.minimumInteritemSpacing = 5;
        self.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    }
    return self;
}
@end
