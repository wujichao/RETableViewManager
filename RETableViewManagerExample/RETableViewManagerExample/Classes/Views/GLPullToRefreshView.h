//
// Created by Jiangfan on 2018/12/1.
// Copyright (c) 2018 Roman Efimov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SVPullToRefresh/SVPullToRefresh.h>

@interface GLPullToRefreshView : SVPullToRefreshView

@property (nonatomic, strong) UIColor *arrowColor;
@property (nonatomic, strong, readwrite) UIColor *activityIndicatorViewColor NS_AVAILABLE_IOS(5_0);
@property (nonatomic, readwrite) UIActivityIndicatorViewStyle activityIndicatorViewStyle;

@end