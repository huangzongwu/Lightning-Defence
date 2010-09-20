//
//  Umbrella.h
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-19.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TurretSpace.h"


@interface Umbrella : UIImageView {
	float distanceTillOpen;
	float angle;
	float speed;	
	BOOL open;
}


- (id)initFromTurret:(TurretSpace *)turret;
- (void)moveWithWind:(float)wind interval:(float)interval;
@end
