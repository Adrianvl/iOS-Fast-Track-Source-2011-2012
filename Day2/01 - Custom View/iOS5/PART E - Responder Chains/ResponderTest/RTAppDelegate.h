//
//  RTAppDelegate.h
//  ResponderTest
//
//  Created by Nicholas Outram on 11/10/2011.
//  Copyright (c) 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyWindow.h"

@class RTViewController;

@interface RTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) MyWindow *window;

@property (strong, nonatomic) RTViewController *viewController;

@end
