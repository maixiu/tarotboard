//
//  Round.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 13/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "NewRound.h"


@implementation NewRound

@synthesize preneurIndex, partenaireIndex, contrat, bouts, score;

- (id)initWithPreneur:(int)_preneur withPartenaire:(int)_partenaire
		  withContrat:(ContratType)_contrat withBouts:(int)_bouts withScore:(int)_score {
	if (self = [super init]) {
		self.preneurIndex = _preneur;
		self.partenaireIndex = _partenaire;
		self.contrat = _contrat;
		self.bouts = _bouts;
		self.score = _score;
	}
	
	return self;
}
		
@end
