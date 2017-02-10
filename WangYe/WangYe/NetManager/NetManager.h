//
//  NetManager.h
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "BaseNetManager.h"
#import "YGEssenceItem.h"
@interface NetManager : BaseNetManager
+ (id)GETEssenceItem:(NSString *)lastKey completionHandler:(void(^)(YGEssenceItem *essences, NSError *error))completionHandler;
@end
