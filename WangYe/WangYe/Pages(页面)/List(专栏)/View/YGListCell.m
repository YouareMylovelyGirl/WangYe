//
//  YGListCell.m
//  WangYe
//
//  Created by 阳光 on 2017/2/13.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGListCell.h"

@implementation YGListCell
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(UIEdgeInsetsZero);
        }];
    }
    return _iconIV;
}

- (UIView *)bgView {
    if(_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        [self.iconIV addSubview:_bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.offset(0);
            make.height.mas_equalTo(25);
        }];
    }
    return _bgView;
}

- (UILabel *)titLB {
    if(_titLB == nil) {
        [self bgView];
        _titLB = [[UILabel alloc] init];
        _titLB.font = [UIFont boldSystemFontOfSize:16];
        _titLB.textColor = [UIColor whiteColor];
        [self.bgView addSubview:_titLB];
        [_titLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.offset(0);
        }];
    }
    return _titLB;
}
@end
