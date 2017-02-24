//
//  YGPicAllItem.h
//  WangYe
//
//  Created by 阳光 on 2017/2/24.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGPicAllResItem,YGPicAllResDataItem;
@interface YGPicAllItem : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) YGPicAllResItem *res;

@property (nonatomic, assign) NSInteger code;

@end
@interface YGPicAllResItem : NSObject

@property (nonatomic, strong) NSArray<YGPicAllResDataItem *> *data;

@end

@interface YGPicAllResDataItem : NSObject

@property (nonatomic, strong) NSArray<NSString *> *cid;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *_id;

@property (nonatomic, copy) NSString *store;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, strong) NSArray<NSString *> *tag;

@property (nonatomic, assign) NSInteger views;

@property (nonatomic, assign) NSInteger atime;

@property (nonatomic, copy) NSString *url;

@end
