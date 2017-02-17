//
//  YGCategoryItem.m
//  WangYe
//
//  Created by 阳光 on 2017/2/17.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGCategoryItem.h"

@implementation YGCategoryItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"topicRecommendList":@"YGCategoryTopicrecommendlistItem",
             @"authorList":@"YGCategoryAuthorlistItem",
             @"articleList":@"YGCategoryArticlelistItem"
             };
}
@end
@implementation YGCategoryArticlelistItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id"
             };
}
@end


@implementation YGCategoryAuthorlistItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id",
             @"des":@"description"
             };
}
@end


@implementation YGCategoryTopicrecommendlistItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id"
             };
}
@end

