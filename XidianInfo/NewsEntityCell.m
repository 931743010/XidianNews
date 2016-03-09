//
//  NewsEntityCell.m
//  XidianInfo
//
//  Created by Pasco on 16/3/6.
//  Copyright © 2016年 Pasco. All rights reserved.
//

#import "NewsEntityCell.h"
#import <Masonry.h>

@implementation NewsEntityCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.clipsToBounds = YES;
        self.backgroundColor = HEXCOLOR(0xf6f6f6);
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configureViews];
    }
    return self;
}


- (void)configureViews {
    self.newsTitleLabel = [[UILabel alloc] init];
    self.newsFromLabel = [[UILabel alloc] init];
    self.newsTimeLabel = [[UILabel alloc] init];
    
    self.newsTitleLabel.numberOfLines = 0;
    
    [self.newsTitleLabel setFont:kTitleFont];
    [self.newsFromLabel setFont:kFromFont];
    [self.newsTimeLabel setFont:kTimeFont];
    
    [self.newsTitleLabel setTextColor:HEXCOLOR(0x121212)];
    [self.newsFromLabel setTextColor:HEXCOLOR(0xa6a6a6)];
    [self.newsTimeLabel setTextColor:HEXCOLOR(0xa6a6a6)];
    
    [self.contentView addSubview:self.newsTitleLabel];
    [self.contentView addSubview:self.newsFromLabel];
    [self.contentView addSubview:self.newsTimeLabel];
    
    
}


- (void)layoutSubviews {
    [super layoutSubviews];
    [self configureSubviewsFrame];
    
}


- (void)configureSubviewsFrame {
    UIView *superview = self.contentView;
    [self.newsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(superview.mas_top).with.offset(kNewEntityCellPadding);
        make.left.equalTo(superview.mas_left).with.offset(kNewEntityCellPadding);
        make.right.equalTo(superview.mas_right).with.offset(-kNewEntityCellPadding);
    }];
    [self.newsFromLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newsTitleLabel.mas_bottom).with.offset(kNewEntityCellPadding);
        make.left.equalTo(superview.mas_left).with.offset(kNewEntityCellPadding);
    }];
    [self.newsTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.newsTitleLabel.mas_bottom).with.offset(kNewEntityCellPadding);
        make.right.equalTo(superview.mas_right).with.offset(-kNewEntityCellPadding);
    }];
    
}


//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
