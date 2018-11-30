//
//  FDFeedCell.m
//  Demo
//
//  Created by sunnyxx on 15/4/17.
//  Copyright (c) 2015年 forkingdog. All rights reserved.
//

#import "FDFeedCell.h"
#import <Masonry/Masonry.h>

@interface FDFeedCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *contentImageView;
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation FDFeedCell

- (void)cellDidLoad
{
    [super cellDidLoad];

    self.titleLabel = [UILabel new];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:16];

    self.contentLabel = [UILabel new];
    self.contentLabel.font = [UIFont systemFontOfSize:14];
    self.contentLabel.numberOfLines = 0;

    self.contentImageView = [UIImageView new];

    self.usernameLabel = [UILabel new];
    self.usernameLabel.font = [UIFont boldSystemFontOfSize:13];

    self.timeLabel = [UILabel new];
    self.timeLabel.font = [UIFont boldSystemFontOfSize:12];


    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10.f);
        make.top.equalTo(self.contentView).offset(10.f);
        make.right.equalTo(self.contentView).offset(-10.f);
    }];

    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(6.f);
        make.right.equalTo(self.contentView).offset(-10.f);
    }];

    [self.contentView addSubview:self.contentImageView];
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.contentLabel.mas_bottom).offset(8.f);
        make.right.lessThanOrEqualTo(self.contentView).offset(-16.f);
    }];

    [self.contentView addSubview:self.usernameLabel];
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.contentImageView.mas_bottom).offset(8.f);
        make.bottom.equalTo(self.contentView).offset(-4.f);
    }];

    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.baseline.equalTo(self.usernameLabel);
        make.right.equalTo(self.contentView).offset(-10.f);
    }];
}

- (void)cellWillAppear
{
    [super cellWillAppear];

    self.titleLabel.text = self.item.topic;
    self.contentLabel.text = self.item.content;
    self.contentImageView.image = self.item.imageName.length > 0 ? [UIImage imageNamed:self.item.imageName] : nil;
    self.usernameLabel.text = self.item.username;
    self.timeLabel.text = self.item.time;
}

@end
