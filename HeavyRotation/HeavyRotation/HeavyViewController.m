//
//  HeavyViewController.m
//  HeavyRotation
//
//  Created by Vinay Siddharam Hiremath on 12/25/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "HeavyViewController.h"

@interface HeavyViewController ()

@end

@implementation HeavyViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)x {
    return (x == UIInterfaceOrientationPortrait) ||
        UIInterfaceOrientationIsLandscape(x);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // silver challenge: set the autoresizing masks programatically
    [imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight |
                                   UIViewAutoresizingFlexibleWidth];
    [sliderView setAutoresizingMask:UIViewAutoresizingFlexibleWidth |
                                    UIViewAutoresizingFlexibleBottomMargin];
    [leftBtn setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin |
                                 UIViewAutoresizingFlexibleRightMargin];
    [rightBtn setAutoresizingMask:UIViewAutoresizingFlexibleTopMargin |
                                  UIViewAutoresizingFlexibleLeftMargin];
}

// gold challenge: make shiftyBtn shift to the right center
- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)x
                                         duration:(NSTimeInterval)duration {
    CGRect bounds = [[self view] bounds];
    if (UIInterfaceOrientationIsLandscape(x)) {
        // center to the right
        [shiftyBtn setCenter:CGPointMake(0.75 * bounds.size.width, 0.90 * bounds.size.height)];
    } else {
        // center to the left
        [shiftyBtn setCenter:CGPointMake(0.35 * bounds.size.width, 0.90 * bounds.size.height)];

    }
}

@end
