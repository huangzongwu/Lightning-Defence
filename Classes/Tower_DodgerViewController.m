//
//  Tower_DodgerViewController.m
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-15.
//  Copyright Bloq Software 2010. All rights reserved.
//

#import "Tower_DodgerViewController.h"
#import "Drop.h"
#import "Person.h"
#import "TurretSpace.h"
#import "GameMenu.h"
#import "Umbrella.h"

#define gameLoop_interval 0.01666
//#define createDrop_interval 0.01
#define createDrop_interval 0.5
#define seconds_per_minute 60

@implementation Tower_DodgerViewController

#pragma mark Initialization

- (void)startGame {
	
	//  Set of all water drops
	drops = [NSMutableSet set];
	[drops retain];
	
	// Set of all Umbrellas
	umbrellas = [NSMutableSet set];
	[umbrellas retain];
	
	//  The player, there is only one of these
	player = [[Person alloc] initPerson];
	[self.view addSubview:player];
	[Person release];
		
	// Game Menu
	gameMenu = [[GameMenu alloc] initWithFrame:CGRectMake(50, 90, 220, 240)];
	gameMenu.delegate = self;
	[self.view addSubview:gameMenu];
	[gameMenu release];
	
	//  Game loops
	gameLoop = [NSTimer scheduledTimerWithTimeInterval:gameLoop_interval target:self selector:@selector(runLoop) userInfo:nil repeats:TRUE];
	createDropLoop = [NSTimer scheduledTimerWithTimeInterval:createDrop_interval target:self selector:@selector(createDrop) userInfo:nil repeats:TRUE];
	
	//  Create turrets
	TurretSpace *turretLeftOne = [[TurretSpace alloc] initWithFrame:CGRectMake(0.0, 50, 40, 60)];
	turretLeftOne.delegate = self;
	[self.view addSubview:turretLeftOne];
	[turretLeftOne release];
	
	TurretSpace *turretLeftTwo = [[TurretSpace alloc] initWithFrame:CGRectMake(0.0, 130, 40, 60)];
	turretLeftTwo.delegate = self;
	[self.view addSubview:turretLeftTwo];
	[turretLeftTwo release];
	
	TurretSpace *turretLeftThree = [[TurretSpace alloc] initWithFrame:CGRectMake(0.0, 210, 40, 60)];
	turretLeftThree.delegate = self;
	[self.view addSubview:turretLeftThree];
	[turretLeftThree release];
	
	TurretSpace *turretLeftFour = [[TurretSpace alloc] initWithFrame:CGRectMake(0.0, 290, 40, 60)];
	turretLeftFour.delegate = self;
	[self.view addSubview:turretLeftFour];
	[turretLeftFour release];
	
	turretSpaces = [NSArray arrayWithObjects:turretLeftOne,turretLeftTwo,turretLeftThree,turretLeftFour,nil]; 
	[turretSpaces retain];
	
	
	
	// Instance variable initialization
	timeElapsed = 0.0;
	dropsPerMinute = 120;	
}

#pragma mark Loops

- (void)createDrop {
	timeElapsed += [createDropLoop timeInterval];
	if (timeElapsed >= seconds_per_minute / dropsPerMinute) {
		Drop *someDrop = [[Drop alloc] initDrop];
		[self.view addSubview:someDrop];
		[drops addObject:someDrop];
		[someDrop release];
		timeElapsed = 0.0;
	}
	
	/*
	Umbrella *someUmbrella = [[Umbrella alloc] initFromTurret:[turretSpaces objectAtIndex:3]];
	[umbrellas addObject:someUmbrella];
	[self.view addSubview:someUmbrella];*/
	
}

- (void)runLoop {
	
	// Move the player
	if (playerMoving) {
		[player move:gameLoop_interval];
	}
	
	// Umbrella Behavior
	for (Umbrella *someUmbrella in umbrellas)
	{
		[someUmbrella moveWithWind:0 interval:gameLoop_interval];
	}
	
	NSSet *tempSet = [NSSet setWithSet:drops];
	
	// Turret tracking
	for (TurretSpace *turretSpace in turretSpaces)
	{
		//[turretSpace followDrop:[turretSpace trackNearestDrop:[NSMutableSet setWithSet:drops]]];
		[turretSpace passiveRotate:gameLoop_interval];
	}
	
	// Drops physics
	for (Drop *someDrop in [tempSet objectEnumerator])
	{
		[someDrop moveWithWind:20 interval:gameLoop_interval];
		if ([someDrop canCollide] && [someDrop checkCollision:CGRectMake(0.0, 420, self.view.frame.size.width, self.view.frame.size.height - 420)])
		{
			[drops removeObject:someDrop];
			[someDrop collided];
		}
		else if ([someDrop canCollide] && [someDrop checkCollision:player.frame])
		{
			[drops removeObject:someDrop];
			[someDrop collided];
		}

	}
}

- (void)pauseGame {
	[gameLoop retain];
	[createDropLoop retain];
	[gameLoop invalidate];
	[createDropLoop invalidate];
}

- (void)unpauseGame {
	gameLoop = [NSTimer scheduledTimerWithTimeInterval:gameLoop_interval target:self selector:@selector(runLoop) userInfo:nil repeats:TRUE];
	createDropLoop = [NSTimer scheduledTimerWithTimeInterval:createDrop_interval target:self selector:@selector(createDrop) userInfo:nil repeats:TRUE];
}

#pragma mark GameMenu

- (void)showGameMenu:(id)turretSpace{
	[gameMenu showMenu:(TurretSpace *)turretSpace];
	if ([gameLoop isValid] && [createDropLoop isValid])
	{
		[self pauseGame];
	}
	
	[self.view bringSubviewToFront:gameMenu];

}

- (void)menuDismissed {
	[self unpauseGame];
}

#pragma mark Touch Management

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	playerMoving = TRUE;
	
	if ([((UITouch *)[touches anyObject]) locationInView:self.view].x > 160)
	{
		[player movingRight];
	}
	else { [player movingLeft]; }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	playerMoving = FALSE;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
