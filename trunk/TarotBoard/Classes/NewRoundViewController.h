//
//  NewRoundViewController.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 05/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewRoundPageButtons.h"

@class Player, NewRoundViewController, NewRound;

@protocol NewRoundDelegate

- (void)newRound:(id)sender doneWithRound:(NewRound *)round;

@end


@interface NewRoundViewController : UIViewController <UIScrollViewDelegate, UIPickerViewDelegate,
													  UIPickerViewDataSource, NewRoundPageDelegate> {
	id <NewRoundDelegate> delegate;
	NSArray *players;
	UIPageControl *pageControl;
	UIScrollView *scrollView;
	NewRoundPageButtons *pagePreneur;
	NewRoundPageButtons *pageContrat;
	NewRoundPageButtons *pagePartenaire;
	UIView *pageScore;
	UIPickerView *scorePicker;
}

@property (assign) id <NewRoundDelegate> delegate;
@property (nonatomic, copy) NSArray *players;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) NewRoundPageButtons *pagePreneur;
@property (nonatomic, retain) NewRoundPageButtons *pageContrat;
@property (nonatomic, retain) NewRoundPageButtons *pagePartenaire;
@property (nonatomic, retain) IBOutlet UIView *pageScore;
@property (nonatomic, retain) IBOutlet UIPickerView *scorePicker;

- (IBAction)changePage:(id)sender;
- (IBAction)btnCancelClicked:(id)sender;
- (IBAction)btnDoneClicked:(id)sender;
- (void)scrollPage:(int)page;

@end
