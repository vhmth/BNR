//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Vinay Siddharam Hiremath on 12/25/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemStore

+ (id)allocWithZone:(NSZone *)zone {
    return [self sharedStore];
}

+ (BNRItemStore *)sharedStore {
    static BNRItemStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

- (id)init {
    self = [super init];
    
    if (self) {
        allItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allItems {
    return allItems;
}

- (BNRItem *)createItem {
    BNRItem *item = [BNRItem randomItem];
    [allItems addObject:item];
    return item;
}

@end
