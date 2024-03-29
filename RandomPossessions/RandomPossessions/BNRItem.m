//
//  BNRItem.m
//  RandomPossessions
//
//  Created by Vinay Siddharam Hiremath on 10/28/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem
@synthesize itemName, containedItem, container, serialNumber, valueInDollars,
    dateCreated;

- (void)setContainedItem:(BNRItem *)i {
    containedItem = i;
    [i setContainer:self];
}

- (id)init {
    return [self initWithItemName:@"Item"
                   valueInDollars:0
                     serialNumber:@""];
}

- (id)initWithItemName:(NSString *)name
        valueInDollars:(int)value
          serialNumber:(NSString *)sNumber {
    self = [super init];
    
    if (self) {
        [self setItemName:name];
        [self setSerialNumber:sNumber];
        [self setValueInDollars:value];
        dateCreated = [[NSDate alloc] init];
    }
    
    return self;
}

- (NSString *)description {
    NSString *descriptionString =
        [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                            itemName,
                            serialNumber,
                            valueInDollars,
                            dateCreated];
    return descriptionString;
}

+ (id)randomItem {
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy",
                                                            @"Rusty",
                                                            @"Shiny",
                                                            nil];
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear",
                                                        @"Spork",
                                                        @"Mac",
                                                        nil];
    
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];
    
    int randomValue = rand() % 100;
    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                                [randomAdjectiveList objectAtIndex:adjectiveIndex],
                                [randomNounList objectAtIndex:nounIndex]];
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                        '0' + rand() % 10,
                                        'A' + rand() % 26,
                                        '0' + rand() % 10,
                                        'A' + rand() % 26,
                                        '0' + rand() % 10];
    
    BNRItem *newItem =
        [[self alloc] initWithItemName:randomName
                        valueInDollars:randomValue
                          serialNumber:randomSerialNumber];
    return newItem;
}

- (void)dealloc {
    NSLog(@"Destroyed: %@", self);
}
@end
