//
//  Task.m
//  Tasks
//
//  Created by zhupetter on 15/5/11.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import "Task.h"
#import "Location.h"


@implementation Task

@dynamic dueDate;
@dynamic isOverdue;
@dynamic priority;
@dynamic text;
@dynamic location;
@dynamic highPriTasks;


- (NSNumber *)isOverdue
{
    BOOL isTaskOverdue = NO;
    return [NSNumber numberWithBool:isTaskOverdue];
}

@end
