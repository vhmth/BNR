//
//  HeavyViewController.h
//  HeavyRotation
//
//  Created by Vinay Siddharam Hiremath on 12/25/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeavyViewController : UIViewController {
    __weak IBOutlet UISlider *sliderView;
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UIButton *leftBtn;
    __weak IBOutlet UIButton *rightBtn;
    __weak IBOutlet UIButton *shiftyBtn;
}

@end
