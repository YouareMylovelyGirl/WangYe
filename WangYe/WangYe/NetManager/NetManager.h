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
#import "YGAgoEssenceItem.h"
#import "YGCategoryItem.h"
#import "YGAllCategoryItem.h"
#import "YGAllDetailCategoryItem.h"
#import "YGPicCategoryItem.h"
#import "YGPicAllItem.h"
@interface NetManager : BaseNetManager
//精华页
+ (id)GETEssenceItem:(NSString *)lastKey completionHandler:(void(^)(YGEssenceItem *essences, NSError *error))completionHandler;
//栏目列表
+ (id)GetListItemCompletionHandler:(void(^)(NSArray<YGListItem *> *lists, NSError *error))completionHandler;
//栏目详细列表
+ (id)GETDetailListItem:(NSString *)detailName completionHandler:(void(^)(YGDetailListItem *detailItem, NSError *error))completionHandler;
//栏目详细刷新页
+ (id)GETDetailListOtherPage:(NSString *)path conpletionHandler:(void(^)(YGDetailListItem *detailItem, NSError *error))completionHandler;

//往
+ (id)GETHomeItemCompletionHandler:(void(^)(YGHomeItem *homeItem, NSError *error))completionHandler;

//往 往期精选
+ (id)GETAgoEssenceCompletionHandler:(void(^)(YGAgoEssenceItem *agoItem, NSError *error))completionHandler;

//夜
+ (id)GETCategoryItemCompletionHandler:(void(^)(YGCategoryItem *cateItem, NSError *error))complteionHandler;

//夜 全部分类
+ (id)GETAllCategory:(NSInteger)page completionHandler:(void(^)(YGAllCategoryItem *allCategoryItem, NSError *error))completionHandler;

//夜 全部分类 全部分类
+ (id)GETAllDetailCategory:(NSInteger)page ID:(NSString *)ID completionHandler:(void(^)(YGAllDetailCategoryItem *allDetailCategoryItem, NSError *error))completionHandler;

//美图分类
+ (id)GETPicCategoryItem:(void(^)(YGPicCategoryItem *picCategoryItem, NSError *error))completionHandler;

//美图分类详细 最新
+ (id)GETPicDetailiNewItem:(NSInteger)pageCount ID:(NSString *)ID completionHandler:(void(^)(YGPicAllItem *picDetailNewItem, NSError *error))completionHandler;

//美图分类详细 最热
+ (id)GETPicDetailHotItem:(NSInteger)pageCount ID:(NSString *)ID completionHandler:(void(^)(YGPicAllItem *picDetailNewItem, NSError *error))completionHandler;

//美图最热
+ (id)GETPicHotItem:(NSInteger)pageCount completionHandler:(void(^)(YGPicAllItem *picHotItem, NSError *error))completionHandler;

//美图最新
+ (id)GETPicNewItem:(NSInteger)pageCount completionHandler:(void(^)(YGPicAllItem *picNewItem, NSError *error))completionHandler;
@end
