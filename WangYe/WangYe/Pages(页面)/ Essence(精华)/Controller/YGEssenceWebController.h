//
//  YGEssenceWebController.h
//  WangYe
//
//  Created by 阳光 on 2017/2/11.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGEssenceWebController : UIViewController
/** 网址信息 */
@property(nonatomic, strong) NSString *appView;
- (instancetype)initWithAppView:(NSString *)appView;
@end
