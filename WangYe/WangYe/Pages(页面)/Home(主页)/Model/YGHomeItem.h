//
//  YGHomeItem.h
//  WangYe
//
//  Created by 阳光 on 2017/2/15.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGHomeVideosItem;
@interface YGHomeItem : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, strong) NSArray<YGHomeVideosItem *> *videos;

@property (nonatomic, assign) NSInteger pg;

@property (nonatomic, assign) NSInteger sz;
//auto - > aut
@property (nonatomic, assign) NSInteger aut;

@property (nonatomic, copy) NSString *total;

@end
@interface YGHomeVideosItem : NSObject

@property (nonatomic, assign) NSInteger mis_vid;

@property (nonatomic, copy) NSString *topic_desc;

@property (nonatomic, copy) NSString *style;
//template -> temp
@property (nonatomic, copy) NSString *temp;

@property (nonatomic, assign) NSInteger video_id;

@property (nonatomic, assign) NSInteger topic_id;

@property (nonatomic, assign) NSInteger playnum;

@property (nonatomic, strong) NSArray *stills;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *stp;

@property (nonatomic, assign) NSInteger likenum;

@property (nonatomic, copy) NSString *still;

@property (nonatomic, assign) NSInteger duration;

@property (nonatomic, assign) NSInteger is_media;

@end
