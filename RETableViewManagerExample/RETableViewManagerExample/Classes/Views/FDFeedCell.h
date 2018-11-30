//
//  FDFeedCell.h
//  Demo
//
//  Created by sunnyxx on 15/4/17.
//  Copyright (c) 2015年 forkingdog. All rights reserved.
//

#import <RETableViewManager/RETableViewManager.h>
#import "FDFeedItem.h"

@interface FDFeedCell : RETableViewCell

@property (strong, readwrite, nonatomic) FDFeedItem *item;

@end