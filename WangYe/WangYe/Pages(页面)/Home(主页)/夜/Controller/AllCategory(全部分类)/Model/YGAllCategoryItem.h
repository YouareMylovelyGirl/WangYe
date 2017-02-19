//
//  YGAllCategoryItem.h
//  WangYe
//
//  Created by 阳光 on 2017/2/19.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGAllCategoryTopiclistItem,YGAllCategoryTopiclistShareinfoItem;
@interface YGAllCategoryItem : NSObject

@property (nonatomic, copy) NSString *retMsg;

@property (nonatomic, assign) NSInteger articleSubscribeUpdateNum;

@property (nonatomic, assign) NSInteger topicSubscribeUpdateNum;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, copy) NSString *topicSubscribeUpdateList;

@property (nonatomic, copy) NSString *canLoadMore;

@property (nonatomic, assign) NSInteger currentPageContext;

@property (nonatomic, assign) NSInteger retCode;

@property (nonatomic, copy) NSString *requestId;

@property (nonatomic, strong) NSArray<YGAllCategoryTopiclistItem *> *topicList;

@end
@interface YGAllCategoryTopiclistItem : NSObject

@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, assign) NSInteger isSubscribe;

@property (nonatomic, assign) NSInteger subscribeNum;
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, assign) NSInteger articlesNum;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *headImgUrl;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, strong) YGAllCategoryTopiclistShareinfoItem *shareInfo;

@end

@interface YGAllCategoryTopiclistShareinfoItem : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *title;
//des -> description
@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *imageUrlSrc;

@property (nonatomic, copy) NSString *image;

@end
