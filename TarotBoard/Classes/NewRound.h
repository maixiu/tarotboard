//
//  Round.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 13/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;


typedef enum {
	ContratTypePrise,
	ContratTypeGarde,
	ContratTypeGardeSans,
	ContratTypeGardeContre
} ContratType;


@interface NewRound : NSObject {
	int preneurIndex;
	int partenaireIndex;
	ContratType contrat;
	int bouts;
	int score;
}

@property (nonatomic) int preneurIndex;
@property (nonatomic) int partenaireIndex;
@property (nonatomic) ContratType contrat;
@property (nonatomic) int bouts;
@property (nonatomic) int score;

- (id)initWithPreneur:(int) _preneur withPartenaire:(int)_partenaire
		  withContrat:(ContratType) _contrat withBouts:(int) _bouts
			withScore:(int) _score;

@end
