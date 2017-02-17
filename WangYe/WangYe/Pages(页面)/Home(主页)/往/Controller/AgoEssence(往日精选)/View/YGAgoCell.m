//
//  YGAgoCell.m
//  WangYe
//
//  Created by 阳光 on 2017/2/17.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGAgoCell.h"

@implementation YGAgoCell
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
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
        _titleLB.font = [UIFont boldSystemFontOfSize:18];
        _titleLB.textColor = [UIColor whiteColor];
        _titleLB.textAlignment = NSTextAlignmentCenter;
        _titleLB.numberOfLines = 0;
        [self.iconIV addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(10);
            make.right.offset(-10);
            make.bottom.mas_equalTo(self.iconIV.mas_bottom).offset(-10);
        }];
    }
    return _titleLB;
}

- (UILabel *)detailLB {
    if(_detailLB == nil) {
        _detailLB = [[UILabel alloc] init];
        _detailLB.font = [UIFont systemFontOfSize:14];
        _detailLB.numberOfLines = 0;
        _detailLB.textAlignment = NSTextAlignmentCenter;
        _detailLB.textColor = [UIColor grayColor];
        [self.contentView addSubview:_detailLB];
        [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconIV.mas_bottom).offset(10);
            make.right.offset(-10);
            make.left.offset(10);
        }];
    }
    return _detailLB;
}
@end
