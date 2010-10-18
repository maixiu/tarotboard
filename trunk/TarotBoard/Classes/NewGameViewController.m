//
//  NewGameViewController.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 06/05/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "NewGameViewController.h"
#import "NewGameDetailViewController.h"
#import "GameMainViewController.h"
#import "Player.h"

@implementation NewGameViewController

@synthesize players, detailViewController;


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    self.title = @"New Game";
	
	NewGameDetailViewController *detail = [[NewGameDetailViewController alloc] initWithNibName:@"NewGameDetail" bundle:nil];
	
	//Init player list
	Player *player1 = [[Player alloc] initWithName:@"Player1" withPhoto:[UIImage imageNamed:@"empty_photo.png"]];
	Player *player2 = [[Player alloc] initWithName:@"Player2" withPhoto:[UIImage imageNamed:@"empty_photo.png"]];
	Player *player3 = [[Player alloc] initWithName:@"Player3" withPhoto:[UIImage imageNamed:@"empty_photo.png"]];
	Player *player4 = [[Player alloc] initWithName:@"Player4" withPhoto:[UIImage imageNamed:@"empty_photo.png"]];
	Player *player5 = [[Player alloc] initWithName:@"Player5" withPhoto:[UIImage imageNamed:@"empty_photo.png"]];
	
	NSArray *initPlayers = [[NSArray alloc] initWithObjects:player1, player2, player3, player4, player5, nil];
	self.players = initPlayers;
	self.detailViewController = detail;
	
	UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Start"
																	style:UIBarButtonItemStyleDone
																   target:self
																   action:@selector(navigationStartClick:)];
	self.navigationItem.rightBarButtonItem = rightButton;
	
	[rightButton release];
	[detail release];
	[initPlayers release];
	[player1 release];
	[player2 release];
	[player3 release];
	[player4 release];
	[player5 release];
	
	[super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
	[self.tableView reloadData];
}


#pragma mark -
#pragma mark Events

- (void)navigationStartClick:(id)sender {
	GameMainViewController *gameMainView = [[GameMainViewController alloc] initWithNibName:@"GameMainView" bundle:nil];
	
	gameMainView.players = players;
		
	[self.navigationController pushViewController:gameMainView animated:YES];
	
	[gameMainView release];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [players count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	Player *player = [players objectAtIndex:[indexPath section]];
    cell.textLabel.text = player.name;
	cell.imageView.image = player.photo;
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	detailViewController.player = [players objectAtIndex:[indexPath section]];
	
	[self.navigationController pushViewController:detailViewController animated:YES];
}


#pragma mark -
#pragma mark Memory management

- (void)viewDidUnload {
	self.players = nil;
	self.detailViewController = nil;
	[super viewDidUnload];
}


- (void)dealloc {
	[players release];
	[detailViewController release];
    [super dealloc];
}


@end

