//
//  BaseNetManager.h
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetManager : NSObject
+ (id)GET:(NSString *)path param:(NSDictionary *)param completionHandler:(void(^)(id obj, NSError *error))completionHandler;
@end
