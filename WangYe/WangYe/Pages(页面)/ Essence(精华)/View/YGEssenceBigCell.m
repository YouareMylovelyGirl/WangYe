//
//  YGEssenceBigCell.m
//  WangYe
//
//  Created by 阳光 on 2017/2/11.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGEssenceBigCell.h"

@implementation YGEssenceBigCell

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

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [UIFont boldSystemFontOfSize:15];
        _titleLB.numberOfLines = 0;
        _titleLB.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconIV.mas_bottom).offset(10);
            make.left.offset(10);
            make.right.offset(-10);
        }];
    }
    return _titleLB;
}

- (UILabel *)detailLB {
    if(_detailLB == nil) {
        UIView *lineView = [[UIView alloc] init];
        [self.contentView addSubview:lineView];
        lineView.backgroundColor = YGRGBColor(235, 235, 235);
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(1);
            make.centerX.offset(0);
            make.top.mas_equalTo(self.titleLB.mas_bottom).offset(10);
        }];
        _detailLB = [[UILabel alloc] init];
        [self.contentView addSubview:_detailLB];
        _detailLB.font = [UIFont systemFontOfSize:14];
        _detailLB.numberOfLines = 0;
        _detailLB.textColor = [UIColor grayColor];
        _detailLB.textAlignment = NSTextAlignmentCenter;
        [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleLB.mas_bottom).offset(20);
            make.left.offset(10);
            make.right.offset(-10);
        }];
    }
    return _detailLB;
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
            make.top.mas_equalTo(self.detailLB.mas_bottom).offset(10);
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
