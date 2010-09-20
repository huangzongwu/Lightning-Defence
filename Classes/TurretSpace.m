//
//  TurretSpace.m
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-17.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import "TurretSpace.h"
#import "Turret.h"
#import "UmbrellaShooter.h"

@implementation TurretSpace
@synthesize delegate;
@synthesize turret;
@synthesize turretType;
@synthesize rotation;


- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
		
		rotation = 0.7853982;
		
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

- (void)setTurret:(id)typeOfTurret {
	turret = typeOfTurret;
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



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[delegate showGameMenu:self];
}


- (void)dealloc {
    [super dealloc];
}


@end
