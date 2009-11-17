//
//  ProjectController.h
//  Slobo
//
//  Created by Aurelian Oancea on 11/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface ProjectController : NSArrayController {
	IBOutlet NSTableView *tvProjects;
	
}

- (IBAction)clickedAddProject:(id)sender;

@end
