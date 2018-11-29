//
//  MultilineTextItem.m
//  RETableViewManagerExample
//
//  Created by Roman Efimov on 9/11/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "MultilineTextItem.h"
#import "MultilineTextCell.h"

@implementation MultilineTextItem

- (id)initWithTitle:(NSString *)title
{
    self = [super initWithTitle:title];
    if (!self)
        return nil;

    self.cellClass = MultilineTextCell.class;

    return self;
}

@end
