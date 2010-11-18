//
//  GameMainViewController.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 03/06/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "GameMainViewController.h"
#import "ManchesViewController.h"
#import "NewRound.h"
#import "NewRoundViewController.h"
#import "Player.h"
#import "PlayersViewController.h"
#import "RankingViewController.h"
#import "RoundDetails.h"
#import "ScoringBase.h";
#import "ScoringOfficial.h";
#import "ScoringFamily.h";
#import "StatisticsViewController.h"

@implementation GameMainViewController

@synthesize players, rankingTab, manchesTab, statsTab, playersTab;

- (void)viewDidLoad {
    self.title = @"Game";
	
	[self.navigationItem setHidesBackButton:YES];
	[self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"+"
																				style:UIBarButtonSystemItemAdd
																			   target:self
																			   action:@selector(newMancheClicked:)]];
	
	NSMutableArray *tabs = [[NSMutableArray alloc] initWithCapacity:1];
	
	RankingViewController *initRankingTab = [[RankingViewController alloc] initWithNibName:@"Ranking" bundle:nil];
	initRankingTab.title = @"Partie";
	initRankingTab.tabBarItem.image = [UIImage imageNamed:@"group.png"];
	self.rankingTab = initRankingTab;
	[tabs addObject:initRankingTab];
	
	ManchesViewController *initManchesTab = [[ManchesViewController alloc] initWithNibName:@"Manches" bundle:nil];
	initManchesTab.title = @"Manches";
	initManchesTab.tabBarItem.image = [UIImage imageNamed:@"bar-chart.png"];
	[initManchesTab loadView];
	self.manchesTab = initManchesTab;
	[tabs addObject:initManchesTab];
	
	StatisticsViewController *initStatsTab = [[StatisticsViewController alloc] initWithNibName:@"Statistics" bundle:nil];
	initStatsTab.title = @"Statistiques";
	initStatsTab.tabBarItem.image = [UIImage imageNamed:@"line-chart.png"];
	self.statsTab = initStatsTab;
	[tabs addObject:initStatsTab];
	
	PlayersViewController *initPlayersTab = [[PlayersViewController alloc] initWithNibName:@"Players" bundle:nil];
	initPlayersTab.title = @"Joueurs";
	initPlayersTab.tabBarItem.image = [UIImage imageNamed:@"user.png"];
	self.playersTab = initPlayersTab;
	[tabs addObject:initPlayersTab];
	
	[self setViewControllers:tabs];
	
	[initRankingTab release];
	[initManchesTab release];
	[initStatsTab release];
	[initStatsTab release];
	[tabs release];
	[super viewDidLoad];
}

- (void)setPlayers:(NSArray *)_players {
	[players release];
	players = [_players copy];
	rankingTab.players = players;
	manchesTab.players = players;
}

#pragma mark -
#pragma mark Events

- (void)newMancheClicked:(id)sender {
	NewRoundViewController *newRound = [[NewRoundViewController alloc] initWithNibName:@"NewRound" bundle:nil];
	newRound.players = players;
	newRound.delegate = self;
	[newRound setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
	[self presentModalViewController:newRound animated:YES];
	[newRound release];
}

- (void)newRound:(id)sender doneWithRound:(NewRound *)round {
	ScoringBase *scoring = [[ScoringFamily alloc] init];
	RoundDetails *details = [scoring roundDetailsFromNewRound:round fromPlayers:players];

	//update the players score
	for (int i = 0; i < [players count]; i++) {
		Player *p = [players objectAtIndex:i];
		p.score = [[details.finalScores objectAtIndex:i] intValue];
	}
	
	[rankingTab updateViewWithPlayers:players];
	[manchesTab updateViewWithRound:details];
}

#pragma mark -
#pragma mark Memory managment

- (void)viewDidUnload {
	players = nil;
	rankingTab = nil;
	manchesTab = nil;
	statsTab = nil;
	playersTab = nil;
    [super viewDidUnload];
}

- (void)dealloc {
	[players release], players = nil;
	[rankingTab release], rankingTab = nil;
	[manchesTab release], manchesTab = nil;
	[statsTab release], statsTab = nil;
	[playersTab release], playersTab = nil;
    [super dealloc];
}


@end
