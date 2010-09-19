//
//  GameMenuItem.h
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-17.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Turret.h"

@protocol GameMenuItemDelegate
@required
- (void)choseItem:(id)item;

@end


@interface GameMenuItem : UIView {
	id <GameMenuItemDelegate> choseItem;
	
	NSString *name;
	NSString *description;
	UIImageView *thumbnail;
	
	id turretType;
	
}

@property (nonatomic, assign) id <GameMenuItemDelegate> delegate;

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) UIImageView *thumbnail;

@property (nonatomic, retain) id turretType;


- (id)initWithFrame:(CGRect)frame turret:(Turret *)turret;

@end
