//
//  Turret.h
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-18.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drop.h"


@interface Turret : NSObject {
	NSString *name;
	NSString *description;
	NSString *thumbnail;
	NSString *turretImage;
	
	CGPoint position;
	float rotation;
}


@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *thumbnail;
@property (nonatomic, retain) NSString *turretImage;

@property CGPoint position;
@property float rotation;


// Turret Types
+ (id)emptyTurret;
+ (id)umbrellaDispenser;
+ (id)lightningRod;

- (id)initWithName:(NSString *)itemName description:(NSString *)itemDescription thumbnail:(NSString *)imgName;

@end
