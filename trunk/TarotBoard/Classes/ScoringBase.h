//
//  Scoring.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 13/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NewRound, RoundDetails;

@interface ScoringBase : NSObject {

}

- (RoundDetails *)roundDetailsFromNewRound:(NewRound *)round fromPlayers:(NSArray *)players;

@end
