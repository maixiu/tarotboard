//
//  NewGameViewController.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 06/05/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Player, NewGameDetailViewController;

@interface NewGameViewController : UITableViewController {
	NSArray *players;
	NewGameDetailViewController *detailViewController;
}

@property (nonatomic, retain) NSArray *players;
@property (nonatomic, retain) NewGameDetailViewController *detailViewController;

@end
