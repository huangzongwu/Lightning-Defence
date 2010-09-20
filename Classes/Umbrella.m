//
//  Umbrella.m
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-19.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import "Umbrella.h"
#import "TurretSpace.h"

@implementation Umbrella
@synthesize inUse;

#define gravity 9.81
#define umbrellaSize 5.0

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (id)initFromTurret:(TurretSpace *)turret {
	
	distanceTillOpen = 200.0;
	speed = 150.0;
	angle = turret.rotation;
	open = FALSE;
	inUse = FALSE;
	
	[self initWithFrame:[turret superview].frame];
	
	self.transform = CGAffineTransformMakeRotation(angle);

	self.image = [UIImage imageNamed:@"umbrella_closed.png"];
	
	return self;
}

- (BOOL)checkCollision:(CGRect)rect {
	return CGRectIntersectsRect(rect, self.frame);
}

- (void)moveWithWind:(float)wind interval:(float)interval {
	
	if (inUse) {return;}
	
	if (distanceTillOpen <= 0.0 && !open) {
		open = TRUE;
		self.transform = CGAffineTransformMakeRotation(0);
		self.image = [UIImage imageNamed:@"umbrella_open.png"];

	}
	
	float xMovement;
	float yMovement;
	if (!open){
		float dMovement = (interval * speed);
		double someAngle = fabs(angle);
		xMovement = dMovement * sin(someAngle);
		yMovement = dMovement * cos(someAngle);
		
		CGPoint movement = CGPointMake(xMovement, yMovement);
		CGPoint newCenter = CGPointMake(self.center.x+movement.x, self.center.y-movement.y);
		self.center = newCenter;
		
		distanceTillOpen -= dMovement;
		//NSLog(@"distance tll open: %f",distanceTillOpen);
	}
	else {
		xMovement = 0;
		yMovement = 1;	
		
		CGPoint movement = CGPointMake(xMovement, yMovement);
		CGPoint newCenter = CGPointMake(self.center.x+movement.x, self.center.y+movement.y);
		self.center = newCenter;
	}
}
- (void)dealloc {
    [super dealloc];
}


@end
