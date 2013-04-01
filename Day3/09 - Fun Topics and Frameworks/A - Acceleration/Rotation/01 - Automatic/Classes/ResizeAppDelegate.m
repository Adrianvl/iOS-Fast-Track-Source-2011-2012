//
//  ResizeAppDelegate.m
//  Resize
//
//  Created by noutram on 07/06/2010.
//  Copyright University of Plymouth 2010. All rights reserved.
//

#import "ResizeAppDelegate.h"

@implementation ResizeAppDelegate

@synthesize window;
@synthesize mvc;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	mvc = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
	window.rootViewController = mvc;
    [mvc release];
    
    [window makeKeyAndVisible];
	
    
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
