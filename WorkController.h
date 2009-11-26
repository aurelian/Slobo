//
//  WorkController.h
//
//  Created by Aurelian Oancea on 11/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WorkEntity.h"
#import "TaskEntity.h"
#import "ProjectEntity.h"

@interface WorkController : NSArrayController {
	NSTimer *timer;
	WorkEntity *_work;
	TaskEntity *_task;
	ProjectEntity *_project;
	IBOutlet NSButton *_startButton;
	IBOutlet NSButton *_stopButton;
}

@property (assign) NSTimer *timer;
@property (assign) WorkEntity *_work;
@property (assign) TaskEntity *_task;
@property (assign) ProjectEntity *_project;

@property (assign) NSButton *_startButton;
@property (assign) NSButton *_stopButton;

- (IBAction)startWork:(id)sender;
- (IBAction)endWork:(id)sender;

@end
