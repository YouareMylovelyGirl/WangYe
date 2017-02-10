//
//  YGEssenceImageCell.m
//  WangYe
//
//  Created by 阳光 on 2017/2/11.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGEssenceImageCell.h"

@implementation YGEssenceImageCell

- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        //调用视图
        [self cellSeparator];
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.offset(0);
            CGFloat scale = 43 / 103.0;
            make.height.mas_equalTo(_iconIV.mas_width).multipliedBy(scale);
        }];
    }
    return _iconIV;
}

- (UIView *)cellSeparator {
    if(_cellSeparator == nil) {
        _cellSeparator = [[UIView alloc] init];
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
