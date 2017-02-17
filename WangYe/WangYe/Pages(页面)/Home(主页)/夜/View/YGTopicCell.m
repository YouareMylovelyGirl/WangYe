//
//  YGTopicCell.m
//  WangYe
//
//  Created by 阳光 on 2017/2/17.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGTopicCell.h"

@implementation YGTopicCell
- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        [self cellSeparator];
        _iconIV = [[UIImageView alloc] init];
        //设置
        _iconIV.layer.cornerRadius = 5;
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            CGFloat scale = 231 / 410.0;
            make.top.mas_equalTo(self.titleLB.mas_bottom).offset(10);
            make.left.offset(10);
            make.right.offset(-10);
            make.height.mas_equalTo(_iconIV.mas_width).multipliedBy(scale);
        }];
    }
    return _iconIV;
}

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [UIFont boldSystemFontOfSize:17];
        _titleLB.numberOfLines = 0;
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(15);
            make.right.offset(-50);
            make.top.offset(10);
        }];
    }
    return _titleLB;
}

- (UILabel *)numberContent {
    if(_numberContent == nil) {
        _numberContent = [[UILabel alloc] init];
        _numberContent.textColor = [UIColor grayColor];
        _numberContent.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_numberContent];
        [_numberContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.titleLB);
            make.right.offset(-15);
        }];
    }
    return _numberContent;
}
- (UIView *)cellSeparator {
    if(_cellSeparator == nil) {
        _cellSeparator = [[UIView alloc] init];
        //点击cell没有阴影效果
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        _cellSeparator.backgroundColor = YGRGBColor(238, 238, 238);
        [self.contentView addSubview:_cellSeparator];
        [_cellSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.top.mas_equalTo(self.iconIV.mas_bottom).offset(5);
            make.height.mas_equalTo(7);
            make.bottom.offset(0);
        }];
        
    }
    return _cellSeparator;
}
@end
