//
//  YGSentenceCell.m
//  WangYe
//
//  Created by 阳光 on 2017/2/9.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGSentenceCell.h"

@implementation YGSentenceCell


- (UIImageView *)iconIV {
    if(_iconIV == nil) {
        _iconIV = [[UIImageView alloc] init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.offset(5);
            make.right.offset(-5);
            make.height.mas_equalTo(_iconIV.mas_width).multipliedBy(self.scale);
            make.bottom.mas_equalTo(self.labelLB.mas_top).offset(20);
        }];
        
    }
    return _iconIV;
}

- (UILabel *)labelLB {
    if(_labelLB == nil) {
        _labelLB = [[UILabel alloc] init];
        _labelLB.font = [UIFont systemFontOfSize:14];
        _labelLB.numberOfLines = 0;
        [self.contentView addSubview:_labelLB];
        [_labelLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(5);
            make.right.offset(-5);
        }];
    }
    return _labelLB;
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
