//
//  YGPicDetailPageController.h
//  WangYe
//
//  Created by 阳光 on 2017/2/25.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <WMPageController/WMPageController.h>

@interface YGPicDetailPageController : WMPageController
/** ID */
@property(nonatomic, strong) NSString *ID;



- (instancetype)initWithID:(NSString *)ID;

@end
