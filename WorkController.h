//
//  WorkController.h
//
//  Created by Aurelian Oancea on 11/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "WorkEntity.h"

@interface WorkController : NSArrayController {
	NSTimer *timer;
	WorkEntity *work;	
}

@property (assign) WorkEntity *work;

- (void)timerFired:(NSTimer*)theTimer;
- (IBAction)startWork:(id)sender;
- (IBAction)endWork:(id)sender;

@end
