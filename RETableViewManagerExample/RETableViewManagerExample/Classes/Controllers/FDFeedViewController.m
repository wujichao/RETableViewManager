//
// Created by Jiangfan on 2018/11/30.
// Copyright (c) 2018 Roman Efimov. All rights reserved.
//

#import "FDFeedViewController.h"
#import "FDFeedItem.h"

@interface FDFeedViewController ()

@property (strong, readwrite, nonatomic) RETableViewManager *manager;

@end

@implementation FDFeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Feed";

    // Create manager
    //
    self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];

    // Set some UITableView properties
    //
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    // Add items
    //
    [self addItems];
}

- (void)addItems
{
    // Data from `data.json`
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *feedDicts = rootDict[@"feed"];

    // Convert to `FDFeedItem`
    NSMutableArray *items = @[].mutableCopy;
    [feedDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [items addObject:[[FDFeedItem alloc] initWithDictionary:obj]];
    }];


    RETableViewSection *section = [RETableViewSection section];
    [section addItemsFromArray:items];
    [self.manager addSection:section];
}

@end