//
//  TimeViewController.h
//  HypnoTime
//
//  Created by Vinay Siddharam Hiremath on 12/24/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeViewController : UIViewController {
    __weak IBOutlet UILabel *timeLabel;
}
- (IBAction)showCurrentTime:(id)sender;

@end
