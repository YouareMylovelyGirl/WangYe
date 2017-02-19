//
//  YGAllCategoryItem.m
//  WangYe
//
//  Created by 阳光 on 2017/2/19.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGAllCategoryItem.h"

@implementation YGAllCategoryItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass
{
    return @{
             @"topicList":@"YGAllCategoryTopiclistItem"
             };
}
@end
@implementation YGAllCategoryTopiclistItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"ID":@"id"
             };
}
@end


@implementation YGAllCategoryTopiclistShareinfoItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper
{
    return @{
             @"des":@"description"
             };
}
@end
