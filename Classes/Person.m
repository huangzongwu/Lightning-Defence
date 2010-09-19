//
//  Person.m
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-17.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import "Person.h"


@implementation Person
@synthesize speed;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (id)initPerson {
	speed = 200;
	moveDirection = 1;
	[self initWithFrame:CGRectMake(50, 380, 40, 80)];
	self.image = [UIImage imageNamed:@"player.png"];
	return self;
}

- (void)move:(float)interval {
	float xMovement = speed * interval;	
	self.frame = CGRectMake(self.frame.origin.x + (moveDirection * xMovement), self.frame.origin.y, self.frame.size.width, self.frame.size.height);

}

- (void)movingLeft {
	moveDirection = -1;
}

- (void)movingRight {
	moveDirection = 1;
}

- (void)dealloc {
    [super dealloc];
}


@end
