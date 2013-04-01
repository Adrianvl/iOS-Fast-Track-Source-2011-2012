//
//  MyAppAppDelegate.h
//  MyApp
//
//  Created by noutram on 27/12/2009.
//  Copyright University of Plymouth 2009. All rights reserved.
//
#import "DesignViewController.h"

#import <UIKit/UIKit.h>

@interface MyAppAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UINavigationController *nc;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) UINavigationController *nc;
@end

