//
//  NewGameDetailViewController.h
//  TarotBoard
//
//  Created by Matthieu Tabuteau on 08/05/10.
//  Copyright 2010 Matthieu Tabuteau. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Player;

@interface NewGameDetailViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate,
																UIActionSheetDelegate> {
	Player *player;
	UITableViewCell *cellPicture;
	UITableViewCell *cellName;
	UITextField *fieldName;
	UIImageView *imgPhoto;
	UIButton *btnPhoto;
}

@property (nonatomic, retain) Player *player;
@property (nonatomic, retain) IBOutlet UITableViewCell *cellPicture;
@property (nonatomic, retain) IBOutlet UITableViewCell *cellName;
@property (nonatomic, retain) IBOutlet UITextField *fieldName;
@property (nonatomic, retain) IBOutlet UIImageView *imgPhoto;
@property (nonatomic, retain) IBOutlet UIButton *btnPhoto;

- (IBAction)btnPhotoPressed:(id)sender;

@end
