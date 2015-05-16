//
//  viewTaskController.m
//  Tasks
//
//  Created by zhupetter on 15/5/11.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import "ViewTaskController.h"
#import "EditTextViewController.h"
#import "EditPriorityViewController.h"
#import "EditLocationViewController.h"
#import "EditDateViewController.h"
#import "AppDelegate.h"
@interface ViewTaskController ()

@end

@implementation ViewTaskController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Task Detail";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self configureCell];
}

- (void)configureCell
{
    if (self.managedObjectContext) {
        [self.managedObjectContext refreshObject:self.managedTaskObject mergeChanges:YES];
        self.taskText.text = self.managedTaskObject.text;
        
        NSString *priorityString = nil;
        switch ([self.managedTaskObject.priority integerValue]) {
            case 0:
                priorityString = @"None";
                break;
            case 1:
                priorityString = @"Low";
                break;
            case 2:
                priorityString = @"Medium";
                break;
            case 3:
                priorityString = @"High";
                break;
            default:
                break;
        }
        
        self.taskPriority.text = priorityString;
        
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df  setDateStyle:NSDateFormatterLongStyle];
        self.taskDueDate.text = [df stringFromDate:self.managedTaskObject.dueDate];
        Location *location = self.managedTaskObject.location;
        if (location != nil) {
            self.taskLocation.text = location.name;
        }else{
            self.taskLocation.text = @"Not Yet";
        }
    }
}

#pragma mark - segues
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier]isEqualToString:@"showEditTextViewController"]) {
        EditTextViewController *editTextViewController = [segue destinationViewController];
        editTextViewController.managedObjectContext = self.managedObjectContext;
        editTextViewController.managedObject = self.managedTaskObject;
        editTextViewController.keyString = @"text";
    }else if ([[segue identifier] isEqualToString:@"showEditPriorityViewController"])
    {
        EditPriorityViewController *editPriority = [segue destinationViewController];
        editPriority.managedObjectContext = self.managedObjectContext;
        editPriority.taskManagedObject = self.managedTaskObject;
    }else if ([[segue identifier] isEqualToString:@"showEditLocationViewController"])
    {
        EditLocationViewController *editLocation = [segue destinationViewController];
        editLocation.managedObjectContext = self.managedObjectContext;
        editLocation.managedTaskObject = self.managedTaskObject;
    }else if ([[segue identifier] isEqualToString:@"showEditDateViewController"]){
        EditDateViewController *editDate = [segue destinationViewController];
        editDate.managedObjectContext = self.managedObjectContext;
        editDate.managedTaskObject = self.managedTaskObject;
    }
}

#pragma mark table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 4) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hi-Pri Tasks" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        NSArray *highPriTasks = self.managedTaskObject.highPriTasks;
        NSMutableString *message =[[NSMutableString alloc] init];
        for (Task *theTask in highPriTasks) {
            [message appendString:theTask.text];
            [message appendString:@"\n"];
        }
        [alert setMessage:message];
        [alert show];
    }else if(indexPath.row == 5){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tasks due sooner" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        NSMutableString *message = [[NSMutableString alloc] init];
        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
        NSManagedObjectModel *managedObjectModel = [delegate managedObjectModel];
        
        NSDictionary *dict = @{@"DUE_DATE":self.managedTaskObject.dueDate};
        NSFetchRequest *request = [managedObjectModel fetchRequestFromTemplateWithName:@"tasksDueSooner" substitutionVariables:dict];
        NSError *error = nil;
        NSArray *results = [self.managedObjectContext executeFetchRequest:request error:&error];
        for (Task *theTask in results) {
            [message appendString:theTask.text];
            [message appendString:@"\n"];
        }
        [alert setMessage:message];
        [alert show];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
