//
//  DetailViewController.m
//  Homepwner
//
//  Created by Vinay Siddharam Hiremath on 12/27/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "DetailViewController.h"
#import "DateChangeViewController.h"

@implementation DetailViewController

@synthesize item;

- (void)setItem:(BNRItem *)i {
    item = i;
    [[self navigationItem] setTitle:[item itemName]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [[self view] setBackgroundColor:
        [UIColor colorWithPatternImage:
         [UIImage imageNamed:@"tableViewBackground.png"]]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [nameField setText:[item itemName]];
    [serialNumberField setText:[item serialNumber]];
    [valueField setText:[NSString stringWithFormat:@"%d", [item valueInDollars]]];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterNoStyle];
    
    [dateLabel setText:[formatter stringFromDate:[item dateCreated]]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[self view] endEditing:YES];
    
    [item setItemName:[nameField text]];
    [item setSerialNumber:[serialNumberField text]];
    [item setValueInDollars:[[valueField text] intValue]];
}

// clicking 'done' on the regular keyboards dismisses them
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

// silver challenge: touch outside the number pad (or any of the
//                   other keyboards) to dismiss them :-)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [valueField resignFirstResponder];
    [nameField resignFirstResponder];
    [serialNumberField resignFirstResponder];
}

// gold challenge: push a new view ctl that allows for date changes
- (IBAction)dateChange:(id)sender {
    DateChangeViewController *dcViewCtl = [[DateChangeViewController alloc] init];
    [dcViewCtl setItem:[self item]];
    [[self navigationController] pushViewController:dcViewCtl
                                           animated:YES];
}

@end
