//
//  NewGameDetailViewController.m
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 08/05/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import "NewGameDetailViewController.h"
#import "Player.h"

@implementation NewGameDetailViewController

@synthesize player, cellPicture, cellName, fieldName, imgPhoto, btnPhoto;

#define ROW_HEIGHT_PHOTO 100
#define ROW_HEIGHT_DEFAULT 44
#define SECTION_INDEX_PHOTO 0

#define PHOTO_ACTION_CAMERA "Use camera"
#define PHOTO_ACTION_LIBRARY "Photo library"
#define ACTION_CANCEL "Cancel"

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	self.title = @"Edit Player";

	choosePicture = NO;
	UIBarButtonItem *cancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
															   style:UIBarButtonItemStylePlain
															  target:self action:@selector(navigationCancel:)];
	UIBarButtonItem *confirm = [[UIBarButtonItem alloc] initWithTitle:@"Done"
																style:UIBarButtonItemStyleDone
															   target:self action:@selector(navigationConfirm:)];
	self.navigationItem.leftBarButtonItem = cancel;
	self.navigationItem.rightBarButtonItem = confirm;

	[cancel release];
	[confirm release];
    [super viewDidLoad];
}


- (void)viewWillAppear:(BOOL)animated {
	if (!choosePicture) {
		self.fieldName.text = player.name;
		self.imgPhoto.image = player.photo;
	}
	else {
		choosePicture = NO;
	}

}


- (void)viewDidAppear:(BOOL)animated {
	[self.fieldName becomeFirstResponder];
}


#pragma mark -
#pragma mark Events

- (IBAction)navigationCancel:(id)sender {
	[self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)navigationConfirm:(id)sender {
	player.name = fieldName.text;
	player.photo = imgPhoto.image;
	
	[self.navigationController popViewControllerAnimated:YES];
}


- (IBAction)btnPhotoPressed:(id)sender {
	UIActionSheet *action = [[UIActionSheet alloc] initWithTitle:nil
														delegate:self
											   cancelButtonTitle:@ACTION_CANCEL
										  destructiveButtonTitle:nil
											   otherButtonTitles:@PHOTO_ACTION_CAMERA, @PHOTO_ACTION_LIBRARY, nil];
	NSString *name = fieldName.text;
	[action showInView:self.view];
	
	fieldName.text = name;
	[action release];
}


#pragma mark -
#pragma mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if ([actionSheet buttonTitleAtIndex:buttonIndex] != @ACTION_CANCEL) {
		UIImagePickerController *picker = [[UIImagePickerController alloc] init];
		picker.delegate = self;
		picker.allowsEditing = YES;
		picker.sourceType = [actionSheet buttonTitleAtIndex:buttonIndex] == @PHOTO_ACTION_CAMERA ?
		UIImagePickerControllerSourceTypeCamera : UIImagePickerControllerSourceTypePhotoLibrary;
		
		choosePicture = YES;
		[self presentModalViewController:picker animated:YES];
		[picker release];
	}
}

#pragma mark -
#pragma mark UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker
		didFinishPickingImage:(UIImage *)image
				  editingInfo:(NSDictionary *)editingInfo {
	imgPhoto.image = image;
	[picker dismissModalViewControllerAnimated:YES];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
	[picker dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == SECTION_INDEX_PHOTO) {
        return cellPicture;
    }
    
	return cellName;
}


#pragma mark -
#pragma mark Table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) {
		return ROW_HEIGHT_PHOTO;
	}
	
	return ROW_HEIGHT_DEFAULT;
}


#pragma mark -
#pragma mark Memory management

- (void)viewDidUnload {
	self.player = nil;
	self.cellPicture = nil;
	self.cellName = nil;
	self.fieldName = nil;
	self.imgPhoto = nil;
	self.btnPhoto = nil;
    [super viewDidUnload];
}


- (void)dealloc {
	[player release];
	[cellPicture release];
	[cellName release];
	[fieldName release];
	[imgPhoto release];
	[btnPhoto release];
    [super dealloc];
}


@end
