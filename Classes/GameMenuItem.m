//
//  GameMenuItem.m
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-17.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import "GameMenuItem.h"
#import "Turret.h"


@implementation GameMenuItem
@synthesize delegate;
@synthesize name;
@synthesize description;
@synthesize thumbnail;
@synthesize turretType;

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        // Initialization code
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[delegate choseItem:self];
}

- (id)initWithFrame:(CGRect)frame turret:(Turret *)turret {
	
	turretType = turret;
	
	name = turret.name;
	description = turret.description;
	
	[self initWithFrame:frame];
	
	thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)];
	thumbnail.image = [UIImage imageNamed:turret.thumbnail];
	[self addSubview:thumbnail];
	return self;
}

- (void)dealloc {
    [super dealloc];
}


@end
