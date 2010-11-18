//
//  ManchesViewController.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 26/09/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ManchesView, ManchesPlayersView, RoundDetails;

@interface ManchesViewController : UIViewController <UIScrollViewDelegate> {
	NSArray *players;
	ManchesView *manchesView;
	ManchesPlayersView *manchesPlayerView;
	UIScrollView *scrollView;
	int roundNum;
}

@property (nonatomic, retain) NSArray *players;
@property (nonatomic, retain) IBOutlet ManchesView *manchesView;
@property (nonatomic, retain) IBOutlet ManchesPlayersView *manchesPlayerView;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic) int roundNum;

- (void)updateViewWithRound:(RoundDetails *)round;

@end
