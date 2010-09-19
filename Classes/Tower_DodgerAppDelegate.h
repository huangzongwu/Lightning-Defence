//
//  Tower_DodgerAppDelegate.h
//  Tower Dodger
//
//  Created by David Villarreal on 10-09-15.
//  Copyright Bloq Software 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Tower_DodgerViewController;

@interface Tower_DodgerAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    Tower_DodgerViewController *viewController;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet Tower_DodgerViewController *viewController;


@end

