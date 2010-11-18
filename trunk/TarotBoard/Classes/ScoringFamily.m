//
//  ScoringFamily.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 05/11/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "ScoringFamily.h"
#import "RoundDetails.h"
#import "NewRound.h"

@interface ScoringFamily (Private)

- (NSArray *)roundScoresFromNewRound:(NewRound *)round;
- (NSArray *)finalScoresFromRoundScores:(NSArray *)roundScores fromPlayers:(NSArray *)players;

@end

@implementation ScoringFamily

- (RoundDetails *)roundDetailsFromNewRound:(NewRound *)round fromPlayers:(NSArray *)players {
	RoundDetails *details = [RoundDetails alloc];
	
	NSArray *roundScores = [self roundScoresFromNewRound:round];
	NSArray *finalScores = [self finalScoresFromRoundScores:roundScores fromPlayers:players];
	
	details.roundScores = roundScores;
	details.finalScores = finalScores;
	details.preneurIndex = round.preneurIndex;
	details.partenaireIndex = round.partenaireIndex;
	
	[roundScores release];
	[finalScores release];
	return details;
}

- (NSArray *)roundScoresFromNewRound:(NewRound *)round {
	int total = 25;
	
	int boutPoints[4] = { 56, 51, 41, 36 };
	bool contractDone = (round.score >= boutPoints[round.bouts]);
	total += abs(round.score - boutPoints[round.bouts]);
	
	if (round.contrat == ContratTypeGarde) {
		total = total * 2;
	}
	else if (round.contrat == ContratTypeGardeSans) {
		total = total * 4;
	}
	else if (round.contrat == ContratTypeGardeContre) {
		total = total * 6;
	}
	
	if (!contractDone) {
		total = -total;
	}
	
	NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:
							 [NSNumber numberWithInt:-total],
							 [NSNumber numberWithInt:-total],
							 [NSNumber numberWithInt:-total],
							 [NSNumber numberWithInt:-total],
							 [NSNumber numberWithInt:-total], nil];
	
	if (round.preneurIndex == round.partenaireIndex) {
		[array replaceObjectAtIndex:round.preneurIndex withObject:[NSNumber numberWithInt:total * 4]];
	}
	else {
		[array replaceObjectAtIndex:round.preneurIndex withObject:[NSNumber numberWithInt:total * 2]];
		[array replaceObjectAtIndex:round.partenaireIndex withObject:[NSNumber numberWithInt:total]];
	}
	
	return array;
}

- (NSArray *)finalScoresFromRoundScores:(NSArray *)roundScores fromPlayers:(NSArray *)players {
	NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:5];
	
	for (int i = 0; i < [players count]; i++) {
		int total = [[players objectAtIndex:i] score] + [[roundScores objectAtIndex:i] intValue];
		[array addObject:[NSNumber numberWithInt:total]];
	}
	
	return array;
}

@end
