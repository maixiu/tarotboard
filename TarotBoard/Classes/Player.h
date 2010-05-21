//
//  Player.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 06/05/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Player : NSObject {
	NSString *name;
	UIImage *photo;
}

- (id)initWithName:(NSString *)initName withPhoto:(UIImage *)initPhoto;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) UIImage *photo;

@end
