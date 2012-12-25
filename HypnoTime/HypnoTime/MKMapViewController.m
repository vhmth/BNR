//
//  MKMapViewController.m
//  HypnoTime
//
//  Created by Vinay Siddharam Hiremath on 12/24/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "MKMapViewController.h"
#import <MapKit/MapKit.h>

@implementation MKMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Map"];
    }
    
    return self;
}

- (void)loadView {
    // create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    
    worldView = nil;
    worldView = [[MKMapView alloc] initWithFrame:frame];
    [self setView:worldView];
}


@end
