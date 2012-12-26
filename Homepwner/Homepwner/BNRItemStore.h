//
//  BNRItemStore.h
//  Homepwner
//
//  Created by Vinay Siddharam Hiremath on 12/25/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject {
    NSMutableArray *allItems;
}

+ (BNRItemStore *)sharedStore;

- (NSArray *)allItems;
- (BNRItem *)createItem;

@end
