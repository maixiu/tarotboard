//
//  GameMainViewController.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 03/06/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "GameMainViewController.h"
#import "ClassementViewController.h"
#import "ManchesViewController.h"
#import "StatisticsViewController.h"
#import "PlayersViewController.h"

@implementation GameMainViewController

- (void)viewDidLoad {
    self.title = @"Game";
	
	NSMutableArray *tabs = [[NSMutableArray alloc] initWithCapacity:1];
	
	ClassementViewController *classementTab = [[ClassementViewController alloc] initWithNibName:@"Classement" bundle:nil];
	classementTab.title = @"Classement";
	classementTab.tabBarItem.image = [UIImage imageNamed:@"group.png"];
	[tabs addObject:classementTab];
	
	ManchesViewController *manchesTab = [[ManchesViewController alloc] initWithNibName:@"Manches" bundle:nil];
	manchesTab.title = @"Manches";
	manchesTab.tabBarItem.image = [UIImage imageNamed:@"bar-chart.png"];
	[tabs addObject:manchesTab];
	
	StatisticsViewController *statisticsTab = [[StatisticsViewController alloc] initWithNibName:@"Statistics" bundle:nil];
	statisticsTab.title = @"Statistiques";
	statisticsTab.tabBarItem.image = [UIImage imageNamed:@"line-chart.png"];
	[tabs addObject:statisticsTab];
	
	PlayersViewController *playersTab = [[PlayersViewController alloc] initWithNibName:@"Players" bundle:nil];
	playersTab.title = @"Joueurs";
	playersTab.tabBarItem.image = [UIImage imageNamed:@"user.png"];
	[tabs addObject:playersTab];
	
	[self setViewControllers:tabs];
	
	[classementTab release];
	[manchesTab release];
	[statisticsTab release];
	[playersTab release];
	[tabs release];
	[super viewDidLoad];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
    [super dealloc];
}


@end
