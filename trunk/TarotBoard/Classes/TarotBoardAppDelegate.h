//
//  TarotBoardAppDelegate.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 23/04/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TarotBoardAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	UINavigationController *navController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navController;

@end

