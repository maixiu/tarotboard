//
//  Player.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 06/05/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "Player.h"


@implementation Player

@synthesize name, photo, score;

- (void)dealloc{
    [photo release];
    [super dealloc];
}

- (id)initWithName:(NSString *)initName withPhoto:(UIImage *)initPhoto {
	if (self = [super init]) {
		name = initName;
		photo = [initPhoto retain];
    }
	
    return self;
}

@end
