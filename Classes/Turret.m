//
//  Turret.m
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-18.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import "Turret.h"
#import "Turret_UmbrellaDispenser.h"
#import "Drop.h"


@implementation Turret
@synthesize name;
@synthesize description;
@synthesize thumbnail;
@synthesize position;
@synthesize rotation;
@synthesize turretImage;

#pragma mark Turret Class Methods
+ (id)emptyTurret {
	return [[Turret alloc] initWithName:@"Empty Turret" description:@"Please choose a turret" thumbnail:@"nil.png"];
}

+ (id)umbrellaDispenser {
	return [[Turret_UmbrellaDispenser alloc] initWithName:@"Umbrella Dispenser" description:@"Shoots umbrellas that help stop raindrops" thumbnail:@"t_umbrella.png"];
}

+ (id)lightningRod {
	return [[Turret alloc] initWithName:@"Lightning Rod" description:@"Percent chance of absorbing lightning" thumbnail:@"t_lightningRod.png"]; 
}


- (id)initWithName:(NSString *)itemName description:(NSString *)itemDescription thumbnail:(NSString *)imgName {
	
	name = itemName;
	description = itemDescription;
	
	thumbnail = imgName;
	
	turretImage = @"barrel.png";
		
	return self;
}



- (void)dealloc {
    [super dealloc];
}


@end
