//
//  YGPicPhotoController.h
//  WangYe
//
//  Created by 阳光 on 2017/2/24.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <MWPhotoBrowser/MWPhotoBrowser.h>
#import "YGPicAllItem.h"
@interface YGPicPhotoController : MWPhotoBrowser
/** 图片模型 */
@property(nonatomic, strong) NSArray *picAllArr;
/** 索引值 */
@property(nonatomic, assign) NSInteger index;

- (instancetype)initWithPicAllItem:(NSArray *)picAllArr index:(NSInteger)index;

@end
