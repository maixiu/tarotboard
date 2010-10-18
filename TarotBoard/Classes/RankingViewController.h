//
//  ClassementViewController.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 24/09/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RankingUserControl;

@interface RankingViewController : UIViewController <UIScrollViewDelegate> {
	NSArray *players;
	NSArray *rankings;
	RankingUserControl *ranking1;
	RankingUserControl *ranking2;
	RankingUserControl *ranking3;
	RankingUserControl *ranking4;
	RankingUserControl *ranking5;
	UIScrollView *scrollView;
}

@property (nonatomic, copy) NSArray *players;
@property (nonatomic, readonly, copy) NSArray *rankings;
@property (nonatomic, retain) IBOutlet RankingUserControl *ranking1;
@property (nonatomic, retain) IBOutlet RankingUserControl *ranking2;
@property (nonatomic, retain) IBOutlet RankingUserControl *ranking3;
@property (nonatomic, retain) IBOutlet RankingUserControl *ranking4;
@property (nonatomic, retain) IBOutlet RankingUserControl *ranking5;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;

- (void)updateViewWithPlayers:(NSArray *)_players;

@end
