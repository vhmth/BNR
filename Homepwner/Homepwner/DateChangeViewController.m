//
//  DateChangeViewController.m
//  Homepwner
//
//  Created by Vinay Siddharam Hiremath on 12/27/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "DateChangeViewController.h"

@implementation DateChangeViewController

@synthesize item;

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:
     [UIColor colorWithPatternImage:
      [UIImage imageNamed:@"tableViewBackground.png"]]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [item setDateCreated:[datePicker date]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [datePicker setDate:[item dateCreated]];
}

- (void)setItem:(BNRItem *)i {
    item = i;
    [[self navigationItem]
        setTitle:[NSString stringWithFormat:@"Date for %@", [item itemName]]];
}

@end
