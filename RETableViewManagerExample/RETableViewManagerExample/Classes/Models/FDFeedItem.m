//
//  FDFeedEntity.m
//  Demo
//
//  Created by sunnyxx on 15/4/16.
//  Copyright (c) 2015年 forkingdog. All rights reserved.
//

#import "FDFeedItem.h"
#import "FDFeedCell.h"

@implementation FDFeedItem

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        _topic = dictionary[@"title"];
        _content = dictionary[@"content"];
        _username = dictionary[@"username"];
        _time = dictionary[@"time"];
        _imageName = dictionary[@"imageName"];
        self.cellClass = FDFeedCell.class;
        self.cellHeight = UITableViewAutomaticDimension;
    }
    return self;
}

@end
