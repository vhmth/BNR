//
//  DetailViewController.h
//  Homepwner
//
//  Created by Vinay Siddharam Hiremath on 12/27/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRItem.h"

@interface DetailViewController : UIViewController {
    __weak IBOutlet UITextField *nameField;
    __weak IBOutlet UITextField *serialNumberField;
    __weak IBOutlet UITextField *valueField;
    __weak IBOutlet UILabel *dateLabel;
    __weak IBOutlet UIButton *dateChangeBtn;
}

- (IBAction)dateChange:(id)sender;

@property (nonatomic, strong) BNRItem *item;

@end