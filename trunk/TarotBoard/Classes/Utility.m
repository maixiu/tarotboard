//
//  Utility.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 13/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "Utility.h"
#import "NewRound.h"

@implementation Utility

+ (ContratType)contratTypeForIndex:(int)index {
	if (index == 0)
		return ContratTypePrise;
	else if (index == 1)
		return ContratTypeGarde;
	else if (index == 2)
		return ContratTypeGardeSans;
	else {
		return ContratTypeGardeContre;
	}
}

@end
