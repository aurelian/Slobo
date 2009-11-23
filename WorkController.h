//
//  WorkController.h
//
//  Created by Aurelian Oancea on 11/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface WorkController : NSArrayController {
	NSTimer *timer;
}

- (void)timerFired:(NSTimer*)theTimer;
- (IBAction)startWork:(id)sender;
- (IBAction)endWork:(id)sender;

@end
