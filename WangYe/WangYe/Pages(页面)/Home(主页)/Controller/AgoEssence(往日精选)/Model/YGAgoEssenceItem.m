//
//  YGAgoEssenceItem.m
//  WangYe
//
//  Created by 阳光 on 2017/2/17.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGAgoEssenceItem.h"

@implementation YGAgoEssenceItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"infoList":@"YGAgoEssenceInfolistItem"
             };
}
@end
@implementation YGAgoEssenceInfolistItem

@end


@implementation YGAgoEssenceInfolistObjectItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             @"des":@"description"
             };
}
@end


@implementation YGAgoEssenceInfolistObjectArticlesourceItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id"
             };
}
@end


