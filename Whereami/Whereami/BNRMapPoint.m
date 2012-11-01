//
//  BNRMapPoint.m
//  Whereami
//
//  Created by Vinay Siddharam Hiremath on 10/31/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "BNRMapPoint.h"

@implementation BNRMapPoint
@synthesize coordinate, title, dateCreated;

- (id)init {
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32)
                              title:@"Hometown"];
}

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t {
    self = [super init];
    
    if (self) {
        coordinate = c;
        NSString *dateString = [@" : " stringByAppendingString:[[[NSDate alloc] init] description]];
        [self setTitle:[t stringByAppendingString:dateString]];
    }
    
    return self;
}

@end
