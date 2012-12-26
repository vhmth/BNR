//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Vinay Siddharam Hiremath on 12/25/12.
//  Copyright (c) 2012 Vinay Siddharam Hiremath. All rights reserved.
//

#import "ItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation ItemsViewController

- (id)init {
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        for (int i = 0; i < 5; i++) {
            [[BNRItemStore sharedStore] createItem];
        }
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView
        numberOfRowsInSection:(NSInteger)section {
    return [[[BNRItemStore sharedStore] allItems] count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]
                    initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:@"UITableViewCell"];
    }
    
    NSInteger numRows =
        [self tableView:tableView numberOfRowsInSection:[indexPath section]];
    if ([indexPath row] != (numRows - 1)) {
        BNRItem *item = [[[BNRItemStore sharedStore] allItems] objectAtIndex:[indexPath row]];
        
        [[cell textLabel] setText:[item description]];
        // gold challenge: font size of every row except the last is 20 points
        [[[cell textLabel] font] fontWithSize:20.0];
    } else {
        // silver challenge: the last row will always display "No more items!"
        [[cell textLabel] setText:@"No more items!"];
    }
    
    return cell;
}

// gold challenge: the height of each row is 60 except for the last
//                 "no more items" row
- (CGFloat)tableView:(UITableView *)tableView
        heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger numRows = [self tableView:tableView
                  numberOfRowsInSection:[indexPath section]];
    if ([indexPath row] != (numRows - 1)) {
        return 60.0;
    } else {
        return 44.0;
    }
}

@end
