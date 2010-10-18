//
//  GameMainViewController.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 03/06/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewRoundViewController.h"

@class RankingViewController;
@class ManchesViewController;
@class StatisticsViewController;
@class PlayersViewController;

@interface GameMainViewController : UITabBarController <NewRoundDelegate> {
	NSArray *players;
	RankingViewController *rankingTab;
	ManchesViewController *manchesTab;
	StatisticsViewController *statsTab;
	PlayersViewController *playersTab;
}

@property (nonatomic, copy) NSArray *players;
@property (nonatomic, retain) RankingViewController *rankingTab;
@property (nonatomic, retain) ManchesViewController *manchesTab;
@property (nonatomic, retain) StatisticsViewController *statsTab;
@property (nonatomic, retain) PlayersViewController *playersTab;

@end
