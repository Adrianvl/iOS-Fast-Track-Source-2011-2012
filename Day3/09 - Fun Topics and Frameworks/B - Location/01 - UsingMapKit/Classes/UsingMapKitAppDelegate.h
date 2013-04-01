//
//  UsingMapKitAppDelegate.h
//  UsingMapKit
//
//  Created by Nicholas Outram on 01/04/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MapViewController;

@interface UsingMapKitAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	MapViewController *mapVC;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) MapViewController *mapVC;

@end

