//
//  YGHomeCell.m
//  WangYe
//
//  Created by 阳光 on 2017/2/15.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGHomeCell.h"

@implementation YGHomeCell
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

- (UILabel *)titleLB {
    if(_titleLB == nil) {
        //去掉cell上的点击效果
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        _titleLB = [[UILabel alloc] init];
        _titleLB.font = [UIFont boldSystemFontOfSize:18];
        _titleLB.textColor = [UIColor whiteColor];
        _titleLB.numberOfLines = 0;
        _titleLB.textAlignment = NSTextAlignmentCenter;
        [self.iconIV addSubview:_titleLB];
        [_titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(-10);
            make.left.offset(10);
            make.right.offset(-10);
        }];
    }
    return _titleLB;
}

- (UILabel *)detailLB {
    if(_detailLB == nil) {
        _detailLB = [[UILabel alloc] init];
        _detailLB.font = [UIFont systemFontOfSize:15];
        _detailLB.textColor = [UIColor whiteColor];
        [self.iconIV addSubview:_detailLB];
        [_detailLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.offset(0);
            make.centerY.offset(20);
        }];
    }
    return _detailLB;
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
