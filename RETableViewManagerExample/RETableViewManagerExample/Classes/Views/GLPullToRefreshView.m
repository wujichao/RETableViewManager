//
// Created by Jiangfan on 2018/12/1.
// Copyright (c) 2018 Roman Efimov. All rights reserved.
//

#import "GLPullToRefreshView.h"

@interface GLPullToRefreshArrow : UIView

@property (nonatomic, strong) UIColor *arrowColor;

@end

@implementation GLPullToRefreshArrow
@synthesize arrowColor;

- (UIColor *)arrowColor {
    if (arrowColor) return arrowColor;
    return [UIColor grayColor]; // default Color
}

- (void)drawRect:(CGRect)rect {
    CGContextRef c = UIGraphicsGetCurrentContext();

    CGContextMoveToPoint(c, 11, 15);
    CGContextAddLineToPoint(c, 11, 28);

    CGContextMoveToPoint(c, 11, 33);
    CGContextAddLineToPoint(c, 3, 25);
    CGContextMoveToPoint(c, 11, 33);
    CGContextAddLineToPoint(c, 19, 25);

    CGContextSetLineWidth(c, 1.2);
    CGContextSetStrokeColorWithColor(c, [self.arrowColor CGColor]);
    CGContextDrawPath(c, kCGPathStroke);
}
@end



@interface GLPullToRefreshView ()

@property (nonatomic, strong) GLPullToRefreshArrow *arrow;

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

- (void)rotateArrow:(float)degrees hide:(BOOL)hide;

@end

@implementation GLPullToRefreshView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    }
    return self;
}

- (void)layoutSubviews {
    switch (self.state) {
        case SVPullToRefreshStateAll:
        case SVPullToRefreshStateStopped:
            self.arrow.alpha = 1;
            [self.activityIndicatorView stopAnimating];
            switch (self.position) {
                case SVPullToRefreshPositionTop:
                    [self rotateArrow:0 hide:NO];
                    break;
                case SVPullToRefreshPositionBottom:
                    [self rotateArrow:(float)M_PI hide:NO];
                    break;
            }
            break;

        case SVPullToRefreshStateTriggered:
            switch (self.position) {
                case SVPullToRefreshPositionTop:
                    [self rotateArrow:(float)M_PI hide:NO];
                    break;
                case SVPullToRefreshPositionBottom:
                    [self rotateArrow:0 hide:NO];
                    break;
            }
            break;

        case SVPullToRefreshStateLoading:
            [self.activityIndicatorView startAnimating];
            switch (self.position) {
                case SVPullToRefreshPositionTop:
                    [self rotateArrow:0 hide:YES];
                    break;
                case SVPullToRefreshPositionBottom:
                    [self rotateArrow:(float)M_PI hide:YES];
                    break;
            }
            break;
    }

    CGFloat arrowX = (self.bounds.size.width / 2) - (self.arrow.bounds.size.width / 2);
    self.arrow.frame = CGRectMake(arrowX,
            (self.bounds.size.height / 2) - (self.arrow.bounds.size.height / 2),
            self.arrow.bounds.size.width,
            self.arrow.bounds.size.height);
    self.activityIndicatorView.center = self.arrow.center;
}

#pragma mark - Getters

- (GLPullToRefreshArrow *)arrow {
    if(!_arrow) {
        _arrow = [[GLPullToRefreshArrow alloc]initWithFrame:CGRectMake(0, self.bounds.size.height-54, 22, 48)];
        _arrow.backgroundColor = [UIColor clearColor];
        [self addSubview:_arrow];
    }
    return _arrow;
}

- (UIActivityIndicatorView *)activityIndicatorView {
    if(!_activityIndicatorView) {
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        _activityIndicatorView.hidesWhenStopped = YES;
        [self addSubview:_activityIndicatorView];
    }
    return _activityIndicatorView;
}

- (UIColor *)arrowColor {
    return self.arrow.arrowColor; // pass through
}

- (UIColor *)activityIndicatorViewColor {
    return self.activityIndicatorView.color;
}

- (UIActivityIndicatorViewStyle)activityIndicatorViewStyle {
    return self.activityIndicatorView.activityIndicatorViewStyle;
}

#pragma mark - Setters

- (void)setArrowColor:(UIColor *)newArrowColor {
    self.arrow.arrowColor = newArrowColor; // pass through
    [self.arrow setNeedsDisplay];
}

- (void)setActivityIndicatorViewColor:(UIColor *)color {
    self.activityIndicatorView.color = color;
}

- (void)setActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)viewStyle {
    self.activityIndicatorView.activityIndicatorViewStyle = viewStyle;
}

- (void)rotateArrow:(float)degrees hide:(BOOL)hide {
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        self.arrow.layer.transform = CATransform3DMakeRotation(degrees, 0, 0, 1);
        self.arrow.layer.opacity = !hide;
        //[self.arrow setNeedsDisplay];//ios 4
    } completion:NULL];
}

@end