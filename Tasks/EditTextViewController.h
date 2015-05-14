//
//  EditTextViewController.h
//  Tasks
//
//  Created by zhupetter on 15/5/13.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface EditTextViewController : UITableViewController

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObject *managedObject;
@property (nonatomic, strong) NSString *keyString;
@property (nonatomic, weak) IBOutlet UITextField *textField;

@end
