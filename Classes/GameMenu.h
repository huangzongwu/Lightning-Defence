//
//  GameMenu.h
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-17.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameMenuItem.h"
#import "TurretSpace.h"

@protocol GameMenuDelegate
@required
- (void)menuDismissed;
- (void)turretPurchased:(id)turret Type:(NSString *)nameOfType;

@end


@interface GameMenu : UIView <GameMenuItemDelegate> {
	NSArray *menuItems;
	
	id <GameMenuDelegate> delegate;
	
	// UI
	UIImageView *backgroundImage;
	UIImageView *turretThumbnail;
	UILabel *turretName;
	UITextView *turretDescription;
	UIButton *dismissButton;
	UIButton *purchase;
	
	// Managmenet
	TurretSpace *currentTurret;
	GameMenuItem *selectedMenuItem;
}

@property (nonatomic, assign) id <GameMenuDelegate> delegate;

// Showing / Hiding Menu
- (void)showMenu:(TurretSpace *)turretSpace;

@end
