//
//  ManchesView.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 19/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "ManchesView.h"
#import "RoundDetails.h"

@implementation ManchesView

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

- (void)addRound:(RoundDetails *)round withRoundNum:(int)roundNum {
	UIColor *backColor;
	backColor = roundNum % 2 == 0 ?
		[UIColor colorWithRed:1 green:1 blue:1 alpha:1] :
		[UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
	
	UILabel *roundLabel = [[UILabel alloc] initWithFrame:CGRectMake(5 + 60 * roundNum, 5, 45, 21)];
	[roundLabel setTextAlignment:UITextAlignmentRight];
	roundLabel.text = [NSString stringWithFormat:@"%d", roundNum + 1];
	roundLabel.backgroundColor = backColor;
	[self addSubview:roundLabel];
	[roundLabel release];
	
	for (int i = 0; i < 5; i++) {
		UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(5 + 60 * roundNum, 45 + i * 67, 45, 21)];
		UILabel *roundScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(5 + 60 * roundNum, 66 + i * 67, 45, 21)];
		[scoreLabel setTextAlignment:UITextAlignmentRight];
		[roundScoreLabel setTextAlignment:UITextAlignmentRight];
		[roundScoreLabel setTextColor:[UIColor grayColor]];
		
		int roundScore = [[round.roundScores objectAtIndex:i] intValue];
		if (roundScore >= 0)
			roundScoreLabel.text = [NSString stringWithFormat:@"+%d", roundScore];
		else
			roundScoreLabel.text = [NSString stringWithFormat:@"%d", roundScore];
		scoreLabel.text = [NSString stringWithFormat:@"%d", [[round.finalScores objectAtIndex:i] intValue]];
		roundScoreLabel.backgroundColor = backColor;
		scoreLabel.backgroundColor = backColor;
		
		[self addSubview:scoreLabel];
		[self addSubview:roundScoreLabel];
		[scoreLabel release];
		[roundScoreLabel release];
	}
	
	roundNumm = roundNum + 1;
	[self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetRGBFillColor(context, 0.95, 0.95, 0.95, 1);
	CGContextSetLineWidth(context, 0.5);
	CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
	CGFloat dashArray[] = {3};
	CGContextSetLineDash(context, 0, dashArray, 1);
	
	for (int i = 1; i < roundNumm; i += 2) {
		CGContextFillRect(context, CGRectMake(4 + 60 * i, 0, 60, rect.size.height));
		
		CGContextMoveToPoint(context, 4 + 60 * i, 0);
		CGContextAddLineToPoint(context, 4 + 60 * i, rect.size.height);
		CGContextStrokePath(context);
		
		CGContextMoveToPoint(context, 64 + 60 * i, 0);
		CGContextAddLineToPoint(context, 64 + 60 * i, rect.size.height);
		CGContextStrokePath(context);
	}
	
	CGContextSetRGBFillColor(context, 0, 0, 0, 1);
	CGContextFillRect(context, CGRectMake(-30, 32, rect.size.width, 2));
}

#pragma mark -
#pragma mark Memory Management

- (void)dealloc {
    [super dealloc];
}

@end
