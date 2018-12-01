//
// Created by Jiangfan on 2018/11/30.
// Copyright (c) 2018 Roman Efimov. All rights reserved.
//

#import "FDFeedViewController.h"
#import "FDFeedItem.h"
#import "GLPullToRefreshView.h"
#import <SVPullToRefresh/SVPullToRefresh.h>

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
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;

    // Add items
    //
    [self addItems];

    __weak typeof(self) weakSelf = self;
    [self.tableView addPullToRefresh:GLPullToRefreshView.class withActionHandler:^{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            RETableViewSection *section = weakSelf.manager.sections[0];
            [section removeAllItems];
            [section addItemsFromArray:[weakSelf getItems]];
            [weakSelf.tableView reloadData];

            [weakSelf.tableView.pullToRefreshView stopAnimating];
        });
    }];

    [self.tableView addInfiniteScrollingWithActionHandler:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            RETableViewSection *section = weakSelf.manager.sections[0];
            [section addItemsFromArray:[weakSelf getItems]];
            [weakSelf.tableView reloadData];

            [weakSelf.tableView.infiniteScrollingView stopAnimating];
        });
    }];
}

- (void)addItems
{
    RETableViewSection *section = [RETableViewSection section];
    section.headerHeight = 0;
    section.footerHeight = 0;
    [section addItemsFromArray:[self getItems]];
    [self.manager addSection:section];
}

- (NSArray *)getItems
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

    for (NSUInteger i = 0; i < items.count; ++i) {
        int nElements = items.count - i;
        int n = (arc4random() % nElements) + i;
        [items exchangeObjectAtIndex:i withObjectAtIndex:n];
    }

    return items;
}


@end