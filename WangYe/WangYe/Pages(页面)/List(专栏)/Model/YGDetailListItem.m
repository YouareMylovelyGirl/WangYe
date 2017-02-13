//
//  YGDetailListItem.m
//  WangYe
//
//  Created by 阳光 on 2017/2/13.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGDetailListItem.h"

@implementation YGDetailListItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"videoList":@"YGDetailListVideolistItem"
             };
}
@end
@implementation YGDetailListVideolistItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"playInfo":@"YGDetailListVideolistPlayinfoItem"
             };
}

+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             @"des":@"description"
             };
}
@end


@implementation YGDetailListVideolistConsumptionItem

@end


@implementation YGDetailListVideolistAuthorItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             @"des":@"description"
             };
}
@end


@implementation YGDetailListVideolistAuthorFollowItem

@end


@implementation YGDetailListVideolistProviderItem

@end


@implementation YGDetailListVideolistPlayinfoItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"urlList":@"YGDetailListVideolistPlayinfoUrllistItem"
             };
}
@end


@implementation YGDetailListVideolistPlayinfoUrllistItem

@end

