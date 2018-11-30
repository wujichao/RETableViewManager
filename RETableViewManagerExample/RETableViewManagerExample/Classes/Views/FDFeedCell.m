//
//  FDFeedCell.m
//  Demo
//
//  Created by sunnyxx on 15/4/17.
//  Copyright (c) 2015年 forkingdog. All rights reserved.
//

#import "FDFeedCell.h"

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


}

- (void)cellWillAppear
{
    [super cellWillAppear];

    self.titleLabel.text = self.item.title;
    self.contentLabel.text = self.item.content;
    self.contentImageView.image = self.item.imageName.length > 0 ? [UIImage imageNamed:self.item.imageName] : nil;
    self.usernameLabel.text = self.item.username;
    self.timeLabel.text = self.item.time;
}

@end
