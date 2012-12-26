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
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style {
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView
        numberOfRowsInSection:(NSInteger)section {
    return [[[BNRItemStore sharedStore] allItems] count];
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
        [[cell textLabel] setText:@"No more rows!"];
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

- (UIView *)headerView {
    if (!headerView) {
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView"
                                      owner:self
                                    options:nil];
    }
    return headerView;
}

- (UIView *)tableView:(UITableView *)tableView
        viewForHeaderInSection:(NSInteger)section {
    return [self headerView];
}

- (CGFloat)tableView:(UITableView *)tableView
        heightForHeaderInSection:(NSInteger)section {
    return [[self headerView] bounds].size.height;
}

- (IBAction)toggleEditingMode:(id)sender {
    if ([self isEditing]) {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        [self setEditing:NO animated:YES];
    } else {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        [self setEditing:YES animated:YES];
    }
}

- (IBAction)addNewItem:(id)sender {
    BNRItem *newItem = [[BNRItemStore sharedStore] createItem];
    int lastRow = [[[BNRItemStore sharedStore] allItems] indexOfObject:newItem];
    NSIndexPath *ip = [NSIndexPath indexPathForRow:lastRow
                                         inSection:0];
    
    [[self tableView] insertRowsAtIndexPaths:[NSArray arrayWithObject:ip]
                            withRowAnimation:UITableViewRowAnimationTop];
}

- (void)tableView:(UITableView *)tableView
        commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
        forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        BNRItemStore *ps = [BNRItemStore sharedStore];
        NSArray *items = [ps allItems];
        if ([indexPath row] != ([items count] - 1)) {
            BNRItem *p = [items objectAtIndex:[indexPath row]];
            [ps removeItem:p];
        
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                             withRowAnimation:UITableViewRowAnimationFade];
        }
    }
}

- (void)tableView:(UITableView *)tableView
        moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
        toIndexPath:(NSIndexPath *)destinationIndexPath {
    [[BNRItemStore sharedStore] moveItemAtIndex:[sourceIndexPath row]
                                        toIndex:[destinationIndexPath row]];
}

// bronze challenge: renaming the delete button
- (NSString *)tableView:(UITableView *)tableView
        titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Remove";
}

- (BOOL)tableView:(UITableView *)tableView
        canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([indexPath row] == ([[[BNRItemStore sharedStore] allItems] count] - 1)) {
        return NO;
    }
    
    return YES;
}

// gold challenge: make sure no table row can take the final row place
- (NSIndexPath *)tableView:(UITableView *)tableView
        targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath
        toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath {
    int itemCount = [[[BNRItemStore sharedStore] allItems] count];
    if ([proposedDestinationIndexPath row] == (itemCount - 1)) {
        return [NSIndexPath indexPathForRow:itemCount - 2 inSection:0];
    } else {
        return proposedDestinationIndexPath;
    }
}

@end
