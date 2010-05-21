//
//  MainMenu.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 28/04/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "MainMenuViewController.h"
#import "NewGameViewController.h"
#import "StatisticsMainViewController.h"

@implementation MainMenuViewController


#define NEW_GAME_INDEX 1
#define CONTINUE_GAME_INDEX 0
#define STATISTICS_INDEX 2


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	self.title = @"Main Menu";
	
    [super viewDidLoad];
}


#pragma mark -
#pragma mark Events

- (void)newGamePressed {
	NewGameViewController *newGame = [[NewGameViewController alloc] initWithNibName:@"MainMenu" bundle:nil];
	
	[self.navigationController pushViewController:newGame animated:YES];
	[newGame release];
}


- (void)continueGamePressed {
	
}


- (void)statisticsPressed {
	StatisticsMainViewController *statistics = [[StatisticsMainViewController alloc] initWithNibName:@"StatisticsMain" bundle:nil];
	
	[self.navigationController pushViewController:statistics animated:YES];
	[statistics release];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.textLabel.textAlignment = UITextAlignmentLeft;
	switch (indexPath.section) {
		case NEW_GAME_INDEX:
			cell.textLabel.text = @"New Game";
			break;
		case CONTINUE_GAME_INDEX:
			cell.textLabel.text = @"Continue Game";
			cell.hidden = YES;
			break;
		case STATISTICS_INDEX:
			cell.textLabel.text = @"Statistics";
			cell.detailTextLabel.text = @"No statistics";
			cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
			break;
	}

    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	switch (indexPath.section) {
		case NEW_GAME_INDEX:
			[self newGamePressed];
			break;
		case CONTINUE_GAME_INDEX:
			break;
		case STATISTICS_INDEX:
			[self statisticsPressed];
			break;
	}
}


#pragma mark -
#pragma mark Memory management

- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
    [super dealloc];
}


@end
