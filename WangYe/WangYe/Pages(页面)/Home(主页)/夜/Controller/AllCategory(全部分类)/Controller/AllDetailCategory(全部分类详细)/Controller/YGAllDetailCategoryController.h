//
//  YGAllDetailCategoryController.h
//  WangYe
//
//  Created by 阳光 on 2017/2/19.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGAllDetailCategoryController : UIViewController
/** 图片 */
@property(nonatomic, strong) NSString *imageName;

/** 分类标题 */
@property(nonatomic, strong) NSString *labelName;

/** ID */
@property(nonatomic, strong) NSString *ID;

- (instancetype)initWithImageName:(NSString *)imageName labelName:(NSString *)labelName ID:(NSString *)ID;
@end
