//
//  EditPriorityViewController.h
//  Tasks
//
//  Created by zhupetter on 15/5/13.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface EditPriorityViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) Task *taskManagedObject;
@property (weak, nonatomic) IBOutlet UITableViewCell *priNone;
@property (weak, nonatomic) IBOutlet UITableViewCell *priLow;
@property (weak, nonatomic) IBOutlet UITableViewCell *priMedium;
@property (weak, nonatomic) IBOutlet UITableViewCell *priHigh;

@end
