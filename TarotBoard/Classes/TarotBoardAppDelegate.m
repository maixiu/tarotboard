//
//  TarotBoardAppDelegate.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 23/04/10.
//  Copyright Intitek 2010. All rights reserved.
//

#import "TarotBoardAppDelegate.h"

@implementation TarotBoardAppDelegate

@synthesize window;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	
    [window makeKeyAndVisible];
	
	return NO;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
