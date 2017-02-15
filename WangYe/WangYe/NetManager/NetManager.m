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


+ (id)GETHomeItem:(NSString *)theme page:(NSInteger)pageNum completionHandler:(void (^)(YGHomeItem *, NSError *))completionHandler
{
    NSString *path = [NSString stringWithFormat:@"http://api-vmis.fun.tv/list?app=life&cl=iphone&fudid=8EA4119F368A368A378A378AACFBAFD206BA04EC0FBA03BE0FBC00BE06BE0FBD&pg=%ld&si=0&theme=%@&uc=99&v=1.0.0.0", pageNum, theme];
    return [self GET:path param:nil completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([YGHomeItem Parse:obj], error);
    }];
}

@end
