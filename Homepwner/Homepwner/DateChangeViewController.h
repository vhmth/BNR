//
//  DateChangeViewController.h
//  Homepwner
//
//  Created by Vinay Siddharam Hiremath on 12/27/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRItem.h"

@interface DateChangeViewController : UIViewController {
    __weak IBOutlet UIDatePicker *datePicker;
}

@property (nonatomic, strong) BNRItem *item;

@end
