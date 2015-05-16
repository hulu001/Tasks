//
//  EditDateViewController.m
//  Tasks
//
//  Created by zhupetter on 15/5/14.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import "EditDateViewController.h"

@interface EditDateViewController ()

@end

@implementation EditDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *saveButtomItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtomPressed:)];
    self.navigationItem.rightBarButtonItem = saveButtomItem;
    
    NSDate *objectDate = self.managedTaskObject.dueDate;
    if (objectDate  == nil) {
        self.datePicker.date = [NSDate date];
    }else{
        self.datePicker.date = objectDate;
    }
}

- (void)saveButtomPressed:(id)sender
{

    self.managedTaskObject.dueDate = [self.datePicker date];
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid due date" message:[[error userInfo] valueForKey:@"ErrorString"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
        [self.managedObjectContext rollback];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction)datePickerChanaged:(id)sender
{
    [self.dateTableView reloadData];
}

#pragma mark table view datasoure

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dateCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"dateCell"];
    }
    if (indexPath.row == 0) {
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        [df setDateStyle:NSDateFormatterLongStyle];
        cell.textLabel.text = [df stringFromDate:self.datePicker.date];
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
