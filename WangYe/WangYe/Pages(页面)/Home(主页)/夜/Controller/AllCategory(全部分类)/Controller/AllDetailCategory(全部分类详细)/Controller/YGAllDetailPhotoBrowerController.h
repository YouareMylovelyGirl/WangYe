//
//  YGAllDetailPhotoBrowerController.h
//  WangYe
//
//  Created by 阳光 on 2017/2/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <MWPhotoBrowser/MWPhotoBrowser.h>

@interface YGAllDetailPhotoBrowerController : MWPhotoBrowser
/** 图片网址 */
@property(nonatomic, strong) NSString *imgUrl;
- (instancetype)initWithImgUrl:(NSString *)imgUrl desLB:(NSString *)desLB;

/** 标题注释 */
@property(nonatomic, strong) NSString *desLB;

@end
