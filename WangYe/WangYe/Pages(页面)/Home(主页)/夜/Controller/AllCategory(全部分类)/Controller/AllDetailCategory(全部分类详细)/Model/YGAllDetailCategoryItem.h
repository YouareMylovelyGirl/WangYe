//
//  YGAllDetailCategoryItem.h
//  WangYe
//
//  Created by 阳光 on 2017/2/19.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGAllDetailCategoryArticlelistItem,YGAllDetailCategoryArticlelistObjectItem,YGAllDetailCategoryArticlelistObjectAuthorinfoItem,YGAllDetailCategoryArticlelistObjectArticlesourceItem,YGAllDetailCategoryArticlelistObjectShareurlItem,YGAllDetailCategoryArticlelistObjectAuthorinfosItem;
@interface YGAllDetailCategoryItem : NSObject

@property (nonatomic, copy) NSString *retMsg;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, copy) NSString *canLoadMore;

@property (nonatomic, assign) NSInteger currentPageContext;

@property (nonatomic, assign) NSInteger retCode;

@property (nonatomic, copy) NSString *requestId;

@property (nonatomic, strong) NSArray<YGAllDetailCategoryArticlelistItem *> *articleList;

@end
@interface YGAllDetailCategoryArticlelistItem : NSObject

@property (nonatomic, copy) NSString *objectType;

@property (nonatomic, copy) NSString *requestId;

@property (nonatomic, strong) YGAllDetailCategoryArticlelistObjectItem *object;

@end

@interface YGAllDetailCategoryArticlelistObjectItem : NSObject
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *praiseCount;

@property (nonatomic, copy) NSString *isPraise;
//des -> description
@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *cssType;

@property (nonatomic, copy) NSString *imageProportion;

@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, strong) YGAllDetailCategoryArticlelistObjectArticlesourceItem *articleSource;

@property (nonatomic, assign) NSInteger createDate;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *articleContentUrl;

@property (nonatomic, assign) NSInteger commentCount;

@property (nonatomic, strong) YGAllDetailCategoryArticlelistObjectShareurlItem *shareUrl;

@property (nonatomic, strong) YGAllDetailCategoryArticlelistObjectAuthorinfoItem *authorInfo;

@property (nonatomic, copy) NSString *imgWidth;

@property (nonatomic, strong) NSArray<YGAllDetailCategoryArticlelistObjectAuthorinfoItem *> *authorInfos;

@property (nonatomic, copy) NSString *imgHeight;

@property(nonatomic, strong) NSString *sourceAuthor;

@property(nonatomic, strong) NSString *coverUrl;



@end

@interface YGAllDetailCategoryArticlelistObjectAuthorinfoItem : NSObject
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *authorName;

@end

@interface YGAllDetailCategoryArticlelistObjectArticlesourceItem : NSObject

@property (nonatomic, copy) NSString *headImgUrl;
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *nickname;

@end

@interface YGAllDetailCategoryArticlelistObjectShareurlItem : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *title;
//des -> description
@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *imageUrlSrc;

@property (nonatomic, copy) NSString *image;

@end

@interface YGAllDetailCategoryArticlelistObjectAuthorinfosItem : NSObject
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *authorName;

@end

