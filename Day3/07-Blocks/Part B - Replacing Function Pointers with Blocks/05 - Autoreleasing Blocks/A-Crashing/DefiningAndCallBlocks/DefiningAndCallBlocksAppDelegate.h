//
//  DefiningAndCallBlocksAppDelegate.h
//  DefiningAndCallBlocks
//
//  Created by Nicholas Outram on 14/07/2011.
//  Copyright 2011 University of Plymouth. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MYMAXFACTORIAL 20

@interface DefiningAndCallBlocksAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *_window;
}

@property(readwrite, nonatomic, retain) IBOutlet UIWindow *window;

@end
