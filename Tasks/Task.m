//
//  Task.m
//  Tasks
//
//  Created by zhupetter on 15/5/11.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import "Task.h"
#import "Location.h"

#define TASKS_ERROR_DOMAIN               @"cn.hulu001"
#define DUEDATE_VALIDATION_ERROR_CODE    1001

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
    NSDate *today = [NSDate date];
    if ([self.dueDate compare:today] == NSOrderedAscending) {
        isTaskOverdue = YES;
    }
    return [NSNumber numberWithBool:isTaskOverdue];
}

- (BOOL)validateDueDate:(id *)value error:(NSError **)outError
{
    if ([*value compare:[NSDate date]] == NSOrderedAscending) {
        if (*outError == nil) {
            NSString *errorString = @"Due Date must be today or later";
            NSDictionary *userInfoDic = @{@"ErrorString":errorString};
            NSError *error = [[NSError alloc] initWithDomain:TASKS_ERROR_DOMAIN code:DUEDATE_VALIDATION_ERROR_CODE userInfo:userInfoDic];
            *outError = error;
        }
        return NO;
        
    }else{
        return YES;
    }
}

@end
