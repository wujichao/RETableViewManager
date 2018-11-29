//
//  XIBTestItem.m
//  RETableViewManagerExample
//
//  Created by Roman Efimov on 8/11/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "XIBTestItem.h"
#import "XIBTestCell.h"

@implementation XIBTestItem

- (id)init
{
    self = [super init];
    if (self) {
        self.cellClass = XIBTestCell.class;
    }
    return self;
}

@end
