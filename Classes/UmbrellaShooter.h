//
//  UmbrellaShooter.h
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-20.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TurretSpace.h"

@interface UmbrellaShooter : TurretSpace {
	int counterClockWise;
}

// Turret tracking / shooting
- (Drop *)trackNearestDrop:(NSMutableSet *)drops;
- (void)followDrop:(Drop *)drop;
- (void)passiveRotate:(float)interval;

@end
