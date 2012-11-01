//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Vinay Siddharam Hiremath on 10/30/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"

@implementation WhereamiViewController

- (void)viewDidLoad {
    [worldView setShowsUserLocation:YES];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        currentMapType = 0;
    }
    
    return self;
}

// silver challenge: UISegmentedControl
- (IBAction)mapTypeSelected:(id)sender {
    NSInteger type = [mapTypes selectedSegmentIndex];
    
    if (type != currentMapType) {
        switch (type) {
            case 1:
                [worldView setMapType:MKMapTypeSatellite];
                break;
            case 2:
                [worldView setMapType:MKMapTypeHybrid];
                break;
            default:
                [worldView setMapType:MKMapTypeStandard];
                break;
        }
        currentMapType = type;
    }
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation {
    NSLog(@"%@", newLocation);
    
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    
    if (t >= -180) {
        [self foundLocation:newLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    NSLog(@"Could not find location: %@", error);
}

- (void)mapView:(MKMapView *)mapView
    didUpdateUserLocation:(MKUserLocation *)userLocation {
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self findLocation];
    [textField resignFirstResponder];
    return YES;
}

- (void)findLocation {
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc {
    CLLocationCoordinate2D coord = [loc coordinate];
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord
                                                        title:[locationTitleField text]];
    [worldView addAnnotation:mp];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

// we need to override the dealloc method to set locationManager's
// reference to this controller to nil since locationManager keeps
// an __unsafe_unretained reference to the object it delegates to,
// which, in this case, is this controller
- (void)dealloc {
    [locationManager setDelegate:nil];
}

@end
