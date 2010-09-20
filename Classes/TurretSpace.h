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
	id turretType;
	
	float rotation;
	
	
	id <TurretSpaceDelegate> delegate;
	UIImageView *backgroundImage;
}

+ (double)distanceBetweenA:(CGPoint)a andB:(CGPoint)b;
+ (double)angleBetweenA:(CGPoint)a andB:(CGPoint)b;
+ (double)degToRad:(double)deg;
+ (double)radToDeg:(double)rad;

@property float rotation;
@property (nonatomic, retain) id turretType;
@property (nonatomic, retain) Turret *turret;
@property (nonatomic, retain) id <TurretSpaceDelegate> delegate;
@end
