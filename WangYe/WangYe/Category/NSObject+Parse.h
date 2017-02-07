//
//  NSObject+Parse.h
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Parse)<YYModel>
//JSON解析类
+ (id)Parse:(id)JSON;
@end
