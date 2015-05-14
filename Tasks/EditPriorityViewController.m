//
//  EditPriorityViewController.m
//  Tasks
//
//  Created by zhupetter on 15/5/13.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import "EditPriorityViewController.h"

@interface EditPriorityViewController ()

@end

@implementation EditPriorityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureView];
}

- (void)configureView
{
    if (self.taskManagedObject) {
        switch ([self.taskManagedObject.priority integerValue]) {
            case 0:
                self.priNone.accessoryType = UITableViewCellAccessoryCheckmark;
                break;
            case 1:
                self.priLow.accessoryType = UITableViewCellAccessoryCheckmark;
                break;
            case 2:
                self.priMedium.accessoryType = UITableViewCellAccessoryCheckmark;
                break;
            case 3:
                self.priHigh.accessoryType = UITableViewCellAccessoryCheckmark;
                break;
                
            default:
                break;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    self.taskManagedObject.priority = [NSNumber numberWithInteger:indexPath.row];
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Due date" message:[[error userInfo] valueForKey:@"ErrorString"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        
        [self.managedObjectContext rollback];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
