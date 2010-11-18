//
//  ManchesViewController.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 26/09/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "ManchesViewController.h"
#import "ManchesView.h"
#import "ManchesPlayersView.h"
#import "RoundDetails.h";

@implementation ManchesViewController

@synthesize manchesView, manchesPlayerView, players, scrollView, roundNum;

- (void)viewDidLoad {
    [super viewDidLoad];
	[manchesPlayerView initWithPlayers:players];
}

#pragma mark -
#pragma mark Methods

- (void)updateViewWithRound:(RoundDetails *)round {
	[manchesPlayerView updateViewWithRoundDetails:round];
	[manchesView addRound:round withRoundNum:roundNum];
	roundNum++;
	
	scrollView.contentSize = CGSizeMake(15 + roundNum * 60, 367);
}

#pragma mark -
#pragma mark Memory Management

- (void)viewDidUnload {
	[super viewDidUnload];
	self.manchesView = nil;
	self.manchesPlayerView = nil;
}

- (void)dealloc {
    [super dealloc];
	[manchesView release], manchesView = nil;
	[manchesPlayerView release], manchesPlayerView = nil;
}


@end
