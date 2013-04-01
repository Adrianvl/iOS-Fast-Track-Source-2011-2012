//
//  ResizeAppDelegate.h
//  Resize
//
//  Created by noutram on 07/06/2010.
//  Copyright University of Plymouth 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface ResizeAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	MainViewController *mvc;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MainViewController *mvc;

@end

