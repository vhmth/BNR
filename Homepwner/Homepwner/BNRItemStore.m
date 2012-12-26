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
        [self createLastItem];
    }
    
    return self;
}

- (NSArray *)allItems {
    return allItems;
}

- (BNRItem *)createItem {
    BNRItem *item = [BNRItem randomItem];
    int loc = [allItems count] - 1;
    [allItems insertObject:item
                   atIndex:loc];
    return item;
}

- (NSString *)createLastItem {
    NSString *obj = @"No more items!";
    [allItems addObject:@"No more items!"];
    return obj;
}

- (void)removeItem:(BNRItem *)p {
    [allItems removeObjectIdenticalTo:p];
}

- (void)moveItemAtIndex:(int)from
                toIndex:(int)to {
    if (from == to) {
        return;
    }
    
    BNRItem *p = [allItems objectAtIndex:from];
    [allItems removeObjectAtIndex:from];
    [allItems insertObject:p atIndex:to];
}

@end
