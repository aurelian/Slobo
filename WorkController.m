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

@synthesize _work, _task, _project;
@synthesize timer;

@synthesize _startButton, _stopButton;

// work table is not editable
- (BOOL)tableView:(NSTableView *)aTableView 
shouldEditTableColumn:(NSTableColumn *)aTableColumn 
			  row:(NSInteger)rowIndex {
	return NO;
}

// helper to update Task and Project
- (void)updateTotalSeconds:(NSManagedObject *)entity {
	NSInteger _totalSeconds= [[entity totalSeconds] integerValue];
	_totalSeconds++;
	[entity setTotalSeconds:[NSNumber numberWithInteger:_totalSeconds] ];
}

// timer callback
- (void)timerFired:(NSTimer *)theTimer {
	
	[self updateTotalSeconds:self._task];
	[self updateTotalSeconds:self._project];
	
	NSDate *end= [self._work end];
	[self._work setEnd:[end dateByAddingTimeInterval:1.0]];
	NSTimeInterval duration = [end timeIntervalSinceDate:[self._work start]];
	[self._work setDuration:duration];
}

// actions
//
- (IBAction)startWork:(id)sender {
	if (self.timer == nil) {
		self.timer = [[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES] retain];
		self._work = [NSEntityDescription insertNewObjectForEntityForName:@"Work" 
								             inManagedObjectContext:[self managedObjectContext]];
		
		[self._work setStart:[NSDate date]];
		[self._work setEnd:[NSDate date]];
		[self._work setDuration:1.0];
		
		[self addObject:self._work];

		self._task = [self._work task];
		self._project= [self._task project];
		
		[self timerFired:timer];
		[self._startButton setEnabled:NO];
		[self._stopButton setEnabled:YES];
	}
}

- (IBAction)endWork:(id)sender {
	if (self.timer != nil) {
		if([self.timer isValid]) {
			[self.timer invalidate];
		}
		self.timer = nil;
		[self._startButton setEnabled:YES];
		[self._stopButton setEnabled:NO];
	}
}

@end
