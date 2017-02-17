//
//  YGAgoEssenceItem.h
//  WangYe
//
//  Created by 阳光 on 2017/2/17.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGAgoEssenceInfolistItem,YGAgoEssenceInfolistObjectItem,YGAgoEssenceInfolistObjectArticlesourceItem;
@interface YGAgoEssenceItem : NSObject

@property (nonatomic, copy) NSString *retMsg;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, copy) NSString *canLoadMore;

@property (nonatomic, assign) NSInteger currentPageContext;

@property (nonatomic, strong) NSArray<YGAgoEssenceInfolistItem *> *infoList;

@property (nonatomic, assign) NSInteger retCode;

@property (nonatomic, copy) NSString *requestId;

@end
@interface YGAgoEssenceInfolistItem : NSObject

@property (nonatomic, strong) YGAgoEssenceInfolistObjectItem *object;

@property (nonatomic, copy) NSString *objectType;

@property (nonatomic, copy) NSString *day;

@property (nonatomic, copy) NSString *month;

@property (nonatomic, copy) NSString *containerId;

@property (nonatomic, copy) NSString *requestId;

@property (nonatomic, assign) NSInteger createDay;

@end

@interface YGAgoEssenceInfolistObjectItem : NSObject

@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, copy) NSString *imageRecommend;

@property (nonatomic, strong) YGAgoEssenceInfolistObjectArticlesourceItem *articleSource;
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *isRecommend;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *articleContentUrl;

@property (nonatomic, copy) NSString *keyword;
//des -> description
@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *requestId;

@property (nonatomic, copy) NSString *descriptionRecommend;

@end

@interface YGAgoEssenceInfolistObjectArticlesourceItem : NSObject

@property (nonatomic, copy) NSString *headImgUrl;
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *nickname;

@end

