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
@interface NetManager : BaseNetManager
+ (id)GETEssenceItem:(NSString *)lastKey completionHandler:(void(^)(YGEssenceItem *essences, NSError *error))completionHandler;
+ (id)GetListItemCompletionHandler:(void(^)(NSArray<YGListItem *> *lists, NSError *error))completionHandler;
+ (id)GETDetailListItem:(NSString *)detailName completionHandler:(void(^)(YGDetailListItem *detailItem, NSError *error))completionHandler;
+ (id)GETDetailListOtherPage:(NSString *)path conpletionHandler:(void(^)(YGDetailListItem *detailItem, NSError *error))completionHandler;
@end
