//
//  NSString+YG.m
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "NSString+YG.h"

@implementation NSString (YG)
- (NSURL *)yg_URL
{
    return [NSURL URLWithString:self];
}


- (UIImage *)yg_image
{
    return [UIImage imageNamed:self];
}


- (UIImageView *)yg_imageView
{
    return [[UIImageView alloc] initWithImage:self.yg_image];
}
@end
