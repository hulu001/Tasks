//
//  viewTaskController.h
//  Tasks
//
//  Created by zhupetter on 15/5/11.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Location.h"
#import "Task.h"

@interface ViewTaskController : UITableViewController

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) Task *managedTaskObject;
@property (weak, nonatomic) IBOutlet UILabel *taskText;
@property (weak, nonatomic) IBOutlet UILabel *taskPriority;
@property (weak, nonatomic) IBOutlet UILabel *taskDueDate;
@property (weak, nonatomic) IBOutlet UILabel *taskLocation;

@end
