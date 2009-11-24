//
//  WorkController.m
//
//  Created by Aurelian Oancea on 11/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WorkController.h"
#import "TaskEntity.h"

@implementation WorkController

@synthesize work;

- (void)timerFired:(NSTimer*)theTimer {
	NSLog(@"timer #-->: %@", work);
	NSDate *end= [work end];
	// TaskEntity *task= [work task];
	[work setEnd:[end dateByAddingTimeInterval:1.0]];
	NSTimeInterval duration = [end timeIntervalSinceDate:[work start]];
	[work setDuration:duration];
}

- (IBAction)startWork:(id)sender {
	NSLog(@"got start work from %@", sender);
	if (timer == nil) {
		timer = [[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES] retain];
		work = [NSEntityDescription insertNewObjectForEntityForName:@"Work" 
								             inManagedObjectContext:[self managedObjectContext]];
		[work setStart:[NSDate date]];
		[work setEnd:[NSDate date]];
		[work setDuration:1.0];
		[self addObject:work];
		// NSLog(@"task: %@", [work task]);
	}
	[self timerFired:timer];
}

- (IBAction)endWork:(id)sender {
	if (timer != nil) {
		[timer invalidate];
		timer = nil;
	}
}
@end
