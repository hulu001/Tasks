//
//  MasterViewController.h
//  Tasks
//
//  Created by zhupetter on 15/5/10.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (IBAction)toolbarFilterAll:(id)sender;
- (IBAction)locationButtonPressed:(id)sender;
- (IBAction)toolbarFilterHiPri:(id)sender;
- (IBAction)toolbarSortOrderChanged:(id)sender;

@end

