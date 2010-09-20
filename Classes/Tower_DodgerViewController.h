//
//  Tower_DodgerViewController.h
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-15.
//  Copyright Bloq Software 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "TurretSpace.h"
#import "GameMenu.h"

@interface Tower_DodgerViewController : UIViewController <TurretSpaceDelegate, GameMenuDelegate> {
	// Difficulty is a number from 1 - infinity
	// It increases on a x^.5 scale. (Fast then slow)
	int difficulty;
	
	// Loops
	NSTimer *gameLoop;
	NSTimer *createDropLoop;
	NSTimer *shootUmbrellas;
	float dropsPerMinute;
	float timeElapsed;
	
	// Game Items
	NSArray *turretSpaces;
	NSMutableSet *drops;
	NSMutableSet *umbrellas;
	NSMutableSet *umbrellaShooters;
	
	Person *player;
	GameMenu *gameMenu;
	
	BOOL playerMoving;
}


// Game Actions
- (void)startGame;

@end

