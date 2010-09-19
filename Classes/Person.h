//
//  Person.h
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-17.
//  Copyright 2010 Bloq Software. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Person : UIImageView {
	int speed;
	int moveDirection;
		
}

@property int speed;

- (id)initPerson;
- (void)movingLeft;
- (void)movingRight;
- (void)move:(float)interval;
@end
