//
//  NewRoundPageButtons.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 09/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "NewRoundPageButtons.h"

@implementation NewRoundPageButtons

#define START_BUTTON_X 48
#define START_BUTTON_Y 60
#define BUTTON_WIDTH 223
#define BUTTON_HEIGHT 54

@synthesize lblPageTitle, backColor, buttons, selectedButton, selectedIndex, pageNumber, delegate;

- (void)loadView {
	self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
	[self.view setBackgroundColor:backColor];
	
	UILabel *pageTitle = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 281, 30)];
	[pageTitle setText:lblPageTitle];
	[pageTitle setBackgroundColor:backColor];
	[pageTitle setFont:[UIFont boldSystemFontOfSize:20]];
	[self.view addSubview:pageTitle];
	[pageTitle release];
	
	for (int i = 0; i < [buttons count]; i++) {
		NSString *btnName = [buttons objectAtIndex:i];
		UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		[btn setFrame:CGRectMake(START_BUTTON_X,
								 START_BUTTON_Y * (1 + i),
								 BUTTON_WIDTH,
								 BUTTON_HEIGHT)];
		[btn setTitle:btnName forState:UIControlStateNormal];
		[btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
		[btn setContentEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
		[btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 0)];
		[btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
		btn.tag = i;
		[self.view addSubview:btn];
	}
}

- (void)btnClicked:(id)sender{
	[selectedButton setImage:nil forState:UIControlStateNormal];
	selectedButton = sender;
	[selectedButton setImage:[UIImage imageNamed:@"user.png"] forState:UIControlStateNormal];
	selectedIndex = selectedButton.tag;
	[delegate newRoundPageButtonsClicked:self];
}
											 
- (id)initTitle:(NSString *)_pageTitle withColor:(UIColor *)_color withArray:(NSArray *)_array withPageNumber:(int)_pageNumber {
	if (self = [super init]) {
		self.lblPageTitle = _pageTitle;
		self.backColor = _color;
		self.buttons = _array;
		self.pageNumber = _pageNumber;
	}
	
	return self;
}

- (void)dealloc {
    [super dealloc];
	[lblPageTitle release], lblPageTitle = nil;
	[backColor release], backColor = nil;
	[buttons release], buttons = nil;
	[selectedButton release], selectedButton = nil;
}


@end
