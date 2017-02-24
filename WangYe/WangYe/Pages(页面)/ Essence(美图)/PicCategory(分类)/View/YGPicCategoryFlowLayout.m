//
//  YGPicCategoryFlowLayout.m
//  WangYe
//
//  Created by 阳光 on 2017/2/24.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGPicCategoryFlowLayout.h"

@implementation YGPicCategoryFlowLayout
- (instancetype)init
{
    if (self = [super init]) {
        //1136 640
        CGFloat width = (long)((YGScreenW - 45) / 3);
        CGFloat scale = 12 / 9.0;
        CGFloat height = width * scale + 20;
        self.itemSize = CGSizeMake(width, height);
        self.minimumLineSpacing = 15;
        self.minimumInteritemSpacing = 5;
        self.sectionInset = UIEdgeInsetsMake(10, 7.5, 10, 7.5);
    }
    return self;
}
@end
