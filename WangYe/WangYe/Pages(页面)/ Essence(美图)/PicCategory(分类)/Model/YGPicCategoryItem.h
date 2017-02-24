//
//  YGPicCategoryItem.h
//  WangYe
//
//  Created by 阳光 on 2017/2/24.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGPicCategoryResItem,YGPicCategoryResDataItem;
@interface YGPicCategoryItem : NSObject

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) YGPicCategoryResItem *res;

@property (nonatomic, assign) NSInteger code;

@end
@interface YGPicCategoryResItem : NSObject

@property (nonatomic, strong) NSArray<YGPicCategoryResDataItem *> *data;

@end

@interface YGPicCategoryResDataItem : NSObject

@property (nonatomic, copy) NSString *tcname;

@property (nonatomic, copy) NSString *korean_name;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *_id;

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, assign) NSInteger imgs;

@property (nonatomic, assign) NSInteger sn;

@property (nonatomic, copy) NSString *cover;

@property (nonatomic, copy) NSString *ename;

@property (nonatomic, assign) NSInteger atime;

@property (nonatomic, copy) NSString *name;

@end
