//
//  YGAllDetailTextCell.m
//  WangYe
//
//  Created by 阳光 on 2017/2/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGAllDetailTextCell.h"

@implementation YGAllDetailTextCell
- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [UIFont boldSystemFontOfSize:15];
        _titleLB.numberOfLines = 5;
        _titleLB.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(10);
            make.right.mas_equalTo(self.iconIV.mas_left).offset(-10);
            make.centerY.offset(0);
        }];
        
    }
    return _titleLB;
}

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        //调用视图
        [self cellSeparator];
        _iconIV = [[YYAnimatedImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.offset(0);
            CGFloat scale = 64 / 38.0;
            make.width.mas_equalTo(YGScreenW / 2.0);
            make.width.mas_equalTo(_iconIV.mas_height).multipliedBy(scale);
        }];
    }
    return _iconIV;
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
            make.top.mas_equalTo(self.iconIV.mas_bottom).offset(0);
            make.height.mas_equalTo(5);
            make.bottom.offset(0);
        }];
        
    }
    return _cellSeparator;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
