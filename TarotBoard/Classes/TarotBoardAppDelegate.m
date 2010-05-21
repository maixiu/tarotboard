//
//  TarotBoardAppDelegate.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 23/04/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "TarotBoardAppDelegate.h"

@implementation TarotBoardAppDelegate

@synthesize window;
@synthesize navController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
	[window addSubview: navController.view];
    [window makeKeyAndVisible];
	
	return NO;
}

- (void)dealloc {
    [window release];
	[navController release];
    [super dealloc];
}


@end
