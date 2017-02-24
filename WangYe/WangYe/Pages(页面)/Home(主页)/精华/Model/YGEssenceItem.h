//
//  YGEssenceItem.h
//  WangYe
//
//  Created by 阳光 on 2017/2/10.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGEssenceMetaItem,YGEssenceResponseItem,YGEssenceResponseHeadlineItem,YGEssenceResponseHeadlinePostItem,YGEssenceResponseHeadlinePostCategoryItem,YGEssenceResponseHeadlinePostColumnItem,YGEssenceResponseHeadlinePostColumnShareItem,YGEssenceResponseHeadlineListItem,YGEssenceResponseColumnsItem,YGEssenceResponseColumnsShareItem,YGEssenceResponseBannersItem,YGEssenceResponseBannersPostItem,YGEssenceResponseBannersPostCategoryItem,YGEssenceResponseFeedsItem,YGEssenceResponseFeedsPostItem,YGEssenceResponseFeedsPostCategoryItem,YGEssenceResponseFeedsPostColumnItem,YGEssenceResponseFeedsPostColumnShareItem,YGEssenceResponseFeeds_AdItem,YGEssenceResponseFeeds_AdPostItem,YGEssenceResponseFeeds_AdPostCategoryItem,YGEssenceResponseFeeds_AdAdvertisementItem,YGEssenceResponseFeeds_AdCoverItem;
@interface YGEssenceItem : NSObject

@property (nonatomic, strong) YGEssenceMetaItem *meta;

@property (nonatomic, strong) YGEssenceResponseItem *response;

@end
@interface YGEssenceMetaItem : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *msg;

@end

@interface YGEssenceResponseItem : NSObject

@property (nonatomic, copy) NSString *last_key;

@property (nonatomic, strong) NSArray<YGEssenceResponseBannersItem *> *banners;

@property (nonatomic, strong) YGEssenceResponseHeadlineItem *headline;

@property (nonatomic, strong) NSArray<YGEssenceResponseColumnsItem *> *columns;

@property (nonatomic, strong) NSArray<YGEssenceResponseFeedsItem *> *feeds;

@property (nonatomic, strong) NSArray *banners_ad;

@property (nonatomic, strong) NSArray<YGEssenceResponseFeeds_AdItem *> *feeds_ad;

@property (nonatomic, assign) BOOL has_more;

@end

@interface YGEssenceResponseHeadlineItem : NSObject

@property (nonatomic, strong) YGEssenceResponseHeadlinePostItem *post;

@property (nonatomic, strong) NSArray<YGEssenceResponseHeadlineListItem *> *list;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) NSInteger headline_genre;

@end

@interface YGEssenceResponseHeadlinePostItem : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;
//description -> des
@property (nonatomic, copy) NSString *des;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, assign) NSInteger page_style;

@property (nonatomic, copy) NSString *film_length;

@property (nonatomic, strong) YGEssenceResponseHeadlinePostCategoryItem *category;

@property (nonatomic, copy) NSString *appview;

@property (nonatomic, strong) YGEssenceResponseHeadlinePostColumnItem *column;

@property (nonatomic, assign) NSInteger start_time;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *super_tag;

@property (nonatomic, assign) NSInteger post_id;

@property (nonatomic, assign) NSInteger publish_time;

@property (nonatomic, copy) NSString *datatype;

@property (nonatomic, assign) NSInteger genre;

@property (nonatomic, assign) NSInteger praise_count;

@end

@interface YGEssenceResponseHeadlinePostCategoryItem : NSObject

@property (nonatomic, copy) NSString *image_lab;
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *normal;

@property (nonatomic, copy) NSString *image_experiment;

@property (nonatomic, copy) NSString *normal_hl;

@end

@interface YGEssenceResponseHeadlinePostColumnItem : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;
//description -> des
@property (nonatomic, copy) NSString *des;

@property (nonatomic, assign) NSInteger post_count;

@property (nonatomic, copy) NSString *content_provider;

@property (nonatomic, copy) NSString *column_tag;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *sort_time;

@property (nonatomic, copy) NSString *image_large;

@property (nonatomic, strong) YGEssenceResponseHeadlinePostColumnShareItem *share;

@property (nonatomic, assign) BOOL subscribe_status;

@property (nonatomic, assign) NSInteger subscriber_num;

@property (nonatomic, assign) NSInteger show_type;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger genre;

@end

@interface YGEssenceResponseHeadlinePostColumnShareItem : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *text;

@end

@interface YGEssenceResponseHeadlineListItem : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *keywords;
//description -> des
@property (nonatomic, copy) NSString *des;

@end

@interface YGEssenceResponseColumnsItem : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;
//description -> des
@property (nonatomic, copy) NSString *des;

@property (nonatomic, assign) NSInteger post_count;

@property (nonatomic, copy) NSString *content_provider;

@property (nonatomic, copy) NSString *column_tag;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *sort_time;

@property (nonatomic, copy) NSString *image_large;

@property (nonatomic, strong) YGEssenceResponseColumnsShareItem *share;

@property (nonatomic, assign) BOOL subscribe_status;

@property (nonatomic, assign) NSInteger subscriber_num;

@property (nonatomic, assign) NSInteger show_type;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger genre;

@end

@interface YGEssenceResponseColumnsShareItem : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *text;

@end

@interface YGEssenceResponseBannersItem : NSObject

@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) YGEssenceResponseBannersPostItem *post;

@end

@interface YGEssenceResponseBannersPostItem : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;
//description -> des
@property (nonatomic, copy) NSString *des;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, assign) NSInteger page_style;

@property (nonatomic, copy) NSString *film_length;

@property (nonatomic, strong) YGEssenceResponseBannersPostCategoryItem *category;

@property (nonatomic, copy) NSString *appview;

@property (nonatomic, assign) NSInteger start_time;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *super_tag;

@property (nonatomic, assign) NSInteger post_id;

@property (nonatomic, assign) NSInteger publish_time;

@property (nonatomic, copy) NSString *datatype;

@property (nonatomic, assign) NSInteger genre;

@property (nonatomic, assign) NSInteger praise_count;

@end

@interface YGEssenceResponseBannersPostCategoryItem : NSObject

@property (nonatomic, copy) NSString *image_lab;
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *normal;

@property (nonatomic, copy) NSString *image_experiment;

@property (nonatomic, copy) NSString *normal_hl;

@end

@interface YGEssenceResponseFeedsItem : NSObject

@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) YGEssenceResponseFeedsPostItem *post;

@end

@interface YGEssenceResponseFeedsPostItem : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;
//description -> des
@property (nonatomic, copy) NSString *des;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, assign) NSInteger page_style;

@property (nonatomic, copy) NSString *film_length;

@property (nonatomic, strong) YGEssenceResponseFeedsPostCategoryItem *category;

@property (nonatomic, copy) NSString *appview;

@property (nonatomic, strong) YGEssenceResponseFeedsPostColumnItem *column;

@property (nonatomic, assign) NSInteger start_time;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *super_tag;

@property (nonatomic, assign) NSInteger post_id;

@property (nonatomic, assign) NSInteger publish_time;

@property (nonatomic, copy) NSString *datatype;

@property (nonatomic, assign) NSInteger genre;

@property (nonatomic, assign) NSInteger praise_count;

@end

@interface YGEssenceResponseFeedsPostCategoryItem : NSObject

@property (nonatomic, copy) NSString *image_lab;
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *normal;

@property (nonatomic, copy) NSString *image_experiment;

@property (nonatomic, copy) NSString *normal_hl;

@end

@interface YGEssenceResponseFeedsPostColumnItem : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;
//description -> des
@property (nonatomic, copy) NSString *des;

@property (nonatomic, assign) NSInteger post_count;

@property (nonatomic, copy) NSString *content_provider;

@property (nonatomic, copy) NSString *column_tag;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *sort_time;

@property (nonatomic, copy) NSString *image_large;

@property (nonatomic, strong) YGEssenceResponseFeedsPostColumnShareItem *share;

@property (nonatomic, assign) BOOL subscribe_status;

@property (nonatomic, assign) NSInteger subscriber_num;

@property (nonatomic, assign) NSInteger show_type;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger genre;

@end

@interface YGEssenceResponseFeedsPostColumnShareItem : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *text;

@end

@interface YGEssenceResponseFeeds_AdItem : NSObject

@property (nonatomic, strong) YGEssenceResponseFeeds_AdPostItem *post;

@property (nonatomic, strong) YGEssenceResponseFeeds_AdAdvertisementItem *advertisement;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) YGEssenceResponseFeeds_AdCoverItem *cover;

@end

@interface YGEssenceResponseFeeds_AdPostItem : NSObject
//id -> ID
@property (nonatomic, assign) NSInteger ID;
//description -> des
@property (nonatomic, copy) NSString *des;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, assign) NSInteger page_style;

@property (nonatomic, copy) NSString *film_length;

@property (nonatomic, strong) YGEssenceResponseFeeds_AdPostCategoryItem *category;

@property (nonatomic, copy) NSString *appview;

@property (nonatomic, assign) NSInteger start_time;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *super_tag;

@property (nonatomic, assign) NSInteger post_id;

@property (nonatomic, assign) NSInteger publish_time;

@property (nonatomic, copy) NSString *datatype;

@property (nonatomic, assign) NSInteger genre;

@property (nonatomic, assign) NSInteger praise_count;

@end

@interface YGEssenceResponseFeeds_AdPostCategoryItem : NSObject

@property (nonatomic, copy) NSString *image_lab;
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *normal;

@property (nonatomic, copy) NSString *image_experiment;

@property (nonatomic, copy) NSString *normal_hl;

@end

@interface YGEssenceResponseFeeds_AdAdvertisementItem : NSObject

@property (nonatomic, copy) NSString *ad_url;

@property (nonatomic, copy) NSString *feedback_url;

@property (nonatomic, assign) NSInteger wifi_location;

@property (nonatomic, assign) NSInteger title_reveal;

@property (nonatomic, copy) NSString *ad_icon_url;

@property (nonatomic, assign) NSInteger ad_location;

@property (nonatomic, copy) NSString *app_type;

@property (nonatomic, assign) NSInteger ad_type;

@end

@interface YGEssenceResponseFeeds_AdCoverItem : NSObject

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *title;

@end
