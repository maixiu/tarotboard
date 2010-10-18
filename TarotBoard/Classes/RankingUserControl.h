//
//  ClassementUserControl.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 29/09/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Player;

@interface RankingUserControl : UIView {
	UIImageView *medalImage;
	UIImageView *playerPhotoImage;
	UILabel *playerName;
	UILabel *score;
}

- (void)updateControl:(Player*)_player withRank:(int)_rank;

@property (nonatomic, retain) UIImageView *medalImage;
@property (nonatomic, retain) UIImageView *playerPhotoImage;
@property (nonatomic, retain) UILabel *playerName;
@property (nonatomic, retain) UILabel *score;

@end
