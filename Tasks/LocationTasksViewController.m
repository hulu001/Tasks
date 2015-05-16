//
//  LocationTasksViewController.m
//  Tasks
//
//  Created by zhupetter on 15/5/16.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import "LocationTasksViewController.h"
#import "Location.h"
#import "Task.h"
#import "ViewTaskController.h"

@interface LocationTasksViewController ()

@end

@implementation LocationTasksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSError *error = nil;
    if (![[self fetchedResultsController] performFetch:&error]) {
        abort();
    }
    self.title = @"Task by location";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Task" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"location.name" ascending:YES];
    NSArray *sorts = [NSArray arrayWithObject:sort];
    [request setSortDescriptors:sorts];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"location.name" cacheName:@"task"];
    aFetchedResultsController.delegate = self;
    _fetchedResultsController = aFetchedResultsController;
    return _fetchedResultsController;
    
    
}

#pragma mark - fetchedResultsController delegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id<NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    Task *managedTaskObject = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = managedTaskObject.text;
    
    if ([managedTaskObject.isOverdue boolValue]) {
        cell.textLabel.textColor = [UIColor redColor];
    }else{
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    Task *managedTaskObject = [self.fetchedResultsController objectAtIndexPath:indexPath];
    UIStoryboard *sb = [[UIStoryboard alloc] init];
    ViewTaskController *viewTask = [sb instantiateViewControllerWithIdentifier:@"ViewTaskController"];
    viewTask.managedTaskObject = managedTaskObject;
    viewTask.managedObjectContext = self.managedObjectContext;
    [self.navigationController pushViewController:viewTask animated:YES];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    id<NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo name];
}

@end
