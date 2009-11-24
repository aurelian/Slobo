//
//  WorkEntity.m
//  Slobo
//
//  Created by Aurelian Oancea on 11/20/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "WorkEntity.h"

@implementation WorkEntity

@synthesize duration;

-(NSTimeInterval) duration {
	return [[self end] timeIntervalSinceDate:[self start]];
}

@end