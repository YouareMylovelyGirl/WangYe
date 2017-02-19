//
//  YGAllCategoryCell.m
//  WangYe
//
//  Created by 阳光 on 2017/2/19.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGAllCategoryCell.h"

@implementation YGAllCategoryCell
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        _iconIV.layer.cornerRadius = 5;
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.offset(0);
            make.height.mas_equalTo(_iconIV.mas_width);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [UIFont boldSystemFontOfSize:16];
        _titleLB.textColor = [UIColor whiteColor];
        _titleLB.numberOfLines = 1;
        [self.bgView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(5);
            make.right.offset(-30);
            make.centerY.offset(0);
        }];
    }
    return _titleLB;
}

- (UILabel *)numberContent {
    if(_numberContent == nil) {
        _numberContent = [[UILabel alloc] init];
        _numberContent.textColor = [UIColor whiteColor];
        _numberContent.font = [UIFont systemFontOfSize:13];
        [self.bgView addSubview:_numberContent];
        [_numberContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.titleLB);
            make.right.offset(-5);
        }];
    }
    return _numberContent;
}

- (UIView *)bgView {
    if(_bgView == nil) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
        [self.iconIV addSubview:_bgView];
        [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.offset(0);
            make.height.mas_equalTo(25);
        }];
    }
    return _bgView;
}

@end
