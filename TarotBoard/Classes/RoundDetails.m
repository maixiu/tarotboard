//
//  RoundDetails.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 13/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "RoundDetails.h"


@implementation RoundDetails

@synthesize roundScores, finalScores, preneurIndex, partenaireIndex;

- (void)dealloc {
	[roundScores release], roundScores = nil;
	[finalScores release], finalScores = nil;
	[super dealloc];
}

@end
