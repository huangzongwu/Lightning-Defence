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

#define gravity 9.81
#define umbrellaSize 5.0

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (id)initFromTurret:(TurretSpace *)turret {
	
	distanceTillOpen = 100.0;
	speed = 100.0;
	angle = turret.rotation;
	open = FALSE;
	
	[self initWithFrame:turret.frame];
	
	self.transform = CGAffineTransformMakeRotation(angle);

	self.image = [UIImage imageNamed:@"barrel.png"];
	
	return self;
}

- (void)moveWithWind:(float)wind interval:(float)interval {
	float xMovement;
	float yMovement;
	if (!open){
		xMovement = (interval * speed) * sin(angle);
		yMovement = (interval * speed) * cos(angle);
		CGAffineTransform movement = CGAffineTransformMakeTranslation(xMovement, -yMovement);
		self.transform = CGAffineTransformConcat(movement, self.transform);
	}
	else {
		xMovement = (speed / wind) * (interval * 30);
		yMovement = gravity * umbrellaSize * (interval * 8);		
	}
}
- (void)dealloc {
    [super dealloc];
}


@end
