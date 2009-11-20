//
//  WorkEntity.m
//  Slobo
//
//  Created by Aurelian Oancea on 11/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WorkEntity.h"


@implementation WorkEntity

-(NSTimeInterval) duration {
	[self willAccessValueForKey:@"start"];
	NSDate *start = [self primitiveValueForKey:@"start"];
	[self didAccessValueForKey:@"start"];
	[self willAccessValueForKey:@"end"];
	NSDate *end = [self primitiveValueForKey:@"end"];
	[self didAccessValueForKey:@"end"];
	NSTimeInterval dur = [end timeIntervalSinceDate:start];
	return dur;
}

@end
