//
//  YGEssenceItem.m
//  WangYe
//
//  Created by 阳光 on 2017/2/10.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGEssenceItem.h"

@implementation YGEssenceItem

@end


@implementation YGEssenceMetaItem

@end


@implementation YGEssenceResponseItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"banners":@"YGEssenceResponseBannersItem",
             @"columns":@"YGEssenceResponseColumnsItem",
             @"feeds":@"YGEssenceResponseFeedsItem",
             @"feeds_ad":@"YGEssenceResponseFeeds_AdItem",
             };
}
@end


@implementation YGEssenceResponseHeadlineItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"list":@"YGEssenceResponseHeadlineListItem",
             };
}
@end


@implementation YGEssenceResponseHeadlinePostItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             @"des":@"description"
             };
}
@end


@implementation YGEssenceResponseHeadlinePostCategoryItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id"
             };
}
@end


@implementation YGEssenceResponseHeadlinePostColumnItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             @"des":@"description"
             };
}
@end


@implementation YGEssenceResponseHeadlinePostColumnShareItem

@end


@implementation YGEssenceResponseHeadlineListItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"des":@"description"
             };
}
@end


@implementation YGEssenceResponseColumnsItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             @"des":@"description"
             };
}
@end


@implementation YGEssenceResponseColumnsShareItem

@end


@implementation YGEssenceResponseBannersItem

@end


@implementation YGEssenceResponseBannersPostItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             @"des":@"description"
             };
}
@end


@implementation YGEssenceResponseBannersPostCategoryItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id"
             };
}
@end


@implementation YGEssenceResponseFeedsItem

@end


@implementation YGEssenceResponseFeedsPostItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             @"des":@"description"
             };
}
@end


@implementation YGEssenceResponseFeedsPostCategoryItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id"
             };
}
@end


@implementation YGEssenceResponseFeedsPostColumnItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             @"des":@"description"
             };
}
@end


@implementation YGEssenceResponseFeedsPostColumnShareItem

@end


@implementation YGEssenceResponseFeeds_AdItem

@end


@implementation YGEssenceResponseFeeds_AdPostItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             @"des":@"description"
             };
}
@end


@implementation YGEssenceResponseFeeds_AdPostCategoryItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id"
             };
}
@end


@implementation YGEssenceResponseFeeds_AdAdvertisementItem

@end


@implementation YGEssenceResponseFeeds_AdCoverItem

@end
