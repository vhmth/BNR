//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Vinay Siddharam Hiremath on 10/30/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "WhereamiViewController.h"

@implementation WhereamiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        // bronze challenge: make it so the locationManager only updates the delegate
        //                   when the device has moved more than 50 meters
        [locationManager setDistanceFilter:50];
        
        [locationManager startUpdatingLocation];
        
        // silver challenge: retrieve the heading information from CLLocationManager
        //                   and print it to the console
        if ([CLLocationManager headingAvailable]) {
            [locationManager startUpdatingHeading];
        }
    }
    
    return self;
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    NSLog(@"%@", newLocation);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    NSLog(@"Could not find location: %@", error);
}

// silver challenge: retrieve the heading information from CLLocationManager and
//                   print it to the console
- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading {
    NSLog(@"New Heading: %@", newHeading);
}

// we need to override the dealloc method to set locationManager's
// reference to this controller to nil since locationManager keeps
// an __unsafe_unretained reference to the object it delegates to,
// which, in this case, is this controller
- (void)dealloc {
    [locationManager setDelegate:nil];
}

@end
