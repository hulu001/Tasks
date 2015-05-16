//
//  LocationTasksViewController.h
//  Tasks
//
//  Created by zhupetter on 15/5/16.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface LocationTasksViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end
