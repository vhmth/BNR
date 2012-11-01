//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Vinay Siddharam Hiremath on 10/30/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiViewController : UIViewController
    <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate> {
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
    IBOutlet UISegmentedControl *mapTypes;
        
    NSInteger currentMapType;
}

- (void)findLocation;
- (void)foundLocation:(CLLocation *)loc;
- (IBAction)mapTypeSelected:(id)sender;

@end
