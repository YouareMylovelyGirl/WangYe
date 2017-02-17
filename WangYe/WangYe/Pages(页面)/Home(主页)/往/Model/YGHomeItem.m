//
//  YGHomeItem.m
//  WangYe
//
//  Created by 阳光 on 2017/2/15.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGHomeItem.h"

@implementation YGHomeItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"forcusImageList":@"YGHomeForcusimagelistItem",
             @"infoList":@"YGHomeInfolistItem"
             };
}
@end
@implementation YGHomeInfolistItem

@end


@implementation YGHomeInfolistObjectItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             @"des":@"description"
             };
}


+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"authorInfos":@"YGHomeInfolistObjectAuthorinfoItem"
             };
}
@end


@implementation YGHomeInfolistObjectAuthorinfoItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             };
}
@end


@implementation YGHomeInfolistObjectArticlesourceItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             };
}
@end


@implementation YGHomeInfolistObjectAuthorinfosItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             };
}
@end


@implementation YGHomeForcusimagelistItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             };
}
@end
