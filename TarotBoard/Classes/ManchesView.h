//
//  ManchesView.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 19/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RoundDetails;

@interface ManchesView : UIView {
	int roundNumm;
}

- (void)addRound:(RoundDetails *)round withRoundNum:(int)roundNum;

@end
