//
//  NewRoundPageButtons.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 09/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewRoundPageDelegate

- (void)newRoundPageButtonsClicked:(id)sender; 

@end


@interface NewRoundPageButtons : UIViewController {
	id <NewRoundPageDelegate> delegate;
	NSString *lblPageTitle;
	UIColor *backColor;
	NSArray *buttons;
	UIButton *selectedButton;
	int selectedIndex;
	int pageNumber;
}

@property (assign) id <NewRoundPageDelegate> delegate;
@property (nonatomic, copy) NSString *lblPageTitle;
@property (nonatomic, retain) UIColor *backColor;
@property (nonatomic, copy) NSArray *buttons;
@property (nonatomic, retain) UIButton *selectedButton;
@property (nonatomic) int selectedIndex;
@property (nonatomic) int pageNumber;

- (id)initTitle:(NSString*)_title withColor:(UIColor *)_color withArray:(NSArray *)_array withPageNumber:(int)_pageNumber;

@end
