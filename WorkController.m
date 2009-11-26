//
//  WorkController.m
//
//  Created by Aurelian Oancea on 11/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WorkController.h"
#import "TaskEntity.h"
#import "ProjectEntity.h"

@implementation WorkController

@synthesize _work;
@synthesize _task;
@synthesize _project;

- (BOOL)tableView:(NSTableView *)aTableView 
shouldEditTableColumn:(NSTableColumn *)aTableColumn 
			  row:(NSInteger)rowIndex {
	return NO;
}

- (void)updateTotalSeconds:(NSManagedObject *)entity {
	NSInteger _totalSeconds= [[entity totalSeconds] integerValue];
	_totalSeconds++;
	[entity setTotalSeconds:[NSNumber numberWithInteger:_totalSeconds] ];
}

- (void)timerFired:(NSTimer *)theTimer {
	
	[self updateTotalSeconds:_task];
	[self updateTotalSeconds:_project];
	
	NSDate *end= [_work end];
	[_work setEnd:[end dateByAddingTimeInterval:1.0]];
	NSTimeInterval duration = [end timeIntervalSinceDate:[_work start]];
	[_work setDuration:duration];
}

- (IBAction)startWork:(id)sender {
	if (timer == nil) {
		timer = [[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES] retain];
		_work = [NSEntityDescription insertNewObjectForEntityForName:@"Work" 
								             inManagedObjectContext:[self managedObjectContext]];
		[_work setStart:[NSDate date]];
		[_work setEnd:[NSDate date]];
		[_work setDuration:1.0];
		[self addObject:_work];
		
		_task = [_work task];
		_project= [_task project];
		
		[self timerFired:timer];		
	}
}

- (IBAction)endWork:(id)sender {
	if (timer != nil) {
		[timer invalidate];
		timer = nil;
	}
}
@end
