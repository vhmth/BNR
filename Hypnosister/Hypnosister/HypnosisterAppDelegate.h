//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Vinay Siddharam Hiremath on 12/23/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"

@interface HypnosisterAppDelegate : UIResponder
    <UIApplicationDelegate, UIScrollViewDelegate> {
    HypnosisView *view;
}

@property (strong, nonatomic) UIWindow *window;

@end
