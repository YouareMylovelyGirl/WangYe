//
//  NetManager.h
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "BaseNetManager.h"
#import "YGSentenceItem.h"
@interface NetManager : BaseNetManager
+ (id)POSTSentenceItemWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day completionHandler:(void(^)(NSArray <YGSentenceItem *>*sentenceItems, NSError *error))completionHandler;
@end
