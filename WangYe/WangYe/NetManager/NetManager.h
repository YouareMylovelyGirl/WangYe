//
//  NetManager.h
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "BaseNetManager.h"
#import "YGEssenceItem.h"
#import "YGListItem.h"
#import "YGDetailListItem.h"
#import "YGHomeItem.h"
@interface NetManager : BaseNetManager
//精华页
+ (id)GETEssenceItem:(NSString *)lastKey completionHandler:(void(^)(YGEssenceItem *essences, NSError *error))completionHandler;
//栏目列表
+ (id)GetListItemCompletionHandler:(void(^)(NSArray<YGListItem *> *lists, NSError *error))completionHandler;
//栏目详细列表
+ (id)GETDetailListItem:(NSString *)detailName completionHandler:(void(^)(YGDetailListItem *detailItem, NSError *error))completionHandler;
//栏目详细刷新页
+ (id)GETDetailListOtherPage:(NSString *)path conpletionHandler:(void(^)(YGDetailListItem *detailItem, NSError *error))completionHandler;

//主页面
+ (id)GETHomeItem:(NSString *)theme page:(NSInteger)pageNum completionHandler:(void(^)(YGHomeItem *homeItem, NSError *error))completionHandler;
@end
