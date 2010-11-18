//
//  NewRoundViewController.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 05/10/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "NewRoundViewController.h"
#import "Player.h"
#import "NewRoundPageButtons.h"
#import "NewRound.h"
#import "Utility.h"

@implementation NewRoundViewController

@synthesize players, pageControl, scrollView, pagePreneur, pageContrat, pagePartenaire, pageScore, delegate, scorePicker;

- (void)viewDidLoad{
	scrollView.pagingEnabled = YES;
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width * 4, scrollView.frame.size.height);
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.scrollsToTop = NO;
	scrollView.directionalLockEnabled = YES;
	scrollView.delegate = self;
	
	pageControl.numberOfPages = 4;
	pageControl.currentPage = 0;

	NSMutableArray *playerNames = [[NSMutableArray alloc] initWithCapacity:[players count]];
	for (int i = 0; i < [players count]; i++) {
		[playerNames addObject:[[players objectAtIndex:i] name]];
	}
	
	//page1
	CGRect frame = scrollView.frame;
	frame.origin.x = frame.size.width * 0;
	frame.origin.y = 0;
	pagePreneur = [NewRoundPageButtons alloc];
	[pagePreneur initTitle:@"Page 1. Le preneur:" 
				 withColor:[UIColor colorWithRed:1 green:0.8 blue:0.4 alpha:1]
				 withArray:playerNames
			withPageNumber:1];
	pagePreneur.delegate = self;
	UIView *myView = [pagePreneur view];
	myView.frame = frame;
	[scrollView addSubview:myView];
	
	//page2
	frame.origin.x = frame.size.width * 1;
	frame.origin.y = 0;
	pageContrat = [NewRoundPageButtons alloc];
	[pageContrat initTitle:@"Page 2. Le contrat:"
				 withColor:[UIColor colorWithRed:0.8 green:1 blue:0.4 alpha:1]
				 withArray:[[NSArray alloc] initWithObjects:
					  @"Prise",
					  @"Garde",
					  @"Garde sans",
					  @"Garde contre", nil]
			withPageNumber:2];
	pageContrat.delegate = self;
	myView = [pageContrat view];
	myView.frame = frame;
	[scrollView addSubview:myView];
	
	//page3
	frame.origin.x = frame.size.width * 2;
	frame.origin.y = 0;
	pagePartenaire = [NewRoundPageButtons alloc];
	[pagePartenaire initTitle:@"Page 3. Le partenaire:"
					withColor:[UIColor colorWithRed:0.4 green:1 blue:0.8 alpha:1]
					withArray:playerNames
			   withPageNumber:3];
	pagePartenaire.delegate = self;
	myView = [pagePartenaire view];
	myView.frame = frame;
	[scrollView addSubview:myView];
	
	//page4
	frame.origin.x = frame.size.width * 3;
	frame.origin.y = 0;
	pageScore.frame = frame;
	[scrollView addSubview:pageScore];
	
	[playerNames release];
}

#pragma mark -
#pragma mark Events

- (void)newRoundPageButtonsClicked:(id)sender {
	int page = [sender pageNumber];
	[self scrollPage:page];
}

- (IBAction)changePage:(id)sender {
	int page = pageControl.currentPage;
	[self scrollPage:page];
}

- (void)scrollPage:(int)page {
	CGRect frame = scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [scrollView scrollRectToVisible:frame animated:YES];
}

- (void)btnCancelClicked:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

- (void)btnDoneClicked:(id)sender {
	int bouts = [scorePicker selectedRowInComponent:0];
	int score = [scorePicker selectedRowInComponent:1];
	
	if (pagePreneur.selectedIndex != -1 &&
		pagePartenaire.selectedIndex != -1 &&
		pageContrat.selectedIndex != -1) {
		
		NewRound *round = [[NewRound alloc] initWithPreneur:pagePreneur.selectedIndex
											 withPartenaire:pagePartenaire.selectedIndex
												withContrat:[Utility contratTypeForIndex:pageContrat.selectedIndex]
												  withBouts:bouts
												  withScore:score];
		[delegate newRound:self doneWithRound:round];
		[self dismissModalViewControllerAnimated:YES];
	}
	else  {
		
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Nouvelle manche"
														message:@"Vous n'avez pas sélectionné toutes les informations nécessaires."
													   delegate:nil
											  cancelButtonTitle:@"Désolé"
											  otherButtonTitles:nil];
		[alert show];
		[alert release];
	}

	
}

#pragma mark -
#pragma mark UIPickerView

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 2;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
	if (component == 0) { //Nombre de bouts
		return 120;
	}
	else { //Score
		return 130;
	}

}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	if (component == 0) { //Nombre de bouts
		return 4;
	}
	else { //Score
		return 92;
	}
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
	return [NSString stringWithFormat:@"%d", row];
}

#pragma mark -
#pragma mark Scrolling

- (void)scrollViewDidScroll:(UIScrollView *)sender {
	CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    pageControl.currentPage = page;
}

#pragma mark -
#pragma mark Memory Managment

- (void)viewDidUnload {
	self.pageControl = nil;
	self.scrollView = nil;
	self.pagePreneur = nil;
	self.pageContrat = nil;
	self.pagePartenaire = nil;
	self.pageScore = nil;
    [super viewDidUnload];
}

- (void)dealloc {
	[players release], players = nil;
	[pageControl release], pageControl = nil;
	[scrollView release], scrollView = nil;
	[pagePreneur release], pagePreneur = nil;
	[pageContrat release], pageContrat = nil;
	[pagePartenaire release], pagePartenaire = nil;
	[pageScore release], pageScore = nil;
    [super dealloc];
}


@end
