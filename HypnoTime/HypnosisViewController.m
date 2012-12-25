//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Vinay Siddharam Hiremath on 12/24/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "HypnosisViewController.h"
#import "HypnosisView.h"

@implementation HypnosisViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil
                           bundle:nibBundleOrNil];
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Hypnosis"];
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        [tbi setImage:i];
    }
    
    return self;
}

- (void)loadView {
    // create a view
    CGRect frame = [[UIScreen mainScreen] bounds];
    v = [[HypnosisView alloc] initWithFrame:frame];
    
    NSArray *colorChoices = [[NSArray alloc] initWithObjects:@"Red", @"Green", @"Blue", nil];
    circleColors = [[UISegmentedControl alloc] initWithItems:colorChoices];
    [circleColors addTarget:self
                    action:@selector(segmentClicked)
                    forControlEvents:UIControlEventValueChanged];
    [v addSubview:circleColors];
    
    // set it as the main view of this view controller
    [self setView:v];
}
     
- (void)segmentClicked {
    NSInteger color = [circleColors selectedSegmentIndex];
    
    switch (color) {
        case 1:
            [v setCircleColor:[UIColor greenColor]];
            break;
        case 2:
            [v setCircleColor:[UIColor blueColor]];
            break;
        default:
            [v setCircleColor:[UIColor redColor]];
            break;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"HypnosisViewController loaded its view.");
}

@end
