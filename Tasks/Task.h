//
//  Task.h
//  Tasks
//
//  Created by zhupetter on 15/5/11.
//  Copyright (c) 2015年 zhupetter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Location;

@interface Task : NSManagedObject

@property (nonatomic, retain) NSDate * dueDate;
@property (nonatomic, retain) NSNumber * isOverdue;
@property (nonatomic, retain) NSNumber * priority;
@property (nonatomic, retain) NSString * text;
@property (nonatomic, retain) Location *location;
@property (nonatomic, retain) NSArray * highPriTasks;

@end
