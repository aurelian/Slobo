//
//  WorkController.m
//
//  Created by Aurelian Oancea on 11/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WorkController.h"

@implementation WorkController

- (void)timerFired:(NSTimer*)theTimer {
	NSLog(@"timer fiered!");
	// update view
}

- (IBAction)startWork:(id)sender {
	NSLog(@"got start work from %@", sender);
	if (timer == nil) {
		timer = [[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES] retain];
	} else {
		[timer fire];
	}
}

- (IBAction)endWork:(id)sender {
	NSLog(@"got end work from %@", sender);	
	if (timer != nil) {
		[timer invalidate];
		timer = nil;
	}
}

@end
