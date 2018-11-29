//
//  RetractableViewController.m
//  RETableViewManagerExample
//
//  Created by Roman Efimov on 6/4/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import "RetractableViewController.h"

@interface RetractableViewController ()

@property (strong, readwrite, nonatomic) RETableViewManager *manager;

@end

@implementation RetractableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Retractable";
    
    // Create manager
    //
	self.manager = [[RETableViewManager alloc] initWithTableView:self.tableView];
    
    // Add main section
    //
    RETableViewSection *section = [RETableViewSection section];
    [self.manager addSection:section];
    
    NSMutableArray *collapsedItems = [NSMutableArray array];
    NSMutableArray *expandedItems = [NSMutableArray array];
    
    RETableViewItem *showMoreItem = [RETableViewItem itemWithTitle:@"Show More" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        [section replaceItemsWithItemsFromArray:expandedItems];
        [section reloadSectionWithAnimation:UITableViewRowAnimationAutomatic];
    }];
    
    RETableViewItem *showLessItem = [RETableViewItem itemWithTitle:@"Show Less" accessoryType:UITableViewCellAccessoryDisclosureIndicator selectionHandler:^(RETableViewItem *item) {
        [section replaceItemsWithItemsFromArray:collapsedItems];
        [section reloadSectionWithAnimation:UITableViewRowAnimationAutomatic];
    }];

    [collapsedItems addObjectsFromArray:@[
            [RETableViewItem itemWithTitle:@"Test item 1"],
            [RETableViewItem itemWithTitle:@"Test item 2"],
            [RETableViewItem itemWithTitle:@"Test item 3"],
            showMoreItem,
    ]];
    [expandedItems addObjectsFromArray:@[
            [RETableViewItem itemWithTitle:@"Test item 1"],
            [RETableViewItem itemWithTitle:@"Test item 2"],
            [RETableViewItem itemWithTitle:@"Test item 3"],
            [RETableViewItem itemWithTitle:@"Test item 4"],
            [RETableViewItem itemWithTitle:@"Test item 5"],
            [RETableViewItem itemWithTitle:@"Test item 6"],
            showLessItem,
    ]];

    [section addItemsFromArray:collapsedItems];
}

@end
