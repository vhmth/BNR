//
//  WhereamiViewController.h
//  Whereami
//
//  Created by Vinay Siddharam Hiremath on 10/30/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate> {
    CLLocationManager *locationManager;
}

@end
