//
//  GameMenu.m
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-17.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import "GameMenu.h"
#import "GameMenuItem.h"
#import "TurretSpace.h"
#import "Turret.h"

@implementation GameMenu
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
		backgroundImage.image = [UIImage imageNamed:@"box.png"];
		[self addSubview:backgroundImage];
		
		GameMenuItem *firstItem = [[GameMenuItem alloc] initWithFrame:CGRectMake(5.0, 5.0, 50, 50) turret:[Turret umbrellaDispenser]];
		firstItem.delegate = self;
		
		GameMenuItem *secondItem = [[GameMenuItem alloc] initWithFrame:CGRectMake(60.0, 5.0, 50, 50) turret:[Turret emptyTurret]];
		secondItem.delegate = self;
		
		GameMenuItem *thirdItem = [[GameMenuItem alloc] initWithFrame:CGRectMake(115.0, 5.0, 50, 50) turret:[Turret lightningRod]];
		thirdItem.delegate = self;
		
		menuItems = [NSArray arrayWithObjects:firstItem,secondItem,thirdItem,nil];
		[menuItems retain];
		
		for (GameMenuItem *item in menuItems)
		{
			[self addSubview:item];
			[item release];
		}
		
		// Chosen turret initialization
		turretThumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(10, 160, 60, 60)];
		turretThumbnail.image = [UIImage imageNamed:@"t_umbrella.png"];
		[self addSubview:turretThumbnail];
		[turretThumbnail release];
		
		turretName = [[UILabel alloc] initWithFrame:CGRectMake(80, 160, 120, 13)];
		turretName.backgroundColor = [UIColor clearColor];
		[turretName setFont:[UIFont fontWithName:@"Helvetica" size:8]];
		turretName.text = @"Umbrella Shooter"; // Should load it from the GameMenuItem object
		[self addSubview:turretName];
		[turretName release];
		
		turretDescription = [[UITextView alloc] initWithFrame:CGRectMake(70, 170, 120, 40)];
		turretDescription.backgroundColor = [UIColor clearColor];
		[turretDescription setFont:[UIFont fontWithName:@"Helvetica" size:8]];
		turretDescription.text = @"Shoots umbrellas and then they drop down stopping other drops on the way.... spam spam spam spam spam";
		// Should load it from the GameMenuItem object
		[self addSubview:turretDescription];
		[turretDescription release];
		
		dismissButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		dismissButton.frame = CGRectMake(180, 215, 35, 23);
		[dismissButton addTarget:self action:@selector(dismissMenu) forControlEvents:UIControlEventTouchUpInside];
		[dismissButton setTitle:@"Ok" forState:UIControlStateNormal];
		[self addSubview:dismissButton];
		
		purchase = [UIButton buttonWithType:UIButtonTypeRoundedRect];
		purchase.frame = CGRectMake(185, 180, 23, 23);
		[purchase addTarget:self action:@selector(purchaseTurret) forControlEvents:UIControlEventTouchUpInside];
		[purchase setTitle:@"$$" forState:UIControlStateNormal];
		[self addSubview:purchase];
		
		
		self.hidden = TRUE;
	}
    return self;
}

- (void)showMenu:(TurretSpace *)turretSpace {
	
	Turret *someTurret = (Turret *)turretSpace.turret;
	
	turretDescription.text = someTurret.description;
	turretName.text = someTurret.name;
	turretThumbnail.image = [UIImage imageNamed:someTurret.thumbnail];
	
	self.hidden = FALSE;
	currentTurret = turretSpace;
}

- (void)purchaseTurret {
	currentTurret.turret = selectedMenuItem.turretType;
}

- (void)dismissMenu {
	self.hidden = TRUE;
	[delegate menuDismissed];
}

- (void)choseItem:(GameMenuItem *)item {
	turretDescription.text = item.description;
	turretName.text = item.name;
	turretThumbnail.image = item.thumbnail.image;
	selectedMenuItem = item;
}

- (void)dealloc {
    [super dealloc];
}


@end
