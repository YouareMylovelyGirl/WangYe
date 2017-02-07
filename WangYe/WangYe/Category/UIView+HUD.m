//
//  UIView+HUD.m
//  WangYe
//
//  Created by 阳光 on 2017/2/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "UIView+HUD.h"

@implementation UIView (HUD)
- (void)showHUD
{
    [self hideHUD];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud hide:YES afterDelay:10];
}

- (void)hideHUD
{
    [MBProgressHUD hideHUDForView:self animated:YES];
}

- (void)showMessage:(NSString *)message
{
    [self hideHUD];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [hud hide:YES afterDelay:1];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
}
@end
