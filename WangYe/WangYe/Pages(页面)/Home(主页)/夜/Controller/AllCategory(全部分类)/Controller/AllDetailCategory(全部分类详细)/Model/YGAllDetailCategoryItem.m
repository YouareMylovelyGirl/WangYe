//
//  YGAllDetailCategoryItem.m
//  WangYe
//
//  Created by 阳光 on 2017/2/19.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGAllDetailCategoryItem.h"

@implementation YGAllDetailCategoryItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"articleList":@"YGAllDetailCategoryArticlelistItem"
             };
}

@end
@implementation YGAllDetailCategoryArticlelistItem

@end


@implementation YGAllDetailCategoryArticlelistObjectItem

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
            @"authorInfos":@"YGAllDetailCategoryArticlelistObjectAuthorinfoItem"
             };
}

@end


@implementation YGAllDetailCategoryArticlelistObjectAuthorinfoItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id"
             };
}
@end


@implementation YGAllDetailCategoryArticlelistObjectArticlesourceItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id"
             };
}
@end


@implementation YGAllDetailCategoryArticlelistObjectShareurlItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"des":@"description"
             };
}
@end


@implementation YGAllDetailCategoryArticlelistObjectAuthorinfosItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id"
             };
}
@end


