//
//  NSObject+Parse.m
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)
+ (id)Parse:(id)JSON
{
    if ([JSON isKindOfClass:[NSArray class]]) {
        return [NSArray modelArrayWithClass:[self class] json:JSON];
    }
    if ([JSON isKindOfClass:[NSDictionary class]]) {
        return [self modelWithJSON:JSON];
    }
    return JSON;
}
@end
