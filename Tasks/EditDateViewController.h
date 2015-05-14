//
//  EditDateViewController.h
//  Tasks
//
//  Created by zhupetter on 15/5/14.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Task.h"

@interface EditDateViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) Task *managedTaskObject;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UITableView *dateTableView;
- (IBAction)datePickerChanaged:(id)sender;

@end
