//
//  EditLocationViewController.h
//  Tasks
//
//  Created by zhupetter on 15/5/13.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#include "Task.h"

@interface EditLocationViewController : UITableViewController<NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) Task *managedTaskObject;

@end
