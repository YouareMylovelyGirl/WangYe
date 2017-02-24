//
//  YGPicDetailNewCategoryController.h
//  WangYe
//
//  Created by 阳光 on 2017/2/25.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGPicDetailNewCategoryController : UICollectionViewController
/** ID */
@property(nonatomic, strong) NSString *ID;

- (instancetype)initWithID:(NSString *)ID;
@end
