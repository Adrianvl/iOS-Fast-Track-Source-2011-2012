//
//  NSOperationDemoAppDelegate.h
//  NSOperationDemo
//
//  Created by Nicholas Outram on 20/07/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NSOperationDemoViewController;

@interface NSOperationDemoAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet NSOperationDemoViewController *viewController;

@end
