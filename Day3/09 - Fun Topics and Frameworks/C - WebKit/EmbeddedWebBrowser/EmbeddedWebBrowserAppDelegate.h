//
//  EmbeddedWebBrowserAppDelegate.h
//  EmbeddedWebBrowser
//
//  Created by Nicholas Outram on 22/06/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
@interface EmbeddedWebBrowserAppDelegate : NSObject <UIApplicationDelegate> {
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (readwrite, nonatomic, retain) MainViewController *mainVC;
@end
