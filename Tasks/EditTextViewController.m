//
//  EditTextViewController.m
//  Tasks
//
//  Created by zhupetter on 15/5/13.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import "EditTextViewController.h"

@interface EditTextViewController ()

@end

@implementation EditTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveButtonPressed:)];
    self.navigationItem.rightBarButtonItem = saveButtonItem;
    [self configureView];
}

- (void)saveButtonPressed:(id)sender
{
    [self.managedObject setValue:self.textField.text forKey:self.keyString];
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        abort();
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)configureView
{
    if (self.managedObject) {
        self.textField.text = [self.managedObject valueForKey:self.keyString];
        self.textField.clearsOnBeginEditing = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
