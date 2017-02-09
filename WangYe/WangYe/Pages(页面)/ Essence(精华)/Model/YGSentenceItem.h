//
//  YGSentenceItem.h
//  WangYe
//
//  Created by 阳光 on 2017/2/9.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGSentenceItem : NSObject
@property (nonatomic, assign) NSInteger Width;

@property (nonatomic, copy) NSString *RealUrl;

@property (nonatomic, assign) NSInteger Height;

@property (nonatomic, assign) NSInteger ItemID;

@property (nonatomic, copy) NSString *Title;

@property (nonatomic, copy) NSString *ImgUrl;

@end
