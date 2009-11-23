//
//  TaskController.m
//
//  Created by Aurelian Oancea on 11/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TaskController.h"

@implementation TaskController

- (BOOL)tableView:(NSTableView *)aTableView 
shouldEditTableColumn:(NSTableColumn *)aTableColumn 
			  row:(NSInteger)rowIndex {
	if ([[aTableColumn identifier] isEqual:@"name"]) {
		NSLog(@"TaskController: identifier is name, returning true");
		return YES;
	} else {
		NSLog(@"TaskController: identifier is %@, returning false", [aTableColumn identifier]);
		return NO;
	}
}

@end
