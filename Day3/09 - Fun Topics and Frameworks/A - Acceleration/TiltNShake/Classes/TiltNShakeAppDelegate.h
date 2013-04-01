//
//  TiltNShakeAppDelegate.h
//  TiltNShake
//
//  Created by noutram on 18/05/2010.
//  Copyright University of Plymouth 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface TiltNShakeAppDelegate : NSObject <UIApplicationDelegate> {
	MainViewController *mvc;
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mvc;
@end

