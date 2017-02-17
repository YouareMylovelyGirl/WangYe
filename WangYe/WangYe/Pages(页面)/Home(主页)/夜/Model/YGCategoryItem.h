//
//  YGCategoryItem.h
//  WangYe
//
//  Created by 阳光 on 2017/2/17.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGCategoryArticlelistItem,YGCategoryAuthorlistItem,YGCategoryTopicrecommendlistItem;
@interface YGCategoryItem : NSObject


@property (nonatomic, strong) NSArray<YGCategoryTopicrecommendlistItem *> *topicRecommendList;

@property (nonatomic, copy) NSString *retMsg;

@property (nonatomic, assign) NSInteger topicSubscribeUpdateNum;

@property (nonatomic, assign) NSInteger articleSubscribeUpdateNum;

@property (nonatomic, copy) NSString *topicSubscribeUpdateList;

@property (nonatomic, strong) NSArray<YGCategoryAuthorlistItem *> *authorList;

@property (nonatomic, strong) NSArray<YGCategoryArticlelistItem *> *articleList;

@property (nonatomic, assign) NSInteger retCode;

@property (nonatomic, copy) NSString *requestId;

@property (nonatomic, strong) NSArray *sourceList;

@end
@interface YGCategoryArticlelistItem : NSObject
//id - > ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *articleContentUrl;

@property (nonatomic, copy) NSString *praiseCount;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *sourceName;

@property (nonatomic, copy) NSString *articleUrl;

@property (nonatomic, copy) NSString *sourceId;

@end

@interface YGCategoryAuthorlistItem : NSObject
//id - > ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *nickname;
//des -> description
@property (nonatomic, copy) NSString *des;

@property (nonatomic, copy) NSString *logo;

@end

@interface YGCategoryTopicrecommendlistItem : NSObject

@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, assign) NSInteger isSubscribe;

@property (nonatomic, assign) NSInteger subscribeNum;
//id - > ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, assign) NSInteger articlesNum;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *recommendImgUrl;

@property (nonatomic, copy) NSString *headImgUrl;

@property (nonatomic, copy) NSString *desc;

@end

