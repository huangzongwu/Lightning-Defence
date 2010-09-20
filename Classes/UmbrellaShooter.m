//
//  UmbrellaShooter.m
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-20.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import "UmbrellaShooter.h"

#define topRotationBound 3.0
#define bottomRotationBound 70.0

@implementation UmbrellaShooter


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		counterClockWise = 1;
		backgroundImage.image = [UIImage imageNamed:@"barrel.png"];
		NSLog(@"worked??????");
	}
    return self;
}

#pragma mark Turret moving / shooting
- (void)followDrop:(Drop *)drop {
	rotation = [TurretSpace angleBetweenA:drop.frame.origin andB:self.frame.origin];
	backgroundImage.transform = CGAffineTransformMakeRotation(rotation);
}

- (Drop *)trackNearestDrop:(NSMutableSet *)drops {
	
	if (drops.count <= 0) { return nil; }
	Drop *tentativeDrop = [drops anyObject];
	[drops removeObject:tentativeDrop];
	double distance = [TurretSpace distanceBetweenA:tentativeDrop.frame.origin andB:self.frame.origin];
	
	
	for (Drop *someDrop in drops)
	{
		if (someDrop.frame.origin.y + 15 < self.frame.origin.y) {
			double dist = [TurretSpace distanceBetweenA:someDrop.frame.origin andB:self.frame.origin];
			if (dist < distance) {
				tentativeDrop = someDrop;
				distance = dist;
			}
		}
	}
	
	return tentativeDrop;	 
}

- (void)passiveRotate:(float)interval {
	if (fabs([TurretSpace radToDeg:rotation]) >= 87) { counterClockWise = -1; }
	else if (fabs([TurretSpace radToDeg:rotation] <= 3)) { counterClockWise = 1; }
	rotation = rotation + [TurretSpace degToRad:90] * (interval / 2) * counterClockWise;
	backgroundImage.transform = CGAffineTransformMakeRotation(rotation);
}

- (void)dealloc {
    [super dealloc];
}


@end
