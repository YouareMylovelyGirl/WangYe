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
    NSString *path = [NSString stringWithFormat:@"http://app3.qdaily.com/app3/homes/index/%@.json?",lastKey];
    return [self GET:path param:nil completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([YGEssenceItem Parse:obj], error);
    }];
}

+ (id)GetListItemCompletionHandler:(void (^)(NSArray<YGListItem *> *, NSError *))completionHandler
{
    NSString *path = @"http://baobab.kaiyanapp.com/api/v3/categories.Bak";
    return [self GET:path param:nil completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([YGListItem Parse:obj], error);
    }];
}

+ (id)GETDetailListItem:(NSString *)detailName completionHandler:(void (^)(YGDetailListItem *, NSError *))completionHandler
{
    NSString *cateName = [detailName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *path = [NSString stringWithFormat:@"http://baobab.kaiyanapp.com/api/v1/videos.bak?categoryName=%@&num=10", cateName];
    return [self GET:path param:nil completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([YGDetailListItem Parse:obj], error);
    }];
}

+ (id)GETDetailListOtherPage:(NSString *)path conpletionHandler:(void (^)(YGDetailListItem *, NSError *))completionHandler
{
    return [self GET:path param:nil completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([YGDetailListItem Parse:obj], error);
    }];
}


+ (id)GETHomeItemCompletionHandler:(void (^)(YGHomeItem *, NSError *))completionHandler
{
    NSString *path = @"http://www.moviebase.cn/uread/app/recommend/recommend?platform=1&deviceId=F9864FEA-7A4E-4DAA-AE8E-3ED48E542577&appVersion=1.10.0&versionCode=1104&sysver=ios10.2&channelId=0&resolutionWidth=640&resolutionHeight=1136&deviceModel=iPhone5s";
    return [self GET:path param:nil completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([YGHomeItem Parse:obj], error);
    }];
}

+ (id)GETAgoEssenceCompletionHandler:(void (^)(YGAgoEssenceItem *, NSError *))completionHandler
{
    NSString *path = @"http://www.moviebase.cn/uread/app/recommend/lastDays?platform=1&deviceId=F9864FEA-7A4E-4DAA-AE8E-3ED48E542577&appVersion=1.10.0&versionCode=1104&sysver=ios10.2&channelId=0&resolutionWidth=640&resolutionHeight=1136&deviceModel=iPhone5s";
    return [self GET:path param:nil completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([YGAgoEssenceItem Parse:obj], error);
    }];
}

@end
