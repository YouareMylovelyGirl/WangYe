//
//  NetManager.m
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
+ (id)POSTSentenceItemWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day completionHandler:(void (^)(NSArray<YGSentenceItem *> *, NSError *))completionHandler
{
    NSString *path = @"http://hl.51wnl.com/upgrade/dayword/getdayword.ashx";
    NSString *time = [NSString stringWithFormat:@"201%ld-%02ld-%02ld", year, month, day];
    NSDictionary *param = @{
                            @"count":@"50",
                            @"daystr":time
                            };
    return [self POST:path param:param completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([YGSentenceItem Parse:obj], error);
    }];
}
@end
