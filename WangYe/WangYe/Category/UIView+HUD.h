//
//  UIView+HUD.h
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HUD)
- (void)showHUD;

- (void)hideHUD;

- (void)showMessage:(NSString *)message;
@end
