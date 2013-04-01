//
//  NibblyAppDelegate.m
//  Nibbly
//
//  Created by noutram on 05/02/2010.
//  Copyright University of Plymouth 2010. All rights reserved.
//

#import "NibblyAppDelegate.h"


@implementation NibblyAppDelegate

@synthesize window, mrNibbles;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
	mrNibbles = [[NibblyController alloc] init];
    [window addSubview:mrNibbles.view];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
