//
//  CustomViewAppDelegate.m
//  CustomView
//
//  Created by noutram on 05/02/2010.
//  Copyright University of Plymouth 2010. All rights reserved.
//

#import "CustomViewAppDelegate.h"

@implementation CustomViewAppDelegate

@synthesize window, boxView;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    

    // Override point for customization after application launch
    boxView = [[Boxes alloc] initWithFrame:[window bounds]];
	[boxView setBackgroundColor:[UIColor clearColor]];	//Transparent view
    [window addSubview:boxView];
    [boxView release];
    [window makeKeyAndVisible];
	
	return YES;
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
