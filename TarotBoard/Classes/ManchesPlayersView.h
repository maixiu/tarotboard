//
//  ManchesPlayersView.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 26/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RoundDetails;

@interface ManchesPlayersView : UIView {
	UILabel *player1;
	UILabel *player2;
	UILabel *player3;
	UILabel *player4;
	UILabel *player5;
	UILabel *score1;
	UILabel *score2;
	UILabel *score3;
	UILabel *score4;
	UILabel *score5;	
}

@property (nonatomic, retain) IBOutlet UILabel *player1;
@property (nonatomic, retain) IBOutlet UILabel *player2;
@property (nonatomic, retain) IBOutlet UILabel *player3;
@property (nonatomic, retain) IBOutlet UILabel *player4;
@property (nonatomic, retain) IBOutlet UILabel *player5;
@property (nonatomic, retain) IBOutlet UILabel *score1;
@property (nonatomic, retain) IBOutlet UILabel *score2;
@property (nonatomic, retain) IBOutlet UILabel *score3;
@property (nonatomic, retain) IBOutlet UILabel *score4;
@property (nonatomic, retain) IBOutlet UILabel *score5;

- (void)initWithPlayers:(NSArray *)players;
- (void)updateViewWithRoundDetails:(RoundDetails *)round;

@end
