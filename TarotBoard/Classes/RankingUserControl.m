//
//  ClassementUserControl.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 29/09/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "RankingUserControl.h"
#import "Player.h"

@implementation RankingUserControl

@synthesize medalImage, playerPhotoImage, playerName, score;

#pragma mark Initialization

- (void)baseInit {
	medalImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 35, 38)];
	medalImage.contentMode = UIViewContentModeScaleAspectFit;
	medalImage.backgroundColor = [UIColor whiteColor];
	
	playerPhotoImage = [[UIImageView alloc] initWithFrame:CGRectMake(45, 0, 52, 56)];
	playerPhotoImage.contentMode = UIViewContentModeScaleAspectFit;
	playerPhotoImage.backgroundColor = [UIColor whiteColor];
	
	playerName = [[UILabel alloc] initWithFrame:CGRectMake(105, 0, 160, 21)];
	playerName.lineBreakMode = UILineBreakModeTailTruncation;
	playerName.textAlignment = UITextAlignmentLeft;
	playerName.minimumFontSize = 8;
	playerName.adjustsFontSizeToFitWidth = YES;
	
	score = [[UILabel alloc] initWithFrame:CGRectMake(105, 21, 160, 21)];
	score.lineBreakMode = UILineBreakModeTailTruncation;
	score.textAlignment = UITextAlignmentLeft;
	score.minimumFontSize = 8;
	score.adjustsFontSizeToFitWidth = YES;
	
	[self addSubview:medalImage];
	[self addSubview:playerPhotoImage];
	[self addSubview:playerName];
	[self addSubview:score];
}

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		[self baseInit];
    }
    return self;
}

- (id) initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		[self baseInit];
	}
	return self;
}

#pragma mark -
#pragma mark Methods

- (void)updateControl:(Player*)_player withRank:(int)_rank {
	if (_rank == 1) {
		medalImage.image = [UIImage imageNamed:@"Gold Medal.png"];
	}
	else if (_rank == 2) {
		medalImage.image = [UIImage imageNamed:@"Silver Medal.png"];
	}
	else if (_rank == 3) {
		medalImage.image = [UIImage imageNamed:@"Bronze Medal.png"];
	}
	else {
		medalImage.image = nil;
	}
	
	score.text = [NSString stringWithFormat:@"%d", _player.score];
	playerName.text = _player.name;
	playerPhotoImage.image = _player.photo;
}

#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[medalImage release], medalImage = nil;
	[playerPhotoImage release], playerPhotoImage = nil;
	[playerName release], playerName = nil;
	[score release], score = nil;
    [super dealloc];
}


@end
