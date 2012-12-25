//
//  TimeViewController.m
//  HypnoTime
//
//  Created by Vinay Siddharam Hiremath on 12/24/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "TimeViewController.h"

@implementation TimeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    NSBundle *appBundle = [NSBundle mainBundle];
    self = [super initWithNibName:@"TimeViewController"
                          bundle:appBundle];
    
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Time"];
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        [tbi setImage:i];
    }
    
    return self;
}

- (IBAction)showCurrentTime:(id)sender {
    NSDate *now = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    
    [timeLabel setText:[formatter stringFromDate:now]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"TimeViewController loaded its view.");
    
    [[self view] setBackgroundColor:[UIColor greenColor]];
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"CurrentTimeViewController will appear.");
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"CurrentTimeViewController will disappear.");
    [super viewWillDisappear:animated];
}

@end
