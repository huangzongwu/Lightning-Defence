//
//  TurretSpace.m
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-17.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import "TurretSpace.h"
#import "Turret.h"


@implementation TurretSpace
@synthesize delegate;
@synthesize turret;
@synthesize rotation;


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		
		rotation = 0.7853982;
		counterClockWise = 1;
		
		//UI
		backgroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
		[self addSubview:backgroundImage];
		[backgroundImage release];
		backgroundImage.image = [UIImage imageNamed:@"box.png"];
		
		// Turret Info
		turret = [[Turret alloc] initWithName:@"Empty Turret" description:@"Please choose a turret" thumbnail:@"nil.png"];
		
	}
    return self;
}

- (void)setTurret:(id)turretType {
	turret = turretType;
	
	backgroundImage.image = [UIImage imageNamed:((Turret *)turretType).turretImage];
}

#pragma mark Math Helpers
+ (double)distanceBetweenA:(CGPoint)a andB:(CGPoint)b	{
	return fabs(sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y)));
}

+ (double)angleBetweenA:(CGPoint)a andB:(CGPoint)b {
	if ((a.y - b.y) == 0) { return 0; }
	else { return atan((a.x - b.x) / (a.y - b.y)); }
}

+ (double)degToRad:(double)deg {return deg * (M_PI / 180);}
+ (double)radToDeg:(double)rad {return rad * (180 / M_PI);}

#pragma mark Turret moving / shooting
- (void)followDrop:(Drop *)drop {
	rotation = -[TurretSpace angleBetweenA:drop.frame.origin andB:self.frame.origin];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[delegate showGameMenu:self];
}


- (void)dealloc {
    [super dealloc];
}


@end
