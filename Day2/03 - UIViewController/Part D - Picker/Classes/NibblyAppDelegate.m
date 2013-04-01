//
//  NibblyAppDelegate.m
//  Nibbly
//
//  Created by noutram on 05/02/2010.
//  Copyright University of Plymouth 2010. All rights reserved.
//

#import "NibblyAppDelegate.h"


@implementation NibblyAppDelegate

@synthesize window, mainVC;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    // Override point for customization after application launch
	mainVC = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    [window setRootViewController:mainVC];
    [mainVC release];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
