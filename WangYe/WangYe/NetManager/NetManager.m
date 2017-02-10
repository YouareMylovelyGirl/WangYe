//
//  NetManager.m
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "NetManager.h"

@implementation NetManager
+ (id)GETEssenceItem:(NSString *)lastKey completionHandler:(void (^)(YGEssenceItem *, NSError *))completionHandler
{
    NSString *path = [NSString stringWithFormat:@"http://app3.qdaily.com/app3/homes/index/%@.json?", lastKey];
    return [self GET:path param:nil completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([YGEssenceItem Parse:obj], error);
    }];
}
@end
