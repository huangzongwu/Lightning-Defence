//
//  Drop.m
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-15.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import "Drop.h"

#define max_position_x 300
#define gravity 9.81
#define collisionBound 200;

@implementation Drop
@synthesize size;
@synthesize canCollide;


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (void)moveWithWind:(float)wind interval:(float)interval {
	float xMovement = (wind / size) * (interval * 8);
	float yMovement = gravity * size * (interval * 8);
	self.frame = CGRectMake(self.frame.origin.x + xMovement, self.frame.origin.y + yMovement, self.frame.size.width, self.frame.size.height);
	
	if (self.frame.origin.y + self.frame.size.height) { 
		canCollide = TRUE; 
	}
}

- (float)width {
	return size * 5;
}

- (float)height {
	return size * 7.5;
}

- (BOOL)checkCollision:(CGRect)rect {
	return CGRectIntersectsRect(rect, self.frame);
}

- (void)collided {
	[self removeFromSuperview];
}

- (id)initDrop {
	
	canCollide = FALSE;
	
	int position = (arc4random() % max_position_x);
	int randsize = (arc4random() % 5) + 2;	
	
	size = randsize;
	
	[self initWithFrame:CGRectMake(position,0,[self width],[self height])];
	self.image = [UIImage imageNamed:@"drop.png"];
	
	return self;
}

- (void)dealloc {
    [super dealloc];
}


@end
