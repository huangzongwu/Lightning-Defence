//
//  Drop.h
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-15.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Drop : UIImageView {
	int size;
	BOOL canCollide;
}

@property int size;
@property BOOL canCollide;

// Initialization
- (id)initDrop;

// Actions
- (void)moveWithWind:(float)wind interval:(float)interval;

// Collisions
- (BOOL)checkCollision:(CGRect)rect;
- (void)collided;
@end
