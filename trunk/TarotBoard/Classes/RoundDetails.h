//
//  RoundDetails.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 13/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RoundDetails : NSObject {
	NSArray *roundScores;
	NSArray *finalScores;
	int preneurIndex;
	int partenaireIndex;
}

@property (nonatomic, copy) NSArray *roundScores;
@property (nonatomic, copy) NSArray *finalScores;
@property (nonatomic) int preneurIndex;
@property (nonatomic) int partenaireIndex;

@end
