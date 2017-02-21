//
//  YGListFlowLayout.m
//  WangYe
//
//  Created by 阳光 on 2017/2/13.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGListFlowLayout.h"

@implementation YGListFlowLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        CGFloat width = (long)((YGScreenW - 30) / 2);
        CGFloat height = width;
        self.itemSize = CGSizeMake(width, height);
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    }
    return self;
}
@end
