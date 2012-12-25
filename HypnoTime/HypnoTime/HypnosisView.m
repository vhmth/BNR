//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Vinay Siddharam Hiremath on 12/23/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView
@synthesize circleColor;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        [self setCircleColor:[UIColor lightGrayColor]];
    }
    return self;
}

- (void)drawRect:(CGRect)dirtyRect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    
    // get the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // the width of the line should be 10 points wide
    CGContextSetLineWidth(ctx, 10);
    [circleColor setStroke];
    
    // draw concentric circles from the outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        // add a path to the context
        CGContextAddArc(ctx, center.x, center.y, currentRadius, 0.0, M_PI * 2.0, YES);
        // perform drawing instruction; removes path
        CGContextStrokePath(ctx);
    }
    
    // create a string
    NSString *text = @"You are getting sleepy.";
    
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    [[UIColor blackColor] setFill];
    
    // add a shadow to the string
    // the shadow will move 4 points to the right and 3 points down from the text
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(ctx, offset, 2.0, color);
    
    // draw the string
    [text drawInRect:textRect withFont:font];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"Device started shaking!");
        [self setCircleColor:[UIColor redColor]];
    }
}

- (void)setCircleColor:(UIColor *)clr {
    circleColor = clr;
    [self setNeedsDisplay];
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

@end
