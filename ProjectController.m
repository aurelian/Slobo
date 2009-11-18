//
//  ProjectController.m
//  Slobo
//
//  Created by Aurelian Oancea on 11/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ProjectController.h"

@implementation ProjectController

- (BOOL)tableView:(NSTableView *)aTableView 
shouldEditTableColumn:(NSTableColumn *)aTableColumn 
			  row:(NSInteger)rowIndex {
	if ([[aTableColumn identifier] isEqual:@"name"]) {
		NSLog(@"identifier is name, returning true");
		return YES;
	} else {
		NSLog(@"identifier is %@, returning false", [aTableColumn identifier]);
		return NO;
	}
}

@end
