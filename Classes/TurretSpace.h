//
//  TurretSpace.h
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-17.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Turret.h"

@protocol TurretSpaceDelegate
@required
- (void)showGameMenu:(id)turretSpace;

@end


@interface TurretSpace : UIView {
	
	Turret *turret;
	
	float rotation;
	int counterClockWise;
	
	
	id <TurretSpaceDelegate> delegate;
	UIImageView *backgroundImage;
}

// Turret tracking / shooting
- (Drop *)trackNearestDrop:(NSMutableSet *)drops;
- (void)followDrop:(Drop *)drop;
- (void)passiveRotate:(float)interval;

+ (double)distanceBetweenA:(CGPoint)a andB:(CGPoint)b;

@property float rotation;
@property (nonatomic, retain) Turret *turret;
@property (nonatomic, retain) id <TurretSpaceDelegate> delegate;
@end
