//
//  YGHomeItem.h
//  WangYe
//
//  Created by 阳光 on 2017/2/15.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGHomeInfolistItem,YGHomeInfolistObjectItem,YGHomeInfolistObjectAuthorinfoItem,YGHomeInfolistObjectArticlesourceItem,YGHomeInfolistObjectAuthorinfosItem,YGHomeForcusimagelistItem;
@interface YGHomeItem : NSObject

@property (nonatomic, assign) NSInteger retCode;

@property (nonatomic, copy) NSString *requestId;

@property (nonatomic, copy) NSString *retMsg;

@property (nonatomic, strong) NSArray<YGHomeForcusimagelistItem *> *forcusImageList;

@property (nonatomic, strong) NSArray<YGHomeInfolistItem *> *infoList;

@end
@interface YGHomeInfolistItem : NSObject

@property (nonatomic, strong) YGHomeInfolistObjectItem *object;

@property (nonatomic, copy) NSString *objectType;

@property (nonatomic, copy) NSString *requestId;

@end

@interface YGHomeInfolistObjectItem : NSObject

@property (nonatomic, copy) NSString *keyword;

@property (nonatomic, copy) NSString *praiseCount;
//id -> ID
@property (nonatomic, copy) NSString *ID;
//des -> description
@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *cssType;

@property (nonatomic, copy) NSString *imageProportion;

@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, strong) YGHomeInfolistObjectArticlesourceItem *articleSource;

@property (nonatomic, assign) NSInteger recommendDate;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *articleContentUrl;

@property (nonatomic, copy) NSString *commentCount;

@property (nonatomic, strong) YGHomeInfolistObjectAuthorinfosItem *authorInfo;

@property (nonatomic, copy) NSString *imgWidth;

@property (nonatomic, strong) NSArray<YGHomeInfolistObjectAuthorinfoItem *> *authorInfos;

@property (nonatomic, copy) NSString *imgHeight;

@property (nonatomic, strong) NSString *coverUrl;

@property (nonatomic, strong) NSString *videoUrl;




@end

@interface YGHomeInfolistObjectAuthorinfoItem : NSObject
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *authorName;

@end

@interface YGHomeInfolistObjectArticlesourceItem : NSObject
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *headImgUrl;

@property (nonatomic, copy) NSString *nickname;

@end

@interface YGHomeInfolistObjectAuthorinfosItem : NSObject
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *authorName;

@end

@interface YGHomeForcusimagelistItem : NSObject
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *subTitle;

@property (nonatomic, copy) NSString *forcusImageType;

@property (nonatomic, copy) NSString *imageUrl;

@property (nonatomic, copy) NSString *mainTitle;

@property (nonatomic, copy) NSString *articleId;

@end

