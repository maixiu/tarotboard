//
//  ManchesPlayersView.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 26/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "ManchesPlayersView.h"
#import "RoundDetails.h"

@implementation ManchesPlayersView

@synthesize player1, player2, player3, player4, player5;
@synthesize score1, score2, score3, score4, score5;

#pragma mark -
#pragma mark Initialization

- (void)baseInit {
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        [self baseInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		[self baseInit];
	}
	return self;
}


#pragma mark -
#pragma mark Methods

- (void)initWithPlayers:(NSArray *)players {
	player1.text = [[players objectAtIndex:0] name];
	player2.text = [[players objectAtIndex:1] name];
	player3.text = [[players objectAtIndex:2] name];
	player4.text = [[players objectAtIndex:3] name];
	player5.text = [[players objectAtIndex:4] name];
}

- (void)updateViewWithRoundDetails:(RoundDetails *)round {
	score1.text = [NSString stringWithFormat:@"%d", [[round.finalScores objectAtIndex:0] intValue]];
	score2.text = [NSString stringWithFormat:@"%d", [[round.finalScores objectAtIndex:1] intValue]];
	score3.text = [NSString stringWithFormat:@"%d", [[round.finalScores objectAtIndex:2] intValue]];
	score4.text = [NSString stringWithFormat:@"%d", [[round.finalScores objectAtIndex:3] intValue]];
	score5.text = [NSString stringWithFormat:@"%d", [[round.finalScores objectAtIndex:4] intValue]];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(context, 0, 0, 0, 1);
	CGContextFillRect(context, CGRectMake(0, 32, rect.size.width, 2));
	CGContextFillRect(context, CGRectMake(rect.size.width - 2, 0, 2, rect.size.height));
}


#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
    [super dealloc];
	[player1 release], player1 = nil;
	[player2 release], player2 = nil;
	[player3 release], player3 = nil;
	[player4 release], player4 = nil;
	[player5 release], player5 = nil;
	[score1 release], score1 = nil;
	[score2 release], score2 = nil;
	[score3 release], score3 = nil;
	[score4 release], score4 = nil;
	[score5 release], score5 = nil;
}


@end
