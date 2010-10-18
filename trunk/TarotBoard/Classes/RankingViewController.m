//
//  ClassementViewController.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 24/09/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "RankingViewController.h"
#import "Player.h"
#import "RankingUserControl.h"

@implementation RankingViewController

@synthesize rankings, players, ranking1, ranking2, ranking3, ranking4, ranking5, scrollView;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	rankings = [[NSArray alloc] initWithObjects:
							 ranking1, ranking2, ranking3, ranking4, ranking5, nil];
	
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollView.frame.size.height + 1);

	[ranking1 updateControl:[players objectAtIndex:0] withRank:0];
	[ranking2 updateControl:[players objectAtIndex:1] withRank:0];
	[ranking3 updateControl:[players objectAtIndex:2] withRank:0];
	[ranking4 updateControl:[players objectAtIndex:3] withRank:0];
	[ranking5 updateControl:[players objectAtIndex:4] withRank:0];
}

#pragma mark -
#pragma mark Methods

NSInteger playerSort(id player1, id player2, void *context) {
	int score1 = [player1 score];
	int score2 = [player2 score];
	
	if (score1 > score2)
		return NSOrderedAscending;
	else if (score1 < score2)
		return NSOrderedDescending;
	
	return NSOrderedSame;
}

- (void)updateViewWithPlayers:(NSArray *)_players {
	//Calculate players ranking
	NSArray *orderedPlayers = [_players sortedArrayUsingFunction:playerSort context:NULL];
	NSMutableArray *ranks = [[NSMutableArray alloc] initWithCapacity:5];
	for (int i = 0; i < [orderedPlayers count]; i++) {
		int pos = 1;
		for (int j = 0; j < [orderedPlayers count]; j++) {
			if ([[orderedPlayers objectAtIndex:i] score] < [[orderedPlayers objectAtIndex:j] score]) {
				pos++;
			}
		}
		
		[ranks addObject:[NSNumber numberWithInt:pos]];
	}
	
	for (int i = 0; i < [_players count]; i++) {
		RankingUserControl *rankControl = [rankings objectAtIndex:i];
		[rankControl updateControl:[orderedPlayers objectAtIndex:i] withRank:[[ranks objectAtIndex:i] intValue]];
	}
	
	[ranks release];
}

#pragma mark -
#pragma mark Memory managment

- (void)viewDidUnload {
    [super viewDidUnload];
	self.ranking1 = nil;
	self.ranking2 = nil;
	self.ranking3 = nil;
	self.ranking4 = nil;
	self.ranking5 = nil;
	self.scrollView = nil;
}

- (void)dealloc {
	[ranking1 release], ranking1 = nil;
	[ranking2 release], ranking2 = nil;
	[ranking3 release], ranking3 = nil;
	[ranking4 release], ranking4 = nil;
	[ranking5 release], ranking5 = nil;
	[rankings release], rankings = nil;
	[players release], players = nil;
	[scrollView release], scrollView = nil;
    [super dealloc];
}


@end
