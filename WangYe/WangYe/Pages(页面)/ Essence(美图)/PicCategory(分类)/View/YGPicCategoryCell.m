//
//  YGPicCategoryCell.m
//  WangYe
//
//  Created by 阳光 on 2017/2/24.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGPicCategoryCell.h"

@implementation YGPicCategoryCell
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        _iconIV.layer.cornerRadius = 4;
        [self.contentView addSubview:_iconIV];
        CGFloat scale = 12 / 9.0;
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.offset(0);
            make.height.mas_equalTo(_iconIV.mas_width).multipliedBy(scale);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLB];
        _titleLB.font = [UIFont systemFontOfSize:14];
        _titleLB.textAlignment = NSTextAlignmentCenter;
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconIV.mas_bottom).offset(5);
            make.centerX.offset(0);
        }];
    }
    return _titleLB;
}
@end
